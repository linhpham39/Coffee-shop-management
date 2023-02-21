create or replace function f_employee_search() 
	returns table (
        employee_id integer,
        name varchar(30),
        salary integer,
        email varchar(30),
        dob date,
        password varchar(30)
    ) 
	language plpgsql
as 
$$
begin
	return query 
		select *
		from
			employees;
end;
$$;

create or replace function f_employee_search_by_id(integer) 
	returns table (
        employee_id integer,
        name varchar(30),
        salary integer,
        email varchar(30),
        dob date,
        password varchar(30)
    ) 
	language plpgsql
as 
$$
begin
	return query 
    SELECT * FROM employees e WHERE e.employee_id = $1;
end;
$$;

create or replace function f_employee_search_by_email(varchar(30)) 
	returns table (
        employee_id integer,
        name varchar(30),
        salary integer,
        email varchar(30),
        dob date,
        password varchar(30)
    ) 
	language plpgsql
as 
$$
begin
	return query 
    SELECT * FROM employees e where e.email = $1;
end;
$$;

create or replace procedure p_employee_insert(integer, varchar(30), integer, varchar(30), date, varchar(30)) 
	language plpgsql
as 
$$
begin
    insert into employees 
    values ($1, $2, $3, $4, $5, $6);
end;
$$;

create or replace procedure p_employee_delete_by_id(integer) 
	language plpgsql
as 
$$
begin
    DELETE FROM employees WHERE employee_id = $1;
end;
$$;

create or replace procedure p_employee_update_salary_by_id(integer, integer) 
	language plpgsql
as 
$$
begin
    UPDATE employees SET salary = $1 WHERE employee_id = $2;
end;
$$;

call p_employee_delete_by_id(1);
call p_employee_insert(1, 'Dat', 100, 'ajsdgfajk', '2002-12-28', 'password1');
SELECT * FROM f_employee_search();
select * from f_employee_search_by_id(1);