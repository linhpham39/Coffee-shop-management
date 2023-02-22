-- CẬP NHẬT LẠI RANK KHI INSERT DATA customer
create or replace function f_compute_rank2()
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
-- DROP trigger t_customers_compute_rank2 on customers;
create or replace trigger t_customers_compute_rank2
after insert 
on customers
for each row
execute procedure f_compute_rank2();

-- CẬP NHẬP LẠI RANK CHO CUSTOMERS SAU KHI UPDATE/INSERT/DELETE DATA CỦA ORDER
create or replace function f_compute_rank()
    returns trigger
    language plpgsql
    as
    $$
    declare 
        temp_rank varchar(30);
        temp_expense numeric(6, 2);
    begin
        update customers
        set expense = expense + new.total_price - old.total_price
        where customer_id = new.customer_id;

        select c.expense 
        into temp_expense
        from customers c
        where c.customer_id = new.customer_id;

        if (temp_expense >= 100 and temp_expense <= 200) then
            temp_rank = 'Silver';
        elseif(temp_expense >= 201 and temp_expense <=600) then
            temp_rank = 'Gold';
		elseif(temp_expense >= 601) then
			temp_rank = 'Diamond';
        end if;

        update customers 
        set rank = temp_rank
        where customer_id = new.customer_id;

		raise notice 'Change expense to % and rank to %', temp_expense, temp_rank;

        return null;
    end
    $$;
-- DROP trigger t_orders_compute_rank on orders;
create or replace trigger t_orders_compute_rank
after update 
on orders
for each row
execute procedure f_compute_rank();



-- --Trigger for delete order => delete orderlines
-- create or replace function f_delete_orderline()
--     returns trigger
--     language plpgsql
-- as
-- $$
--     begin
--         delete from orderlines ol
--         where ol.order_id = old.order_id;

--         raise notice 'Delete order %', old.order_id;

--         return old;
--     end;
-- $$;
-- -- DROP trigger t_orders_delete_orderline on orders;
-- create or replace trigger t_orders_delete_orderline
-- before delete 
-- on orders
-- for each row
-- execute procedure f_delete_orderline();


-- -- CẬP NHẬT LẠI GIÁ TIỀN BILL CỦA ORDERS KHI ADD 1 ORDERLINE
-- --trigger for insert/delete/update orderlines => compute 
-- --total_price of orders again
-- create or replace function f_compute_totalprice1()
-- 	returns trigger
-- 	language plpgsql
-- as
-- $$ 
-- declare
-- 	temp numeric = 0;
-- 	temp2 numeric = 0;
-- begin
-- 	if(TG_OP = 'INSERT') then
-- 		select (p.selling_price * new.quantity)
-- 		into temp
-- 		from orderlines ol natural join products p
-- 		where p.product_id = new.product_id  ;
		
-- 		update orders o
-- 		set total_price = total_price + temp
-- 		where o.order_id = new.order_id;

--     elseif(TG_OP = 'DELETE') then
--         select (p.selling_price * old.quantity)
-- 		into temp
-- 		from orderlines ol natural join products p
-- 		where p.product_id = old.product_id;
		
-- 		update orders
-- 		set total_price = total_price - temp
-- 		where o.order_id = old.order_id;
    
--     elseif(TG_OP = 'UPDATE') then
--         select (selling_price * old.quantity)
-- 		into temp
-- 		from orderlines ol natural join products p
-- 		where  p.product_id = new.product_id;
		
-- 		select (selling_price * new.quantity)
-- 		into temp2
-- 		from orderlines ol natural join products p
-- 		where  p.product_id = new.product_id;
		
-- 		update orders
-- 		set total_price = total_price - temp + temp2
-- 		where orders.order_id = old.order_id;
-- 	end if;
-- 	return null;
-- end
-- $$;

-- create or replace trigger t_orderlines_compute_totalprice
-- after insert or delete or update
-- on orderlines
-- for each row
-- execute procedure f_compute_totalprice1();

--CẬP NHẬT GIÁ TIỀN CHO ORDER KHI ADD/DELETE ORDERLINES
create or replace function f_compute_totalprice2()
    returns trigger
    language plpgsql
as
$$
declare 
    temp numeric = 0;
    o_id integer;
begin
    IF (TG_OP = 'DELETE') THEN
        o_id = old.order_id;
    ELSE
        o_id = new.order_id;
    END if;

    select sum(ol.quantity * p.selling_price)
    into temp
    from orderlines ol
    	join products p on ol.product_id = p.product_id
    	join orders od on od.order_id = ol.order_id
    where od.order_id = o_id;

	if (temp is null) then temp = 0;
	end if;

    update orders
    set
        total_price = temp
    where orders.order_id = o_id;

	raise notice 'Change total price on order % to % ', o_id, temp;

    IF (TG_OP = 'DELETE') THEN
        return old;
    ELSE
        return new;
    END if;
end
$$;

create or replace trigger t_orderlines_compute_totalprice
after insert or delete or update
on orderlines
for each row
execute procedure f_compute_totalprice2();

-- KIEM TRA PRODUCT CON AVALABLE KHONG MOI KHI THEM ORDERLINE
create or replace function f_check_status_valid()
returns trigger as $$
declare
	prod_status varchar(30);
begin
	select p.status 
	into prod_status
	from products p
	where p.product_id = new.product_id;

	if(prod_status = 'out of stock') then
		raise exception 'Out-of-stock product';
	end if;

	return new;
end
$$
language 'plpgsql';
	
create or replace trigger t_orderlines_check_status
before insert on orderlines
for each row
execute procedure f_check_status_valid();

-- UPDATE INGREDIENT MASS KHI INSERT HOAC UPDATE ORDERLINE
create or replace function f_update_available_mass()
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
	avail numeric;
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

create or replace trigger t_update_available_mass_trigger
after insert or update or delete on orderlines
for each row
execute procedure f_update_available_mass();

--Giảm ingredient thì check status
create or replace function f_change_status()
returns trigger as $$
begin
	update products p
	set status = 'out of stock'
	where (select ingredient_mass 
		   from recipes r 
		   where r.ingredient_id = old.ingredient_id and r.product_id = p.product_id) > new.available_mass;
		   
	update products p
	set status = 'available'
	where (select ingredient_mass 
		   from recipes r 
		   where r.ingredient_id = old.ingredient_id and r.product_id = p.product_id) <= new.available_mass;
	return new;
end
$$
language 'plpgsql';


create or replace trigger t_change_status
after update on ingredients
for each row 
execute procedure f_change_status();