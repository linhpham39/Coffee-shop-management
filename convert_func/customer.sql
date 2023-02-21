create or replace function f_customer_search() 
	returns table (
        customer_id integer,
        name varchar(30),
        dob date,
        email varchar(30),
        password varchar(30),
        rank varchar(8),
        expense numeric(10,2)
    ) 
	language plpgsql
as 
$$
begin
	return query 
		select *
		from
			customers;
end;
$$;

create or replace function f_customer_search_by_email(varchar(30)) 
	returns table (
        customer_id integer,
        name varchar(30),
        dob date,
        email varchar(30),
        password varchar(30),
        rank varchar(8),
        expense numeric(10,2)
    ) 
	language plpgsql
as 
$$
begin
	return query 
		select *
		from
			customers c
        where c.email = $1;
end;
$$;

create or replace procedure p_customer_insert(integer, varchar(30), date, varchar(30), varchar(30), varchar(8), numeric(10,2)) 
	language plpgsql
as 
$$
begin
    insert into customers 
    values ($1, $2, $3, $4, $5, $6, $7);
end;
$$;

create or replace procedure p_customer_update_password(varchar(30), varchar(30)) 
	language plpgsql
as 
$$
begin
    UPDATE customers SET password = $1 WHERE email = $2;
end;
$$;


call p_customer_insert(3, 'minh', '2002-10-23', 'asasdsdfadsfadsf', 'asdfsadfadsfasdfa', NULL, 8.8);
SELECT * FROM f_customer_search();
call p_customer_update_password('ngoquangminh', 'asasdsdfadsfadsf');

SELECT   quote_ident(n.nspname) as schema , quote_ident(p.proname) as function 
FROM   pg_catalog.pg_proc p
JOIN   pg_catalog.pg_namespace n ON n.oid = p.pronamespace 
WHERE  n.nspname not like 'pg%' and n.nspname not like 'information_schema%';