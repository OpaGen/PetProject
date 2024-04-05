CREATE TABLE public.udf_ab_user_history(
	day_id timestamp not null,
	id int NOT NULL,
	first_name varchar(256) NOT NULL,
	last_name varchar(256) NOT NULL,
	username varchar(512) NOT NULL,
	"password" varchar(256) NULL,
	active bool NULL,
	email varchar(512) NOT NULL,
	last_login timestamp NULL,
	login_count int4 NULL,
	fail_login_count int4 NULL,
	created_on timestamp NULL,
	changed_on timestamp NULL,
	created_by_fk int4 NULL,
	changed_by_fk int4 NULL
);

INSERT INTO public.udf_ab_user_history
select
	current_timestamp as day_id , 
	id, 
	first_name, 
	last_name, 
	username, 
	"password", 
	active, 
	email, 
	last_login, 
	login_count, 
	fail_login_count, 
	created_on, 
	changed_on, 
	created_by_fk, 
	changed_by_fk
from public.ab_user

;


CREATE OR REPLACE FUNCTION udf_ab_user_insert_update_trigger_fnc()
  RETURNS trigger as
$$ 
BEGIN
 INSERT INTO "udf_ab_user_history" ( "day_id", "id", "first_name","last_name" ,"username","password","active","email","last_login","login_count","fail_login_count","created_on","created_by_fk","changed_by_fk")
VALUES( current_timestamp, new."id", new."first_name",new."last_name" ,new."username",new."password",new."active",new."email",new."last_login",new."login_count",new."fail_login_count",new."created_on",new."created_by_fk",new."changed_by_fk");
RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';
CREATE  OR replace TRIGGER udf_ab_user_insert_update_trigger
  AFTER insert or UPDATE
  ON "ab_user"
  FOR EACH ROW
  EXECUTE PROCEDURE udf_ab_user_insert_update_trigger_fnc();
  
create view public.udf_v_permission_role_users as
select 
	ar.id as role_id,
	apvr.id as permission_view_role_id,
	ap.id as permission_id,
	avm.id as view_menu_id,
	ar."name"  as name_role,
	concat(ap."name",' on ', avm."name") as permissions,
	au.username	
from public.ab_role ar 
left join public.ab_permission_view_role apvr 
	on ar.id = apvr.role_id 
left join public.ab_permission_view apv  
	on apv.id  = apvr.permission_view_id 
left join public.ab_view_menu avm
	on avm.id = apv.view_menu_id 
left join public.ab_permission ap 
	on ap.id = apv.permission_id 
left join public.ab_user_role aur 
	on aur.role_id = ar.id
left join public.ab_user au 
	on au.id = aur.user_id;


CREATE TABLE public.udf_permission_role_users_view_history(
	day_id timestamp not null,
	role_id int NULL,
	permission_view_role_id int  NULL,
	permission_id int  NULL,
	view_menu_id int  NULL,
	name_role varchar(256)  NULL,
	permissions varchar(512)  NULL,
	username varchar(512) NULL
);

delete from  public.udf_permission_role_users_view_history;

INSERT INTO public.udf_permission_role_users_view_history
select
	current_timestamp as day_id , 
	role_id,
	permission_view_role_id,
	permission_id,
	view_menu_id,
	name_role,
	permissions,
	username
from public.udf_v_permission_role_users
;

CREATE TABLE public.udf_ab_role_trigger (
	day_id timestamp not null,
	id int4 NULL,
	"name" varchar(128) null,
	status varchar(64) null
);

INSERT INTO public.udf_ab_role_trigger
select current_timestamp as day_id , id, name, 'NEW_ROLE' as status 
from public.ab_role;

CREATE OR REPLACE FUNCTION udf_permission_role_users_view_history_insert_update_ab_role_trigger_fnc()
  RETURNS trigger as
$$ 
begin

if new.name is not null then 
	INSERT INTO "udf_ab_role_trigger" ( "day_id", "id", "name", "status")
	VALUES( current_timestamp, new."id", new."name",'NEW_ROLE');
else
	INSERT INTO "udf_ab_role_trigger" ( "day_id", "id", "name", "status")
	VALUES( current_timestamp, new."id", new."name",'DELETE_ROLE');
end if;

INSERT INTO public.udf_permission_role_users_view_history
select 
	current_timestamp as day_id ,
	ar.id as role_id,
	apvr.id as permission_view_role_id,
	ap.id as permission_id,
	avm.id as view_menu_id,
	ar."name"  as name_role,
	concat(ap."name",' on ', avm."name") as permissions,
	au.username	
from (select new.id as id, new.name as "name") ar 
left join public.ab_permission_view_role apvr 
	on ar.id = apvr.role_id 
left join public.ab_permission_view apv  
	on apv.id  = apvr.permission_view_id 
left join public.ab_view_menu avm
	on avm.id = apv.view_menu_id 
left join public.ab_permission ap 
	on ap.id = apv.permission_id 
left join public.ab_user_role aur 
	on aur.role_id = ar.id
left join public.ab_user au 
	on au.id = aur.user_id;

RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE  OR replace TRIGGER udf_permission_role_users_view_history_insert_update_ab_role_trigger
  AFTER insert or update or delete
  ON "ab_role"
  FOR EACH ROW
  EXECUTE PROCEDURE udf_permission_role_users_view_history_insert_update_ab_role_trigger_fnc();
 
  
 CREATE TABLE public.udf_ab_permission_view_role_trigger (
	id int4 NULL,
	permission_view_id int4 NULL,
	role_id int4 NULL
);

 CREATE OR REPLACE FUNCTION udf_permission_role_users_view_history_insert_update_ab_permission_view_role_trigger_fnc()
  RETURNS trigger as
$$ 
begin

	
INSERT INTO public.udf_permission_role_users_view_history
select 
	current_timestamp as day_id ,
	ar.id as role_id,
	apvr.id as permission_view_role_id,
	ap.id as permission_id,
	avm.id as view_menu_id,
	ar."name"  as name_role,
	concat(ap."name",' on ', avm."name") as permissions,
	au.username	
from public.ab_role ar  
left join (select new.id as id, new.permission_view_id as permission_view_id, new.role_id as role_id) apvr 
	on ar.id = apvr.role_id 
left join public.ab_permission_view apv  
	on apv.id  = apvr.permission_view_id 
left join public.ab_view_menu avm
	on avm.id = apv.view_menu_id 
left join public.ab_permission ap 
	on ap.id = apv.permission_id 
left join public.ab_user_role aur 
	on aur.role_id = ar.id
left join public.ab_user au 
	on au.id = aur.user_id;

RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE  OR replace TRIGGER udf_permission_role_users_view_history_insert_update_ab_permission_view_role_trigger
  AFTER insert or update or delete
  ON "ab_permission_view_role"
  FOR EACH ROW
  EXECUTE PROCEDURE udf_permission_role_users_view_history_insert_update_ab_permission_view_role_trigger_fnc();
 
CREATE TABLE public.udf_dag_code_history (
	day_id timestamp null,
	fileloc_hash int8 NULL,
	fileloc varchar(2000) NULL,
	last_updated timestamptz NULL,
	source_code text null,
	event_type varchar(2000) NULL
);

INSERT INTO public.udf_dag_code_history
select 
	current_timestamp as day_id ,
	fileloc_hash ,
	fileloc ,
	last_updated ,
	source_code ,
	'CREATE_DAG' as event_type
from public.dag_code
;


CREATE OR REPLACE FUNCTION udf_change_dag_code_trigger_fnc()
  RETURNS trigger as
$$ 
begin

if ((select max(fileloc) as file from public.dag_code where fileloc = new.fileloc) is not null) then 
	INSERT INTO "udf_dag_code_history" ( "day_id", "fileloc_hash", "fileloc", "last_updated", "source_code", "event_type")
	VALUES( current_timestamp, new."fileloc_hash", new."fileloc", new."last_updated", new."source_code", 'CHANGE');

end if;

if ((select max(fileloc) as file from public.dag_code old where fileloc = new.fileloc) is null) and (new.fileloc is not null)  then 
	INSERT INTO "udf_dag_code_history" ( "day_id", "fileloc_hash", "fileloc", "last_updated", "source_code", "event_type")
	VALUES( current_timestamp, new."fileloc_hash", new."fileloc", new."last_updated", new."source_code", 'CREATE_DAG');
end if;

RETURN NEW;
END;
$$
LANGUAGE 'plpgsql';

CREATE  OR replace TRIGGER udf_change_dag_code_trigger
  AFTER insert or update or delete
  ON "dag_code"
  FOR EACH ROW
  EXECUTE PROCEDURE udf_change_dag_code_trigger_fnc();
 



