--============Select============--
SELECT *
FROM orderlines;
-- Select order by quantity ASC
SELECT *
FROM orderlines
ORDER BY quantity;
-- Select order by quantity
SELECT *
FROM orderlines
ORDER BY quantity DESC;
-- Select with order_id
SELECT *
FROM orderlines
WHERE order_id = 'OD0002';
-- Select with product_id
SELECT *
FROM orderlines
WHERE product_id = 'HC002';
--============Update============--
--update with order_id and product_id
UPDATE orderlines
    SET quantity = 1
WHERE order_id = 'OD0001' AND product_id ='HC002';
--update with order_id 
UPDATE orderlines
    SET quantity = 1
WHERE order_id = 'OD0001';
--update with product_id
UPDATE orderlines
    SET quantity = 1
WHERE product_id ='HC002';
--============Insert============--
INSERT INTO orderlines
VALUES
  ('OD0001','HC001', 2);

--============Delete============--
DELETE FROM orderlines
WHERE order_id = 'OD0014' AND product_id ='HC002';

--Delete all
DELETE FROM orderlines;