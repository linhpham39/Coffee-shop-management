create or replace function f_product_search() 
	returns table (
        product_id integer,
        name varchar(30),
        category varchar(15),
        selling_price numeric(6,2),
        status varchar(15),
        profit numeric(6,2)
    )
	language plpgsql
as 
$$
begin
	return query 
		select *
		from
			products;
end;
$$;

create or replace function f_product_search_by_id(integer) 
	returns table (
        product_id integer,
        name varchar(30),
        category varchar(15),
        selling_price numeric(6,2),
        status varchar(15),
        profit numeric(6,2)
    )
	language plpgsql
as 
$$
begin
	return query 
		select *
		from products p
        WHERE p.product_id = $1;
end;
$$;

DROP function f_product_search_rank;
create or replace function f_product_search_rank() 
	returns table (
        product_id integer,
        name varchar(30),
        category varchar(15),
        selling_price numeric(6,2),
        status varchar(15),
        profit numeric(6,2),
        order_num integer
    )
	language plpgsql
as 
$$
begin
	return query 
        SELECT p.*, count(p.*) 
        FROM products p NATURAL JOIN orderlines
        GROUP BY p.product_id
        ORDER BY count(p.*) DESC;
end;
$$;

SELECT * FROM f_product_search_rank();
SELECT * FROM f_product_search();
SELECT * FROM f_product_search_by_id(1);