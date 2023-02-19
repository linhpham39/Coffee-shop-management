-- tính số doanh thu từ ngày a đến ngày b
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

-- tính lợi nhuận từ ngày a đến ngày b
create or replace function profit_period(date, date)
returns double precision
language plpgsql
as
$$ 
declare
	total double precision = 0;
begin
	select sum(revenue * quantity)
	into 
	from orders natural join orderlines natural join products
	where date between $1 and $2;
	return round(total::numeric, 2);
end;
$$