import pendulum
from datetime import datetime, timedelta
from airflow.models import Variable
from airflow.models.dag import DAG
from airflow.utils.task_group import TaskGroup
from airflow.utils.trigger_rule import TriggerRule
from airflow.operators.bash import BashOperator
from airflow.operators.dummy_operator import DummyOperator
from airflow.providers.microsoft.mssql.operators.mssql import MsSqlOperator
from airflow.providers.common.sql.sensors.sql import SqlSensor


# constants
AIRFLOW_CONNECTION_ID = "cmdm_etl_hdp"
DEFAULT_CONFIG = {'concurrency': 10}
IS_PROD = Variable.get("RTO_AIRFLOW_ENV_NAME").upper() == 'PROD'

with DAG(
    dag_id = 'EVENT_AUDIT_LOG',
    description = 'Тестовый поток для мониторинга системы',
    start_date = pendulum.datetime(2023, 6, 5, tz = 'local'),
    schedule_interval = '0,30 * * * *',
    catchup = False,
    concurrency = 10,
    max_active_runs = 1,
    max_active_tasks = 10,
    tags = ["CRM_DP", "CMDM"],
    default_args={
        'email': 'rto-airflow-alert@gazprombank.ru',
        'email_on_failure': True,
        'email_on_retry': True,
        'retries': 2,
        'retry_delay': timedelta(seconds=10),
        'depends_on_past': False,
        'wait_for_downstream': False
    }
    # user_defined_macros=get_user_defined_macros()
    # access_control = "{'role1': {'can_read'}, 'role2': {'can_read', 'can_edit', 'can_delete'}}"
) as main_dag:

    load_log = BashOperator(
        task_id='load_log',
        dag = main_dag,
        bash_command='python /acrm/data/airflow_2_6_1/dags/audit_dag/m_LoadAirflowLogsToMaDataAudit.py',
        trigger_rule = TriggerRule.NONE_FAILED
    )
    
    dummy_control_main_cmdm_start = DummyOperator(task_id = 'dummy_control_main_cmdm_start', dag = main_dag, trigger_rule = TriggerRule.NONE_FAILED)
    dummy_control_main_cmdm_end = DummyOperator(task_id = 'dummy_control_main_cmdm_end', dag = main_dag, trigger_rule = TriggerRule.NONE_FAILED)
    
    dummy_control_main_cmdm_start >> load_log
    load_log >> dummy_control_main_cmdm_end

 