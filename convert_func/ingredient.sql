create or replace function f_ingredient_search() 
	returns table (
        ingredient_id integer,
        name varchar(30),
        price_per_kg numeric(6,2),
        available_mass numeric(6,2)
    ) 
	language plpgsql
as 
$$
begin
	return query 
		select *
		from
			ingredients;
end;
$$;

create or replace function f_ingredient_search_by_id(integer) 
	returns table (
        ingredient_id integer,
        name varchar(30),
        price_per_kg numeric(6,2),
        available_mass numeric(6,2)
    ) 
	language plpgsql
as 
$$
begin
	return query 
		SELECT * FROM ingredients i WHERE i.ingredient_id = $1;
end;
$$;

create or replace function f_ingredient_search_by_name(varchar(30)) 
	returns table (
        ingredient_id integer,
        name varchar(30),
        price_per_kg numeric(6,2),
        available_mass numeric(6,2)
    ) 
	language plpgsql
as 
$$
begin
	return query 
		SELECT * FROM ingredients i WHERE i.name = $1;
end;
$$;

create or replace procedure p_ingredient_insert(integer, varchar(30), numeric(6, 2), numeric(6, 2)) 
	language plpgsql
as
$$ 
begin
    insert into ingredients 
    values ($1, $2, $3, $4);
end;
$$;

create or replace procedure p_ingredient_update_by_id(varchar(30), numeric(6, 2), numeric(6, 2), integer) 
	language plpgsql
as
$$ 
begin
    update ingredients i
    set i.price_per_kg = $1, i.name = $2, i.available_mass = $3 where i.ingredient_id = $4;
end;
$$;

create or replace procedure p_ingredient_delete_by_id(integer) 
	language plpgsql
as
$$ 
begin
    delete from ingredients i where i.ingredient_id = $1;
end;
$$;

call p_ingredient_insert(1, 'c', 2, 3);
call p_ingredient_delete_by_id(1);
SELECT * FROM f_ingredient_search();