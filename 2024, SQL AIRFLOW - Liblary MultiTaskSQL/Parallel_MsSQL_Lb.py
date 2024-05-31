"""

*************************************************************************************************

*INFO - Оператор многопоточности для MS SQL. Позволяет запускать несколько SQL запросов одноврменно по группам    *

*Author - Олифир П.Г.                                                                           *

*Date Created - 2024-05-08                                                                      *

*Version 1.0.                                                                                   *

*************************************************************************************************

"""

 

from threading import Thread, Semaphore

import datetime

from airflow.providers.microsoft.mssql.hooks.mssql import MsSqlHook

 

max_active_parallel = Semaphore(4) #Глобальная переменная для регулировки макс.кол-ва потоков, 4 по умолчанию

class Parallel_MsSQL_Lb:

 

    def __init__(self, connection_id: str, command: list, max_parallel: bytes = 4):

        self.connection_id = connection_id #Проверки по коннекту намерено нет, так как лучше упасть, чем выполнить код не в той БД. Путь самурая.

        self.command = command

        self.max_parallel = max_parallel if (max_parallel > 0) else 4

 

        print(

            f"connection_id = {self.connection_id},"

            f"Command List = {self.command},"

            f"Count thread = {self.max_parallel}"

        )

 

    #Функция запуска SQL кода (если переделывать класс на многопоточность в другой системе, треба поменять только эту функцию

    def __calcThreadCode(sqlcode,conn_id):

 

       try:

            max_active_parallel.acquire()

 

            start_time = datetime.datetime.now().strftime('%H:%M:%S')

            print(f"Start_time = {start_time},"

                  f"Connection = {conn_id},"

                  f"Command_start = {sqlcode}")

 

            mssql_hook = MsSqlHook(conn_id)

            mssql_hook.run(sqlcode,autocommit = True)

 

            start_time = datetime.datetime.now().strftime('%H:%M:%S')

            print(f"End_time = {start_time},"

                  f"Connection = {conn_id},"

                  f"Command_end = {sqlcode}")

 

            max_active_parallel.release()

       except:

           start_time = datetime.datetime.now().strftime('%H:%M:%S')

           print(f"Time_Error = {start_time},"

                 f"Connection = {conn_id},"

                 f"Error connect to database or sqlCode,"

                 f"Command_error = {sqlcode}")

           raise RuntimeWarning from None

 

 

 

    #Функция запуска передаваемого SQL кода

    def calc(self):

 

        global max_active_parallel

        max_active_parallel = Semaphore(self.max_parallel) #Перепресваиваем кол-во одновременных потоков (при необходимости)

 

        #Собираем все команды в поток для расчета процедурой

        thread_code =[Thread(target=Parallel_MsSQL_Lb.__calcThreadCode, args=(code,self.connection_id)) for code in self.command]

 

        #Запускаем все потоки сразу (ограничение на кол-во формирует Semaphore уже после запуска всех потоков)

        for threads in thread_code:

            threads.start()

 

        #Закрываем запущенные процессы после окончания работы

        for threads in thread_code:

            threads.join()