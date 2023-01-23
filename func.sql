--adding orderline and compute total_price
SELECT o.quantity * p.selling_price
FROM orderlines o
    JOIN products p ON o.product_id = p.product_id;


SELECT SUM(ol.quantity * p.selling_price)
    FROM orderlines ol
    JOIN products p ON ol.product_id = p.product_id
    Join orders od ON od.order_id = ol.order_id
    WHERE od.order_id = 'OD0002';



CREATE OR REPLACE function compute_totalprice()
    REturns trigger
    language plpgsql
AS
$$
declare 
    temp double precision = 0;
begin
    SELECT SUM(ol.quantity * p.selling_price)
    INTO temp
    FROM orderlines ol
    JOIN products p ON ol.product_id = p.product_id
    Join orders od ON od.order_id = ol.order_id
    WHERE od.order_id = new.order_id;


    UPDATE orders
    SET
        total_price = round(temp::numeric, 2)
    WHERE orders.order_id = new.order_id;

    REturn new;
end
$$;

-- drop trigger add_orderlines;

create or replace trigger add_orderlines
after insert
on orderlines
for each statement
execute procedure compute_totalprice();

DELETE FROM orderlines;

INSERT INTO orderlines
VALUES
  ('OD0001','HC001', 2),
  ('OD0002','HC004', 1),
  ('OD0002','HC003', 1);

--adding orderline and lost in ingredients
SELECT i.available_mass
FROM orderlines o
    JOIN products p on p.product_id = o.product_id
    JOIN recipes r on r.product_id = p.product_id
    JOIN ingredients i on i.ingredient_id = r.ingredient_id;

CREATE OR REPLACE function compute_ingredient_lost()
    REturns trigger
    language plpgsql
AS
$$
declare 
    temp double precision = 0;
begin
    SELECT SUM(ol.quantity * p.selling_price)
    INTO temp
    FROM orderlines ol
    JOIN products p ON ol.product_id = p.product_id
    Join orders od ON od.order_id = ol.order_id
    WHERE od.order_id = new.order_id;


    UPDATE orders
    SET
        total_price = round(temp::numeric, 2)
    WHERE orders.order_id = new.order_id;

    REturn new;
end
$$;

-- drop trigger add_orderlines;

create or replace trigger add_orderlines
after insert
on orderlines
for each statement
execute procedure compute_totalprice();