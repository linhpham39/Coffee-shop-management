create or replace function f_order_search() 
	returns table (
	order_id integer,
	total_price numeric(6,2),
	date date,
	employee_id integer ,
	customer_id integer 
    ) 
	language plpgsql
as 
$$
begin
	return query 
		select *
		from
			orders;
end;
$$;


-- create or replace function f_order_search_orderlines_by_id(integer) 
-- 	returns table (
-- 	order_id integer,
-- 	total_price numeric(6,2),
-- 	date date,
-- 	employee_id integer ,
-- 	customer_id integer 
--     ) 
-- 	language plpgsql
-- as 
-- $$
-- begin
-- 	return query 
-- 	SELECT ol.order_id, ol.product_id, name, quantity 
--     FROM orderlines ol natural join products p
--     WHERE ol.order_id = $1
-- end;
-- $$;
create or replace function f_order_search_by_id(integer) 
	returns table (
	order_id integer,
	total_price numeric(6,2),
	date date,
	employee_id integer ,
	customer_id integer 
    ) 
	language plpgsql
as 
$$
begin
	return query 
    SELECT * FROM orders o WHERE o.order_id = $1;
end;
$$;

SELECT * FROM f_order_search_by_id(1);