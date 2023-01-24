--============Select============--
-- Select order by order_id
SELECT *
FROM orders
ORDER BY order_id;
-- Select order by date
SELECT *
FROM orders
ORDER BY date;
-- Select order by total_price ASC
SELECT *
FROM orders
ORDER BY total_price ASC;
-- Select order by total_price DSC
SELECT *
FROM orders
ORDER BY total_price DESC;
-- Select with order_id
SELECT *
FROM orders
WHERE order_id = 'OD0001';
-- Select with customer_id
SELECT *
FROM orders
WHERE customer_id = 303;
-- Select with employee_id
SELECT *
FROM orders
WHERE employee_id = 203;

--============Update============--
--update date
UPDATE orders
SET
    date = '2022-08-07'
WHERE order_id = 'OD0001';
--update employee_id
UPDATE orders
SET
    employee_id = 201;
WHERE order_id = 'OD0001';
--update customer_id
UPDATE orders
SET
    customer_id = 101;
WHERE order_id = 'OD0001';

--============Insert============--
INSERT INTO orders
VALUES
  ('OD0014',null,'08/07/2023',203,308);

--============Delete============--
DELETE FROM orders
WHERE order_id = 'OD0014';
--Delete all
DELETE FROM orders