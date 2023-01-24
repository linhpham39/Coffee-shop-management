--Triggers for insert/delete/update orderlines => compute total_price in orders

--drop function compute_totalprice;
create or replace function compute_totalprice()
    returns trigger
    language plpgsql
as
$$
declare 
    temp double precision = 0;
    o_id varchar(10);
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


--Trigger for delete order => delete orderlines

create or replace function auto_delete_orderline()
    returns trigger
    language plpgsql
as
$$
    begin
        delete from orderlines
        where order_id = old.order_id;

        raise notice 'Delete orders %', old.order_id;

        return null;
    end;
$$;

create or replace trigger delete_order
before delete 
on orders
for each row
execute procedure auto_delete_orderline();

delete from orders 
where order_id = 'OD0002';

