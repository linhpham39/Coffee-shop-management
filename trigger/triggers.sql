-- CẬP NHẬT LẠI RANK KHI INSERT DATA => checked
create or replace function compute_rank2()
returns trigger
language plpgsql
as
$$
declare
	temp_rank varchar(30);
begin 
if (new.expense >= 100 and new.expense <= 200) then
            temp_rank = 'Silver';
        elseif(new.expense >= 201 and new.expense <= 600) then
            temp_rank = 'Gold';
		elseif(new.expense >= 601) then
			temp_rank = 'Diamond';
        end if;
		update customers c
        set rank = temp_rank
        where c.customer_id = new.customer_id;
        return null;
end;
$$;


create or replace trigger act_customers
after insert 
on customers
for each row
execute procedure compute_rank2();



-- CẬP NHẬP LẠI RANK CHO CUSTOMERS SAU KHI UPDATE/INSERT/DELETE DATA CỦA ORDER
create or replace function compute_rank()
    returns trigger
    language plpgsql
    as
    $$
    declare 
        temp_rank varchar(30);
        temp_expense numeric(6, 2);
    begin
        update  customers c
        set expense = expense + new.total_price
        where c.customer_id = new.customer_id;

        select expense 
        into temp_expense
        from customers
        where c.customer_id = new.customer_id;
         if (temp_expense >= 100 and temp_expense <= 200) then
            temp_rank = 'Silver';
        elseif(temp_expense >= 201 and temp_expense <=600) then
            temp_rank = 'Gold';
		elseif(temp_expense >= 601) then
			temp_rank = 'Diamond';
        end if;
        update customers c
        set rank = temp_rank
        where c.customer_id = new.customer_id;
        return null;
    end
    $$;
	
create or replace trigger act_orders
after update 
on orders
for each row
execute procedure compute_rank();



-- CẬP NHẬT LẠI GIÁ TIỀN BILL CỦA ORDERS KHI ADD 1 ORDERLINE
--trigger for insert/delete/update orderlines => compute 
--total_price of orders again
create or replace function compute_totalprice()
	returns trigger
	language plpgsql
as
$$ 
declare
	temp double precision = 0;
	temp2 double precision = 0;
begin
	if(TG_OP = 'INSERT') then
		select (selling_price * quantity)
		into temp
		from orderlines natural join products p
		where p.product_id = new.product_id  ;
		
		update orders
		set total_price = total_price + temp
		where orders.order_id = new.order_id;

    elseif(TG_OP = 'DELETE') then
        select (selling_price * quantity)
		into temp
		from orderlines ol natural join products p
		where p.product_id = old.product_id;
		
		update orders
		set total_price = total_price - temp
		where orders.order_id = old.order_id;
    
    elseif(TG_OP = 'UPDATE') then
        select (selling_price * old.quantity)
		into temp
		from orderlines ol natural join products p
		where  p.product_id = new.product_id;
		
		select (selling_price * new.quantity)
		into temp2
		from orderlines ol natural join products p
		where  p.product_id = new.product_id;
		
		update orders
		set total_price = total_price - temp + temp2
		where orders.order_id = old.order_id;
	end if;
	return null;
end
$$;

create or replace trigger act_orderlines
after insert or delete or update
on orderlines
for each row
execute procedure compute_totalprice();
--testcase:
update orderlines
set quantity = 1
where order_id = '2'
select * from orders where order_id = '2';

--CẬP NHẬT GIÁ TIỀN CHO ORDER KHI ADD/DELETE ORDERLINES
create or replace function compute_totalprice()
    returns trigger
    language plpgsql
as
$$
declare 
    temp double precision = 0;
    o_id integer;
begin
    IF (TG_OP = 'DELETE') THEN
        o_id = old.order_id;
    ELSE
        o_id = new.order_id;
    END if;

    raise notice 'Act on %', o_id;

    select sum(ol.quantity * p.selling_price)
    into temp
    from orderlines ol
    join products p on ol.product_id = p.product_id
    join orders od on od.order_id = ol.order_id
    where od.order_id = o_id;

    update orders
    set
        total_price = round(temp::numeric, 2)
    where orders.order_id = o_id;

    return null;
end
$$;

create or replace trigger act_orderlines
after insert or delete or update
on orderlines
for each row
execute procedure compute_totalprice();

-- KIEM TRA PRODUCT CON AVALABLE KHONG MOI KHI THEM ORDERLINE
create or replace function check_state_valid()
returns trigger as $$
declare
	prod_status text;
begin
	select p.status into prod_status
	from products p
	where p.product_id = new.product_id;
	if(prod_status = 'out of stock') then
		raise exception 'out-of-stock product';
	end if;
	return new;
end
$$
language 'plpgsql';
	
create or replace trigger check_state_trigger
before insert on orderlines
for each row
execute procedure check_state_valid();

-- UPDATE INGREDIENT MASS KHI INSERT HOAC UPDATE ORDERLINE
create or replace function update_available_mass()
returns trigger as $$
declare
	i_cur cursor for
		select r.ingredient_id, r.ingredient_mass
		from products p join recipes r
		on p.product_id = r.product_id
		where p.product_id = new.product_id;
    i_cur2 cursor for
		select r.ingredient_id, r.ingredient_mass
		from products p join recipes r
		on p.product_id = r.product_id
		where p.product_id = old.product_id;
	avail double precision;
begin
	if(TG_OP = 'INSERT') then
        for i_row in i_cur loop
			avail = (select available_mass from ingredients i 
					 where i.ingredient_id = i_row.ingredient_id);
			if((avail - (new.quantity*i_row.ingredient_mass)) < 0) then 
				raise exception 'can not add orderline';
			end if;
			update ingredients
			set available_mass = round((available_mass - (new.quantity*i_row.ingredient_mass))::numeric, 2)
			where ingredient_id = i_row.ingredient_id;
        end loop;
	elseif(TG_OP = 'UPDATE') then
        for i_row in i_cur loop
			avail = (select available_mass from ingredients i 
					 where i.ingredient_id = i_row.ingredient_id);
			if((avail - ((new.quantity-old.quantity)*i_row.ingredient_mass)) < 0) then 
				raise exception 'can not update orderline';
			end if;
			update ingredients
			set available_mass = round((available_mass - ((new.quantity-old.quantity)*i_row.ingredient_mass))::numeric, 2)
			where ingredient_id = i_row.ingredient_id;
        end loop;
	elseif(TG_OP = 'DELETE') then
        for i_row in i_cur2 loop
			update ingredients
			set available_mass = round((available_mass + (old.quantity*i_row.ingredient_mass))::numeric, 2)
			where ingredient_id = i_row.ingredient_id;
        end loop;
	end if;
	return new;
end;
$$
language 'plpgsql';

create or replace trigger update_available_mass_trigger
after insert or update or delete on orderlines
for each row
execute procedure update_available_mass();