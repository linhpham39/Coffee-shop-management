create or replace function addOrder()
returns trigger as $$
begin 
if exists (select * from orders where order_id = new.order_id)
then update orders 
	set total_price = total_price + (select (p.selling_price)*(new.quantity) 
						from products p 
						where new.product_id = p.product_id
						)
	where order_id = new.order_id;
else insert into orders(order_id,total_price,date,employee_id,customer_id) values (new.order_id,0,current_date, new.employee_id, new.customer_id);
end if;
return new;
end;
$$
language 'plpgsql';

create trigger addOrder_afterOl
after insert on orderlines
for each row
execute procedure addOrder();

-- khi them 1 orderline vao database se tu dong add vao order nen phai bo foreign key order_id tu orderlines den orders vi luc day se them mot order_id chưa từng xuất hiện trong orders
-- them attribute employee_id va customer_id vào orderline cũng vì lí do trên