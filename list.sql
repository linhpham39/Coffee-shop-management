--List all users
SELECT usename AS role_name
FROM pg_catalog.pg_user
ORDER BY role_name desc;

--List all functions and procedures
SELECT   quote_ident(n.nspname) as schema , quote_ident(p.proname) as function 
FROM   pg_catalog.pg_proc p
JOIN   pg_catalog.pg_namespace n ON n.oid = p.pronamespace 
WHERE  n.nspname not like 'pg%' and n.nspname not like 'information_schema%';

--List all triggers
SELECT  event_object_table AS table_name ,trigger_name         
FROM information_schema.triggers  
GROUP BY table_name , trigger_name 
ORDER BY table_name ,trigger_name 