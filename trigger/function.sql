	create or replace function f_revenue_period(date, date)
	returns numeric
	language plpgsql
	as
	$$
		declare 
			total numeric(10, 2) = 0;
		begin 
			select sum(total_price)
			into total
			from orders
			where date between $1 and $2;
			
			return total;
		end;
	$$
	--Calculating profit in period of time
	CREATE or replace function f_profit_period(date, date)
		returns numeric
		language plpgsql
		as
	$$
		declare 
			total numeric = 0;
		begin
			select sum(p.profit * ol.quantity)
			into total
			from orders o
				natural join orderlines ol
				natural join products p
			where o.date between $1 and $2;

			return total;
		end; 
	$$

	--TINH SAN PHAM DUOC BAN RA NHIEU NHAT--
	create or replace function f_high_consumed_product()
		returns table (product varchar(30), amount bigint) 
	as 
	$$
	begin
		return query
			select distinct p.name, sum(o.quantity) 
			from orderlines o join products p
				on o.product_id = p.product_id
			group by o.product_id, p.name
			order by sum(o.quantity) desc nulls last
			limit 5;
	end
	$$
	language 'plpgsql';

	select * from f_high_consumed_product()

	--LAY SO TIEN MA 1 CUSTOMER DA TIEU TRONG CUA HANG
	create or replace function f_count_expense_customer(a integer)
		returns numeric 
	as 
	$$
		declare
			c_expense numeric;
		begin
			select expense into c_expense
			from customers
			where customer_id = a;
			return c_expense;
		end
	$$
	language 'plpgsql';

	select * from f_count_expense_customer(310);

	--TINH MOST CONSUMED CUSTOMER
	create or replace function f_high_expense_customer()
	returns table (customer_name varchar(30), total_expense numeric) as $$
	begin
		return query
		select name, expense 
		from customers
		order by expense desc nulls last
		limit 3;
	end
	$$
	language 'plpgsql';

	select * from f_high_expense_customer();

	-- TINH POTENTIAL CUSTOMER (KHACH HANG MUA NHIEU VA MUA NHIEU LAN TRONG THANG NAY)
	create or replace function f_potential_customer(date, date)
		returns table (customer_id integer, customer_name character varying(100), visit bigint, total_expense numeric) 
	as 
	$$
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

	--Take all orders from a customer
	create or replace function f_customer_orders(a integer)
		returns table (customer_id integer, order_id integer , total numeric, product_id integer, quantity integer ) 
	as 
	$$
	begin
		return query 
		select * from view_orders v
		where v.customer_id = a;
	end
	$$
	language 'plpgsql';

	--LIET KE CAC EMPLOYEE LAM VIEC IT NHAT TRONG 1 KHOANG THOI GIAN
	create or replace function f_least_take_order_emps(date, date)
	returns table (employee_id integer, employee_name varchar(30), amount bigint) as $$
	begin
		return query
			select e.employee_id, e.name, count(table2.employee_id) 
			from employees e
			left outer join (select * from orders o where o.date <= $2 and o.date >= $1) table2
			on e.employee_id = table2.employee_id
			where e.employee_id not in (select * from managers)
			group by e.employee_id, e.name
			order by count(table2.employee_id) asc nulls first;
	end
	$$
	language 'plpgsql';

	select * from f_least_take_order_emps('2023-02-01', '2023-02-28');

--TIM SAN PHAM THEO CATEGORY

create or replace function f_filter_product(c character varying(15))
returns table(product_name character varying(30), price numeric) as $$
begin
	return query
	select name, selling_price
	from products
	where category = c and status = 'available';
end
$$
language 'plpgsql';

select * from f_filter_product('Hot Coffees');

--TIM SAN PHAM THEO GIA TIEN

create or replace function f_filter_product(c numeric)
returns table(product_name character varying(30), price numeric) as $$
begin
	return query
	select name, selling_price
	from products
	where selling_price <= c and status = 'available';
end
$$
language 'plpgsql';

select * from f_filter_product(2)