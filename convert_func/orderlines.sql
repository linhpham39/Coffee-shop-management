create or replace function f_orderline_search() 
	returns table (
        order_id integer,
        product_id integer,
        quantity integer
    ) 
	language plpgsql
as 
$$
begin
	return query 
		select *
		from
			orderlines;
end;
$$;

create or replace function f_orderline_search_by_order_id(integer) 
	returns table (
        order_id integer,
        product_id integer,
        quantity integer
    ) 
	language plpgsql
as 
$$
begin
	return query 
    select * 
    from orderlines o
    where o.order_id = $1;
end;
$$;

create or replace function f_orderline_search_by_id(integer, integer) 
	returns table (
        order_id integer,
        product_id integer,
        quantity integer
    ) 
	language plpgsql
as 
$$
begin
	return query 
    select * 
    from orderlines o
    where o.order_id = $1
        and o.product_id = $2;
end;
$$;

create or replace procedure p_orderline_insert(integer, integer, integer) 
	language plpgsql
as 
$$
begin
    insert into orderlines values ($1, $2, $3);
end;
$$;

create or replace procedure p_orderline_delete(integer, integer) 
	language plpgsql
as 
$$
begin
    delete from orderlines 
    where order_id = $1 and product_id = $2;
end;
$$;

create or replace procedure p_orderline_update(integer, integer, integer) 
	language plpgsql
as 
$$
begin
    update orderlines 
    set quantity = $1 
    where order_id = $2 and product_id = $3;
end;
$$;
SELECT * FROM f_orderline_search_by_id(2, 3);