create or replace function revenue_period(date, date)
returns double precision
language plpgsql
as
$$
declare 
	total double precision = 0;
begin 
	select sum(total_price)
	into total
	from orders
	where date between $1 and $2;
	
	return round(total::numeric, 2);
end;
$$

select revenue_period('2022-11-09', '2022-12-09')

select * from orders where total_price != 0;

--Calculating profit in period of time

CREATE or replace function profit_period(date, date)
    returns double precision
    language plpgsql
    as
$$
    declare 
        total double precision = 0;
    begin
        select sum(profit * quantity)
        into total
        from orders
            natural join orderlines 
            natural join products
        where date between $1 and $2;
        return round(total::numeric, 2);
    end; 
$$

SELECT profit_period('2022-01-01', '2023-01-01');

--TINH SAN PHAM DUOC BAN RA NHIEU NHAT--
create or replace function high_consumed_product()
returns table (product character varying(100), amount bigint) as $$
begin
	return query
	select distinct p.name, count(o.product_id)
	from orderlines o join products p
	on o.product_id = p.product_id
	group by o.product_id, p.name
	order by count(o.product_id) desc
	limit 5;
end
$$
language 'plpgsql';

select * from high_consumed_product()

--LAY SO TIEN MA 1 CUSTOMER DA TIEU TRONG CUA HANG
create or replace function count_expense_customer(a integer)
returns double precision as $$
declare
	c_expense double precision;
begin
	select expense into c_expense
	from customers
	where customer_id = a;
	return c_expense;
end
$$
language 'plpgsql';

select * from count_expense_customer(310);

--TINH MOST SPEND CUSTOMER
create or replace function high_expense_customer()
returns table (customer_name character varying(100), total_expense double precision) as $$
begin
	return query
	select name, expense 
	from customers
	order by expense desc nulls last
	limit 3;
end
$$
language 'plpgsql';

select * from high_expense_customer();

-- TINH POTENTIAL CUSTOMER (KHACH HANG MUA NHIEU VA MUA NHIEU LAN TRONG THANG NAY)
create or replace function potential_customer(date, date)
returns table (customer_id integer, customer_name character varying(100), visit bigint, total_expense double precision) as $$
begin
	return query
	select c.customer_id, c.name, count(o.order_id), sum(total_price)
	from customers c join orders o
	on c.customer_id = o.customer_id
	where o.date <= $2 and o.date >= $1
	group by c.customer_id, c.name
	order by count(o.order_id) desc nulls last
	limit 3;
end
$$
language 'plpgsql';

select * from potential_customer('2023-02-01', '2023-02-28');


