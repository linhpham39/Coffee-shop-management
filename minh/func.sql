--=======Calculating Revenue========--

--Calculating Revenue in period of time

CREATE or replace function revenue_period(date, date)
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

SELECT revenue_period('2022-01-01', '2023-01-01');

--Calculating profit in period of time

CREATE or replace function profit_period(date, date)
    returns double precision
    language plpgsql
    as
$$
    declare 
        total double precision = 0;
    begin
        select sum(revenue * quantity)
        into total
        from orders
            natural join orderlines 
            natural join products
        where date between $1 and $2;
        return round(total::numeric, 2);
    end; 
$$

SELECT profit_period('2022-01-01', '2023-01-01');
