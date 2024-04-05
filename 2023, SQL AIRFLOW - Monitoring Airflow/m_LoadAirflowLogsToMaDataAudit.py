
import re
import psycopg2
from datetime import datetime
import socket
import pymssql
from airflow.providers.microsoft.mssql.hooks.mssql import MsSqlHook
from airflow.hooks.base import BaseHook
from airflow.hooks.postgres_hook import PostgresHook

def createMessage(eventType,action,ip,path):
    msg = "NotData"
    
    if (eventType.lower() == 'get') :
        msg = "AIRFLOW-RTO.READ.Пользователь " + ip + " запустил DAG " + path

    elif ((eventType.upper() == 'EXECVE') & (action.find('dag') > 0)):
        msg = "AIRFLOW-RTO.READ: На сервере " + ip + " было чтение объекта " + action

    elif (eventType.lower() == 'post') :
        msg = "AIRFLOW-RTO.DELETE.Пользователь " + ip + " удалил DAG " + path

    elif ( (eventType.upper() == 'SERVICE_STOP') & (action.find('airflow-worker') > 0)):
        msg = "AIRFLOW-RTO.SERVICE_STOP: На сервере " + ip + " была остановка системы"

    elif ((eventType.upper() == 'EXECVE') & (action.find('/apps/') > 0)):
        msg = "AIRFLOW-RTO.CWD_APPS: На сервере " + ip + " произведен запуск (компонента, сервиса, инстанса) " + action[action.find('cwd='):]

    elif ((eventType.upper() == 'CWD') & (action.find('/var/log') > 0)):
        msg = "AIRFLOW-RTO.CWD_LOG: На сервере " + ip + " произведена манипуляция с логами " + action[action.find('cwd='):]
        
    elif ((eventType.upper() == 'CWD') & (action.find('.cfg') > 0)):
        msg = "AIRFLOW-RTO.CWD: На сервере " + ip + " было изменение конф.файлов в директории " + action[action.find('name='):action.find('inode=')] + " пользователем " + getLogin(action)
        
    elif ((eventType.upper() == 'PATH') & (action.find('.cfg') > 0)):
        msg = "AIRFLOW-RTO.CWD: На сервере " + ip + " было изменение конф.файлов в директории " + action[action.find('name='):action.find('inode=')] + " пользователем " + getLogin(action)
        
    elif ((eventType.upper() == 'EXECVE') & (action.find('audit') > 0) & (action.find('dag') == 0)):
        msg = "AIRFLOW-RTO.CLEAR_JOURNAL: На сервере " + ip + " произведена очистка журнала событий " + action

    elif ((eventType.upper() == 'PATH') & (action.find('kaspersky') < 0) & (action.find('dags/__pycache') < 0) & (action.find('.tmp') < 0) & (action.find('home/ucmdbdis') < 0) & (action.find('usr/bin') < 0) & (action.find('usr/local') < 0) & (action.find('usr/local') < 0) & (getLogin(action) != 'airflow') & (getLogin(action) != 'root')):
        msg = "AIRFLOW-RTO.PATH: На сервере " + ip + " было копирование/изменение объекта в директории " + action[action.find('name='):action.find('inode=')] + " пользователем " + getLogin(action)
        
    elif ((eventType.upper() == 'SERVICE_START') & (action.find('airflow-worker') > 0)):
        msg = "AIRFLOW-RTO.SERVICE_START: На сервере " + ip + " был запуск системы"

    elif (eventType.upper() == 'CRYPTO_KEY_USER'):
        msg = "AIRFLOW-RTO.USER_LOGIN: На сервере " + ip + " был выполнен вход пользователя " + getLogin(action)

    return msg

def getMaxId():
    mssql_hook = MsSqlHook('ACRMSAS')
    df = mssql_hook.get_pandas_df(sql = 'select max(ID) as ID from acrmsas.PA.DATA_AUDIT')

    return int(df['ID'].iloc[0])

def execSqlScript(sqlscript):
    mssql_hook = MsSqlHook('ACRMSAS')
    mssql_hook.run(sqlscript)
    return True

def getLogin(code):

    if (code.upper().rfind('OUID=') > 0) & (code.upper().rfind('OGID=') > 2) & (code.upper().rfind('OUID=') < code.upper().rfind('OGID=')):
        login = code[code.upper().rfind('OUID=')+6:code.upper().rfind('OGID=')-2]

    elif ((code.upper().rfind('AUID=') > 0) & (code.upper().rfind(' ID=') > 2) & (code.upper().rfind('AUID=') < code.upper().rfind('ID='))):
        login = code[code.upper().rfind('AUID=')+6:code.upper().rfind('ID=')-2]

    elif (code.upper().rfind('AUID=') > 0) & (code.upper().rfind('SUID=') > 2) & (code.upper().rfind('AUID=') < code.upper().rfind('SUID=')):
        login = code[code.upper().rfind('AUID=')+6:code.upper().rfind('SUID=')-2]

    elif (code.upper().rfind('UID=') > 0) & (code.upper().rfind('AUID=') > 2) & (code.upper().rfind('UID=') < code.upper().rfind('AUID=')):
        login = code[code.upper().rfind('UID=')+4:code.upper().rfind('AUID=')-2]
    else:
        login = '***'

    return login

def getIP():

    h_name = socket.gethostname()
    IP_addres = socket.gethostbyname(h_name)

    return IP_addres

def getDNS(code):

    h_name = socket.gethostname()
    IP_addres = socket.gethostbyname(h_name)

    return(socket.getfqdn(IP_addres))

def getHost(code):

    return socket.gethostname()

def sqlInsertDataAudit(id,ts,soucever,sourcename,sourcepath,slogin,sdomain,sip,smac,sdns,shostname,ulogin,udomain,uip,umac,udns,uhostname,code,pcode,sport,uport,sprotocol,uprotocol,sdate,udate,message,prname,result,metadataid):
    sql =  "INSERT INTO acrmsas.[PA].[DATA_AUDIT] ([ID],[TS],[SOURCENAME],[SOURCEVER],[SOURCEPATH],[SLOGIN],[SDOMAIN],[SIP],[SMAC],[SDNS],[SHOSTNAME],[ULOGIN],[UDOMAIN],[UIP],[UMAC],[UDNS],[UHOSTNAME],[CODE],[PCODE],[SPORT],[UPORT],[SPROTOCOL],[UPROTOCOL],[SDATE],[UDATE],[MESSAGE],[PRNAME],[RESULT],[METADATAID]) VALUES ("
    sql += "cast(" + str(id) + " as numeric(19,0))" + "," if (str(id) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(ts) + "' as datetime2(7))" + "," if (str(ts) not in ('','0')) else 'getdate(),'
    sql += "cast('" + str(sourcename).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(sourcename) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(soucever).replace('"',"'").replace("'","") + "' as varchar(20))" + "," if (str(soucever) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(sourcepath).replace('"',"'").replace("'","") + "' as varchar(255))" + "," if (str(sourcepath) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(slogin).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(slogin) not in ('','***','0')) else 'NULL,'
    sql += "cast('" + str(sdomain).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(sdomain) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(sip).replace('"',"'") .replace("'","")+ "' as varchar(15))" + "," if (str(sip) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(smac).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(smac) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(sdns).replace('"',"'").replace("'","") + "' as varchar(100))" + "," if (str(sdns) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(shostname).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(shostname) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(ulogin).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(ulogin) not in ('','***','0')) else 'NULL,'
    sql += "cast('" + str(udomain).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(udomain) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(uip).replace('"',"'").replace("'","") + "' as varchar(15))" + "," if (str(uip) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(umac).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(umac) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(udns).replace('"',"'").replace("'","") + "' as varchar(100))" + "," if (str(udns) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(uhostname).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(uhostname) not in ('','0')) else 'NULL,'
    sql += "cast(" + str(code) + " as int)" + "," if (str(code) not in ('','0')) else 'NULL,'
    sql += "cast(" + str(pcode) + " as int)" + "," if (str(pcode) not in ('','0')) else 'NULL,'
    sql += "cast(" + str(sport) + " as int)" + "," if (str(sport) not in ('','0')) else 'NULL,'
    sql += "cast(" + str(uport) + " as int)" + "," if (str(uport) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(sprotocol).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(sprotocol) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(uprotocol).replace('"',"'").replace("'","") + "' as varchar(40))" + "," if (str(uprotocol) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(sdate) + "' as datetime2(7))" + "," if (str(sdate) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(udate) + "' as datetime2(7))" + "," if (str(udate) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(message).replace('"',"'") .replace("'","")+ "' as varchar(4000))" + "," if (str(message) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(prname).replace('"',"'").replace("'","") + "' as varchar(1000))" + "," if (str(prname) not in ('','0')) else 'NULL,'
    sql += "cast("  + str(result) + " as smallint)" + "," if (str(result) not in ('','0')) else 'NULL,'
    sql += "cast('" + str(metadataid).replace('"',"'").replace("'","") + "' as varchar(256))" if (str(metadataid) not in ('','0')) else 'NULL'
    sql += ')\n'
    return sql

def loadLogfile(log_file_path,log_file_name):

    #Задаем регулярное выражение для чтения лог файла (разбиванием на группы)

    regex = re.compile(r"""node=(?P<ip>.*?) type=(?P<eventType>.*?) msg=audit\((?P<dttm>.*?)\:(?P<id_event>.*?)\)\: (?P<action>.*)""",re.MULTILINE)
    sql = ''

    maxId = getMaxId()

    lost_dttm = getMaxDateFromPaAudit("where sourcename like '%" + log_file_name + "%'")


    #Читаем лог, заполняем массив разбитыми значениями
    with open(log_file_path+log_file_name) as f:
         for line in f:
             match = regex.match(line)

             if match:

                if datetime.strptime(lost_dttm, '%Y-%m-%d %H:%M:%S') <= datetime.fromtimestamp(float(match.group("dttm"))) :

                    msg = createMessage(match.group("eventType"),match.group("action"),match.group("ip"),'')

                    if (msg != 'NotData') > 0:
                         
                         maxId += 1
                         sql += sqlInsertDataAudit(maxId,#ID
                                                  '', #TS
                                                  '1', #SOURCENAME
                                                  log_file_name, #SOURCEVER
                                                  log_file_path, #SOURCEPATH
                                                  getLogin(match.group("action")), #SLOGIN
                                                  'int.gazprombank.ru', #SDOMAIN
                                                  getIP(), #SIP
                                                   '', #SMAC
                                                   log_file_name, #SDNS
                                                   getHost(match.group("action")), #SHOSTNAME
                                                   getLogin(match.group("action")), #ULOGIN
                                                   '', #UDOMAIN
                                                   match.group("ip"), #UIP
                                                   '', #UMAC
                                                   '', #UDNS
                                                   '', #UHOSTNAME
                                                   '', #CODE ????
                                                   '', #PCODE
                                                   '', #SPORT
                                                   '', #UPORT
                                                   '', #SPROTOCOL
                                                   '', #UPROTOCOL
                                                   str(datetime.fromtimestamp(float(match.group("dttm")))), #SDATE
                                                   str(datetime.fromtimestamp(float(match.group("dttm")))), #UDATE
                                                   msg, #MESSAGE
                                                   '', #PRNAME
                                                   '0', #RESULT
                                                   '' #METADATAID
                                                  )
    if (sql != ''):
        execSqlScript(sql)

    return "SUCCESS LOAD " + log_file_name

def getMaxDateFromPaAudit(where):
    mssql_hook = MsSqlHook('ACRMSAS')
    
    sqlcode = "select cast(coalesce(MAX(dateadd(ms,1, TS)),'2022-08-24 10:59:39.1772010') as smalldatetime) as dttm from ACRMSAS.PA.DATA_AUDIT " + where
    
    df = mssql_hook.get_pandas_df(sql = sqlcode)

    return str(df['dttm'].iloc[0])

def getSqlEventAirflow(eventType):
 
    postgres = PostgresHook(postgres_conn_id='AIRFLOW_DATABASE')
    conn = postgres.get_conn()
    cursor = conn.cursor()
    
    sql = ''
    
    if (eventType.upper() == 'USER_LOGIN_AIRFLOW'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.USER_LOGIN_AIRFLOW%' or message like '%AIRFLOW-RTO.USER_ERROR_LOGIN_AIRFLOW%'")
        sql = 'SELECT day_id, username, id, first_name, last_name,  "password", active, email, coalesce(last_login,day_id) as last_login, coalesce(login_count,0), coalesce(fail_login_count,0), created_on, changed_on, created_by_fk, changed_by_fk from public.udf_ab_user_history where day_id > ' + "'" + dttm + "' order by day_id"
    
    elif (eventType.upper() == 'READ'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.READ%' or message like '%AIRFLOW-RTO.DELETE%'")
        sql = "select min(dttm) as dttm, owner, event, dag_id from public.log where event in ('task_instances','delete') and  dttm > '" + dttm + "' group by dag_id, owner, event order by dttm"
    
    elif (eventType.upper() == 'DAG'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.SUCCESS_DAG%' or message like '%AIRFLOW-RTO.ERROR_DAG%'")
        sql = "select updated_at, '' as owner, dag_id,  state as event, start_date as dttm from public.dag_run where updated_at >'" + dttm + "'"
    
    elif (eventType.upper() == 'LOCK'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.LOCK%' or message like '%AIRFLOW-RTO.UNLOCK%'")
        sql = "select day_id,	username, active, PrevActive, case when active is true and prevactive is false then 'unlock' else 'lock' end AllowActive from (select day_id,	username, active, coalesce(lag(active) over (partition by username order by day_id) , active) as PrevActive from public.udf_ab_user_history ) as s1 where (PrevActive <> active) and day_id >'" + dttm + "'"
    
    elif (eventType.upper() == 'DELETE'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.USER_DELETE%'")
        sql = "select day_id, last.username, last.id from public.udf_ab_user_history as last left join (select id from public.ab_user ) as now on now.id = last.id where now.id is null and day_id > '" + dttm + "'"
    
    elif (eventType.upper() == 'USER_CREATE'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.USER_CREATE%'")
        sql = "select distinct created_on,username from public.udf_ab_user_history auh where created_on  >'" + dttm + "'"        

    elif (eventType.upper() == 'USER_NEW_PASSWORD'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.USER_NEW_PASSWORD%'")
        sql = "select day_id,	username, password, PrevPassword, case when password <> PrevPassword then 'newpassword' else 'oldpassword' end EventPassword from (select day_id, username, password, coalesce(lag(password) over (partition by username order by day_id) , password) as PrevPassword from public.udf_ab_user_history ) as s1 where (password <> PrevPassword) and day_id >'" + dttm + "'"

    elif (eventType.upper() == 'NEW_ROLE'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.NEW_ROLE%'")
        sql = "select day_id, '' as username, name as name_role from public.udf_ab_role_trigger where status = 'NEW_ROLE' and day_id  >'" + dttm + "'" 

    elif (eventType.upper() == 'DROP_ROLE'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.DROP_ROLE%'")
        sql = "select max(day_id) as day_id, '' as username , pr.role_id, max(pr.name_role) as name_role from public.udf_permission_role_users_view_history pr left join public.ab_role ar on ar.id  = pr.role_id where ar.id is null and pr.role_id is not null and day_id > '" + dttm + "' group by pr.role_id" 
 
    elif (eventType.upper() == 'NEW_PERMISSIONS_ROLE'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.NEW_PERMISSIONS_ROLE%'")
        sql = "select current_timestamp as day_id, 'airflow' as username, now.name_role, 'ADD_PERMESSIONS' as event, now.permissions from ( select distinct role_id, name_role , permission_id , view_menu_id , permissions from public.udf_v_permission_role_users ) as now join (select distinct role_id, name_role , permission_id , view_menu_id , permissions from public.udf_permission_role_users_view_history where permission_id is not null and view_menu_id is not null and day_id > '" + dttm + "' ) as old on old.role_id = now.role_id and old.permission_id = now.permission_id and old.view_menu_id = now.view_menu_id union select day_id, 'airflow' as username, old.name_role , 'DELETE_PERMESSIONS' as event, old.permissions from public.udf_permission_role_users_view_history as old left join ( select distinct role_id, name_role , permission_id , view_menu_id , permissions from public.udf_v_permission_role_users ) as now on old.role_id = now.role_id and old.permission_id = now.permission_id and old.view_menu_id = now.view_menu_id where now.view_menu_id is null and old.permissions <> ' on ' and old.day_id > '" + dttm + "'"
 
    elif (eventType.upper() == 'NEW_PERMISSIONS_USER'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.DELETE_ROLE_USER%' or message like '%AIRFLOW-RTO.ADD_ROLE_USER%'")
        sql = "select distinct current_timestamp as day_id, now.username, now.name_role, 'ADD_ROLE_USER' as event from public.udf_v_permission_role_users as now join public.udf_permission_role_users_view_history as old on old.role_id = now.role_id and old.permission_id = now.permission_id and old.view_menu_id = now.view_menu_id and old.username = now.username where old.username is not null and old.permission_id is not null and old.view_menu_id is not null and day_id > '" + dttm + "' union select distinct old.day_id, old.username, old.name_role,  'DELETE_ROLE_USER' as event from public.udf_permission_role_users_view_history as old left join public.udf_v_permission_role_users as now on old.role_id = now.role_id and old.permission_id = now.permission_id and old.view_menu_id = now.view_menu_id and old.username = now.username where old.username is not null and now.view_menu_id is null and old.permissions <> ' on ' and old.day_id > '" + dttm + "'"

    elif (eventType.upper() == 'CREATE_CHANGE_DAG'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.CREATE_DAG%' or message like '%AIRFLOW-RTO.CHANGE_DAG%'")
        sql = "select day_id, 'airflow' username, fileloc, last_updated, event_type  from public.udf_dag_code_history where day_id > '" + dttm + "'"

    elif (eventType.upper() == 'DELETE_DAG'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.DELETE_DAG%'")
        sql = "select last_parsed_time as day_id, owners, fileloc from public.dag where is_active = false and  last_parsed_time > '" + dttm + "' union select dttm, owner, dag_id from public.log where event = 'delete' and dttm > '" + dttm + "'"

    elif (eventType.upper() == 'READ_DAG_TASK'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.READ_DAG_TASK%'")
        sql = "select dttm, owner, dag_id,  case when task_id is null then concat('пользователь ',owner,' просматривал Dag ', dag_id, ' в ', dttm, ' категория события ', event) else concat('пользователь ',owner,' производил действия с таской ',task_id,' DAGa ', dag_id, ' в ', dttm, ' категория события ', event) end as event from public.log where dag_id is not null and dttm > '" + dttm + "'"
    
    elif (eventType.upper() == 'CONNECT_TO_BASE'):
        dttm = getMaxDateFromPaAudit("where message like '%AIRFLOW-RTO.CONNECT_TO_BASE%'")
        sql =  """
        select distinct dr.start_date , d.owners, d.dag_id , '' as task_id, c.host as conn_id, c.login
        from public.dag_run dr 
        join public.dag d 
            on d.dag_id = dr.dag_id 
        join public.dag_code dc
            on d.fileloc = dc.fileloc
        cross join public."connection" c 
        where POSITION(c.conn_id in dc.source_code) > 0 and dr.start_date > '
        """ + dttm + "' " + """
        union
        select distinct day_id, owners, dag_id, task_id, conn_id, login
        from (
                select s2.*, c.host as conn_id , c.login , POSITION(c.conn_id in s2.task_code) as pos_con , row_number () over (partition by day_id, dag_id, task_id order by POSITION(c.conn_id in s2.task_code)) as rn
                from (
                    select day_id, owners, dag_id, task_id, substring(dag_code, pos_task, End_pos_task) as task_code
                    from (
                            select * , coalesce(lag(pos_task) over (partition by dag_id order by day_id) , least(pos_task + 1000, Lng_dag)) as End_pos_task
                            from (
                                select ti.start_date as day_id , ti.unixname as owners, di.dag_id, ti.task_id , POSITION(ti.task_id  in di.dag_code) as pos_task , di.dag_code , length(di.dag_code) as Lng_dag
                                from task_instance ti 
                                join
                                    (
                                    select d.dag_id , dc.source_code as dag_code
                                    from public.dag_code dc 
                                    join public.dag d 
                                        on d.fileloc = dc.fileloc 
                                    ) as di 
                                    on di.dag_id = ti.dag_id 
                                where POSITION(ti.task_id  in di.dag_code) > 0	and start_date > '
        """ + dttm + "' " + """
        ) as s0
				 ) as s1
				) as s2
		cross join public."connection" c
		where POSITION(c.conn_id in s2.task_code) > 0
	 ) as s3
        where rn = 1
        """

    cursor.execute(sql)  
    record = cursor.fetchall()

    return record
  
def loadLogFromAirFlowDataBase():

    sql = ''
    maxId = getMaxId()
    msg = 'NotData'
    #massEventKey = ['USER_LOGIN_AIRFLOW','READ','DAG','LOCK','DELETE','USER_CREATE','USER_NEW_PASSWORD','NEW_ROLE','DROP_ROLE','NEW_PERMISSIONS_ROLE','NEW_PERMISSIONS_USER','CREATE_CHANGE_DAG','DELETE_DAG','READ_DAG_TASK','CONNECT_TO_BASE']
    
    massEventKey = ['USER_LOGIN_AIRFLOW','READ','DAG','LOCK','DELETE','USER_CREATE','USER_NEW_PASSWORD','NEW_ROLE','DROP_ROLE','NEW_PERMISSIONS_ROLE','NEW_PERMISSIONS_USER','CREATE_CHANGE_DAG','DELETE_DAG','CONNECT_TO_BASE']
    for eventType in massEventKey:
        
        massEvent = getSqlEventAirflow(eventType)

        for rows in range(len(massEvent)):
            
            #Block Generation Msg
            msg = 'NotData'
            
            if (eventType.upper() == 'USER_LOGIN_AIRFLOW'):             
                if (massEvent[rows][6] == False):
                    msg = "AIRFLOW-RTO.USER_LOGOUT: На сервере Airflow был выполнен выход пользователя " + massEvent[rows][1]

                elif ((massEvent[rows][9] > 0) & (massEvent[rows][10] == 0) & (massEvent[rows][6] == True)):
                    msg = "AIRFLOW-RTO.USER_LOGIN_AIRFLOW: На сервере "  + "был выполнен успешный вход/выход пользователя " + massEvent[rows][1]

                elif ((massEvent[rows][9] > 0) & (massEvent[rows][10] > 0) & (massEvent[rows][6] == True)):
                    msg = "AIRFLOW-RTO.USER_ERROR_LOGIN_AIRFLOW: На сервере "  + "была попытка входа под пользователем " + massEvent[rows][1]
                    
            if (eventType.upper() == 'READ'): 
                if (massEvent[rows][2] == 'task_instances'):
                    msg = "AIRFLOW-RTO.READ.Пользователь " + massEvent[rows][1] + " запустил DAG " + massEvent[rows][3]
                elif (massEvent[rows][2] == 'delete'):
                    msg = "AIRFLOW-RTO.DELETE.Пользователь " + massEvent[rows][1] + " удалил DAG " + massEvent[rows][3]
            
            if (eventType.upper() == 'DAG'): 
                if (massEvent[rows][3] == 'success'):
                    msg = "AIRFLOW-RTO.SUCCESS_DAG: На сервере AirFlow" + " успешно отработал DAG " + massEvent[rows][2]
                elif (massEvent[rows][3] == 'failed'):
                    msg = "AIRFLOW-RTO.ERROR_DAG: На сервере AirFlow" + " завершился с ошибкой DAG " + massEvent[rows][2]
            
            if (eventType.upper() == 'LOCK'):
                if (massEvent[rows][4] == 'unlock'):
                    msg = "AIRFLOW-RTO.UNLOCK: На сервере AirFlow" + " разблокировали пользователя " + massEvent[rows][1]
                elif (massEvent[rows][4] == 'lock'):
                    msg = "AIRFLOW-RTO.LOCK: На сервере AirFlow" + " заблокировали пользователя " + massEvent[rows][1]
            
            if (eventType.upper() == 'DELETE'):
                msg = "AIRFLOW-RTO.USER_DELETE: На сервере AirFlow" + " удалили пользователя " + massEvent[rows][1]

            if (eventType.upper() == 'USER_CREATE'):
                msg = "AIRFLOW-RTO.USER_CREATE: На сервере AirFlow" + " создали пользователя " + massEvent[rows][1]             

            if (eventType.upper() == 'USER_NEW_PASSWORD'):
                msg = "AIRFLOW-RTO.USER_NEW_PASSWORD: На сервере AirFlow" + " был сменен пароль пользователя " + massEvent[rows][1]

            if (eventType.upper() == 'NEW_ROLE'):
                msg = "AIRFLOW-RTO.NEW_ROLE: На сервере AirFlow" + " была создана роль " + massEvent[rows][2]

            if (eventType.upper() == 'DROP_ROLE'):
                msg = "AIRFLOW-RTO.DROP_ROLE: На сервере AirFlow" + " была удалена роль " + massEvent[rows][3]

            if (eventType.upper() == 'NEW_PERMISSIONS_ROLE'):             
                if (massEvent[rows][3] == 'ADD_PERMESSIONS'):
                    msg = "AIRFLOW-RTO.NEW_PERMISSIONS_ROLE: На сервере Airflow группе (роли) " + massEvent[rows][2] + " добавленно разрешение " + massEvent[rows][4]
                elif (massEvent[rows][3] == 'DELETE_PERMESSIONS'):
                    msg = "AIRFLOW-RTO.NEW_PERMISSIONS_ROLE: На сервере Airflow группе (роли) " + massEvent[rows][2] + " убрано разрешение " + massEvent[rows][4] 

            if (eventType.upper() == 'NEW_PERMISSIONS_USER'):             
                if (massEvent[rows][3] == 'ADD_ROLE_USER'):
                    msg = "AIRFLOW-RTO.ADD_ROLE_USER: На сервере Airflow пользователь " + massEvent[rows][1] + " добавлен в группу (роль) " + massEvent[rows][2]
                elif (massEvent[rows][3] == 'DELETE_ROLE_USER'):
                    msg = "AIRFLOW-RTO.DELETE_ROLE_USER: На сервере Airflow пользователь " + massEvent[rows][1] + " удален из группы (роли) " + massEvent[rows][2]                   

            if (eventType.upper() == 'CREATE_CHANGE_DAG'):             
                if (massEvent[rows][4] == 'CHANGE'):
                    msg = "AIRFLOW-RTO.CHANGE_DAG: На сервере Airflow был изменен Dag " + massEvent[rows][2] + " в " + str(massEvent[rows][3])
                elif (massEvent[rows][4] == 'CREATE_DAG'):
                    msg = "AIRFLOW-RTO.CREATE_DAG: На сервере Airflow был создан Dag " + massEvent[rows][2] + " в " + str(massEvent[rows][3])

            if (eventType.upper() == 'DELETE_DAG'):
                msg = "AIRFLOW-RTO.DELETE_DAG: На сервере AirFlow был удален Dag " + massEvent[rows][2] + " в " +  str(massEvent[rows][0])  

            if (eventType.upper() == 'READ_DAG_TASK'):
                msg = "AIRFLOW-RTO.READ_DAG_TASK: На сервере AirFlow " + massEvent[rows][3]   
            
            if (eventType.upper() == 'CONNECT_TO_BASE'):
                msg = "AIRFLOW-RTO.CONNECT_TO_BASE: На сервере AirFlow в " + str(massEvent[rows][2]) + " - " + str(massEvent[rows][3]) + " был выполнен коннект к " + str(massEvent[rows][4]) + " под пользователем " + str(massEvent[rows][5])
            #----------End generation Msg------------------------
            
            if (msg != 'NotData'):
                maxId += 1
                sql += sqlInsertDataAudit(maxId,#ID
                                              '', #TS
                                              '1', #SOURCEVER 
                                              'airflow_database', #SOURCENAME
                                              'airflow.public', #SOURCEPATH
                                              '', #SLOGIN
                                              'int.gazprombank.ru', #SDOMAIN
                                              getIP(), #SIP
                                               '', #SMAC
                                               getDNS(''), #SDNS
                                               getHost(''), #SHOSTNAME
                                               massEvent[rows][1], #ULOGIN
                                               '', #UDOMAIN
                                               '', #UIP
                                               '', #UMAC
                                               '', #UDNS
                                               '', #UHOSTNAME
                                               '', #CODE ????
                                               '', #PCODE
                                               '', #SPORT
                                               '', #UPORT
                                               '', #SPROTOCOL
                                               '', #UPROTOCOL
                                               str(massEvent[rows][0]), #SDATE
                                               str(massEvent[rows][0]), #UDATE
                                               msg, #MESSAGE
                                               '', #PRNAME
                                               '0', #RESULT
                                               '' #METADATAID
                                              )

                                          
    if (sql != ''):
        execSqlScript(sql)

    return "SUCCESS LOAD AirFlow Log"

#Основной код
print(loadLogFromAirFlowDataBase())
print(loadLogfile("/var/log/audit/","audit.log"))