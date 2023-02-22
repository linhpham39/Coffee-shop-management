-- Insert data into table employees
SELECT *
FROM employees;

DELETE FROM employees;

insert into employees values
(101, 'Pham Khanh Linh', 2000, 'linh@gmail.com', '3/9/2002', 'linhcoffeeshop'),
(102, 'Nguyen Minh Huyen', 3000, 'huyen@gmail.com', '11/08/2002', 'huyencoffeshop'),
(201, 'Ngo Quang Minh', 2000, 'minh@gmail.com', '10/23/2002', 'minhcoffeeshop'),
(202, 'Nguyen Thi Phuong Thao', 1000, 'thao@gmail.com', '9/1/2002', 'thaocoffeeshop'),
(203, 'Pham Thao Nhi', 1000, 'nhi@gmail.com', '3/3/2002', 'nhicoffeshop'),
(204, 'Cao Dang Dat', 1100, 'dat@gmail.com', '12/28/2002', 'datcoffeeshop');

-- Insert data into table employees
INSERT INTO managers VALUES
(101), (102);


-- Insert data into table employees
ALTER table customers
ADD column email varchar(50);

DELETE FROM customers;

--thêm cột expense - số tiền customer đã tiêu
alter table customers
add column expense double precision

insert into customers
VALUES
  ('Abigail',301,'07/23/1997','password',null,'abbotfrancis@outlook.com', null),
  ('Adena',302,'07/07/2002','password', null,'carlosbeard9048@gmail.com', null),
  ('Kameko',303,'08/18/2005','password', null,'ciaralowe@gmail.com', null),
  ('Patrick',304,'09/03/1995','password', null,'indigoshort@outlook.com', null),
  ('Dalton',305,'12/10/2000','password', null,'cheyennefry@gmail.com', null),
  ('Whoopi',306,'01/04/2001','password', null,'whoopi1584@gmail.com', null),
  ('Rana',307,'12/16/2005','password', null,'rana6602@outlook.com', null),
  ('Lucius',308,'01/08/2002','password', null,'lucius@outlook.com', null),
  ('Olga',309,'03/19/2000','password', null,'olga4071@gmail.com', null),
  ('Michael',310,'10/30/1997','password', null,'michael@outlook.com', null);

SELECT *
FROM customers;

-- Insert data into table products

SELECT *
FROM pg_catalog.pg_constraint;

DELETE FROM pg_catalog.pg_constraint
WHERE oid = 17609;

ALTER table products
add constraint products_category_constraint check (category in ('Cold Coffees', 'Hot Coffees', 'Food', 'Hot Drinks'));

DELETE FROM products ;

insert into products
VALUES
  ('HC001', 'Caffè Americano', 'Hot Coffees', 2.1, 'available', 0.65),
  ('HC002', 'Caffè Misto', 'Hot Coffees', 1.92, 'out of stock', 0.53),
  ('HC003', 'Dark Roast Coffee', 'Hot Coffees', 1.62, 'available', 0.48),
  ('HC004', 'Cappuccino', 'Hot Coffees', 2.34, 'available', 0.53),
  ('HC005', 'Espresso', 'Hot Coffees', 1.15, 'available', 0.33),
  ('HC006', 'Espresso Con Panna', 'Hot Coffees', 1.8, 'out of stock', 0.49),
  ('HC007', 'Flat White', 'Hot Coffees', 2.52, 'available', 0.52),
  ('HC008', 'Pistachio Latte', 'Hot Coffees', 2.4, 'out of stock', 0.54),
  ('HC009', 'Caffè Latte', 'Hot Coffees', 2.5, 'available', 0.62),
  ('HC010', 'Creme Frappuccino', 'Hot Coffees', 2.57, 'out of stock', 0.66),
  ('HC011', 'Coffee Frappuccino', 'Hot Coffees', 2.61, 'available', 0.69),
  ('HC012', 'Espresso Macchiato', 'Hot Coffees', 2.84, 'available', 0.76),
  ('HC013', 'Caffè Mocha', 'Hot Coffees', 2.4, 'available', 0.66),
  ('HD001', 'Hot Chocolate', 'Hot Drinks', 2, 'available', 0.53),
  ('HD002', 'White Hot Chocolate', 'Hot Drinks', 2.15, 'out of stock', 0.57),
  ('HD003', 'Steamed Milk', 'Hot Drinks', 1.63, 'available', 0.42),
  ('HD004', 'Vanilla Crème', 'Hot Drinks', 1.71, 'out of stock', 0.49),
  ('HD005', 'Pistachio Crème', 'Hot Drinks', 2, 'available', 0.45),
  ('CC001', 'Pistachio Cream Cold Brew', 'Cold Coffees', 2, 'available', 0.58),  
  ('CC002', 'Chocolate Cream Cold Brew', 'Cold Coffees', 2.1, 'out of stock', 0.52),
  ('CC003', 'Nitro Cold Brew', 'Cold Coffees',1.62, 'available', 0.42),  
  ('CC004', 'Iced Mocha', 'Cold Coffees', 2.32, 'available', 0.65),
  ('CC005', 'Iced Espresso Macchiato', 'Cold Coffees', 2.52, 'available', 0.74),  
  ('CC006', 'Iced Pistachio Latte', 'Cold Coffees', 2.33, 'out of stock', 0.67),  
  ('CC007', 'Iced Shaken Espresso', 'Cold Coffees', 2, 'available', 0.72),  
  ('CC008', 'Iced Coffee with Milk', 'Cold Coffees', 2.2, 'available', 0.77),
  ('FD001', 'Chocolate Chip Cookie', 'Food', 2.5, 'available', 0.77),  
  ('FD002', 'Butter Croissant', 'Food', 2.5, 'available', 0.75),  
  ('FD003', 'Chocolate Croissant', 'Food', 2.6, 'available', 0.8),  
  ('FD004', 'Plain Bagel', 'Food', 2.3, 'out of stock', 0.71);

SELECT *
FROM products;

-- Insert data into table ingredients
DELETE FROM ingredients;

INSERT INTO ingredients
VALUES
(1, 1.42, 'Milk', 3.5),
(2, 50.2, 'Espresso Roast', 2.1),
(3, 2.1, 'Sugar', 2.3),
(4, 15.4, 'Butter', 0.6),
(5, 23.4, 'Pistachios', 1.4),
(6, 22.3, 'Chocolate', 1),
(7, 1.6, 'Flour', 2.6);

-- Insert data into table ingredients

ALTER TABLE recipes
ADD column ingredient_mass double precision;

DELETE FROM recipes;

INSERT INTO recipes
VALUES
  (1, 2, 0.02),
  (1, 3, 0.025),
  (2, 2, 0.02),
  (2, 3, 0.025),
  (3, 2, 0.02),
  (4, 2, 0.02),
  (4, 1, 0.05),
  (4, 3, 0.025),
  (5, 2, 0.015),
  (5, 1, 0.02),
  (6, 2, 0.015),
  (6, 1, 0.06),
  (7, 2, 0.025),
  (7, 1, 0.1),
  (8, 1, 0.12),
  (8, 2, 0.02),
  (8, 5, 0.02),
  (9, 2, 0.02),
  (9, 1, 0.09),
  (10, 2, 0.02),
  (10, 1, 0.1),
  (10, 6, 0.03),
  (11, 2, 0.03),
  (11, 1, 0.12),
  (11, 3, 0.08),
  (12, 1, 0.07),
  (12, 2, 0.025),
  (12, 3, 0.05),
  (13, 2, 0.025),
  (13, 3, 0.025),
  (14, 6, 0.05),
  (14, 1, 0.12),
  (15, 6, 0.06),
  (15, 1, 0.11),
  (16, 1, 0.16),
  (17, 1, 0.14),
  (17, 3, 0.1),
  (18, 1, 0.1),
  (18, 5, 0.05),
  (18, 3, 0.05),
  (19, 2, 0.01),
  (19, 3, 0.05),
  (19, 5, 0.02),
  (20, 2, 0.01),
  (20, 3, 0.05),
  (20, 6, 0.02),
  (21, 2, 0.01),
  (21, 3, 0.05),
  (22, 2, 0.025),
  (22, 1, 0.05),
  (23, 2, 0.025),
  (23, 1, 0.08),
  (24, 2, 0.025),
  (24, 3, 0.08),
  (25, 2, 0.02),
  (25, 1, 0.12),
  (26, 2, 0.02),
  (26, 1, 0.15),
  (27, 7, 0.08),
  (27, 6, 0.04),
  (27, 4, 0.03),
  (28, 3, 0.05),
  (28, 7, 0.08),
  (28, 3, 0.06),
  (28, 4, 0.05),
  (29, 7, 0.1),
  (29, 3, 0.05),
  (29, 6, 0.05),
  (30, 7, 0.08),
  (30, 4, 0.05),
  (30, 3, 0.15);

SELECT p.product_id, SUM(r.ingredient_mass * i.price_per_kg)
FROM recipes r
  NAtural Join ingredients i
  Join products p On r.product_id = p.product_id
Group by p.product_id
HAving SUM(r.ingredient_mass * i.price_per_kg) + p.revenue > p.selling_price
Order by p.product_id;

-- Insert data into table orders
DELETE FROM orders;

ALTER table orders
ADD constraint pk_orders primary key(order_id);

INSERT INTO orders
VALUES
  ('OD0001',null,'08/07/2022',203,308),
  ('OD0002',null,'09/18/2022',202,308),
  ('OD0003',null,'10/31/2022',203,303),
  ('OD0004',null,'11/16/2022',202,302),
  ('OD0005',null,'11/25/2022',201,306),
  ('OD0006',null,'11/30/2022',202,307),
  ('OD0007',null,'12/01/2022',203,308),
  ('OD0008',null,'12/23/2022',202,309),
  ('OD0009',null,'12/25/2022',204,310),
  ('OD0010',null,'01/11/2023',203,303);

-- Insert data into table orders

DELETE FROM orderlines;

ALTER TABLE orderlines
ADD constraint fk_order_id foreign key (order_id) references orders(order_id) on delete cascade;

INSERT INTO orderlines
VALUES
  ('OD0001','HC001', 2),
  ('OD0002','HC004', 1),
  ('OD0002','HC003', 1),


  ('OD0002','CC001', 1),

  ('OD0003','HD002', 2),
  ('OD0003','FD001', 3),
  ('OD0004','HC012', 2),
  ('OD0004','CC001', 1),
  ('OD0005','HC007', 2),
  ('OD0006','HD004', 1),
  ('OD0007','HC009', 1),
  ('OD0007','HC010', 1),
  ('OD0008','HC002', 2),
  ('OD0009','HC003', 1),
  ('OD0010','HD003', 2),
  ('OD0010','HC006', 2),
  ('OD0008','CC001', 1),
  ('OD0009','FD001', 2);

