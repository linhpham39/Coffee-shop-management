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
('IG001', 1.42, 'Milk', 3.5),
('IG002', 50.2, 'Espresso Roast', 2.1),
('IG003', 2.1, 'Sugar', 2.3),
('IG004', 15.4, 'Butter', 0.6),
('IG005', 23.4, 'Pistachios', 1.4),
('IG006', 22.3, 'Chocolate', 1),
('IG007', 1.6, 'Flour ', 2.6);

-- Insert data into table ingredients

ALTER TABLE recipes
ADD column ingredient_mass double precision;

DELETE FROM recipes;

INSERT INTO recipes
VALUES
  ('HC001', 'IG002', 0.02),
  ('HC001', 'IG003', 0.025),
  ('HC002', 'IG002', 0.02),
  ('HC002', 'IG003', 0.025),
  ('HC003', 'IG002', 0.02),
  ('HC004', 'IG002', 0.02),
  ('HC004', 'IG001', 0.05),
  ('HC004', 'IG003', 0.025),
  ('HC005', 'IG002', 0.015),
  ('HC005', 'IG001', 0.02),
  ('HC006', 'IG002', 0.015),
  ('HC006', 'IG001', 0.06),
  ('HC007', 'IG002', 0.025),
  ('HC007', 'IG001', 0.1),
  ('HC008', 'IG001', 0.12),
  ('HC008', 'IG002', 0.02),
  ('HC008', 'IG005', 0.02),
  ('HC009', 'IG002', 0.02),
  ('HC009', 'IG001', 0.09),
  ('HC010', 'IG002', 0.02),
  ('HC010', 'IG001', 0.1),
  ('HC010', 'IG006', 0.03),
  ('HC011', 'IG002', 0.03),
  ('HC011', 'IG001', 0.12),
  ('HC011', 'IG003', 0.08),
  ('HC012', 'IG001', 0.07),
  ('HC012', 'IG002', 0.025),
  ('HC012', 'IG003', 0.05),
  ('HC013', 'IG002', 0.025),
  ('HC013', 'IG003', 0.025),
  ('HD001', 'IG006', 0.05),
  ('HD001', 'IG001', 0.12),
  ('HD002', 'IG006', 0.06),
  ('HD002', 'IG001', 0.11),
  ('HD003', 'IG001', 0.16),
  ('HD004', 'IG001', 0.14),
  ('HD004', 'IG003', 0.1),
  ('HD005', 'IG001', 0.1),
  ('HD005', 'IG005', 0.05),
  ('HD005', 'IG003', 0.05),
  ('CC001', 'IG002', 0.01),
  ('CC001', 'IG003', 0.05),
  ('CC001', 'IG005', 0.02),
  ('CC002', 'IG002', 0.01),
  ('CC002', 'IG003', 0.05),
  ('CC002', 'IG006', 0.02),
  ('CC003', 'IG002', 0.01),
  ('CC003', 'IG003', 0.05),
  ('CC004', 'IG002', 0.025),
  ('CC004', 'IG001', 0.05),
  ('CC005', 'IG002', 0.025),
  ('CC005', 'IG001', 0.08),
  ('CC006', 'IG002', 0.025),
  ('CC006', 'IG003', 0.08),
  ('CC007', 'IG002', 0.02),
  ('CC007', 'IG001', 0.12),
  ('FD001', 'IG007', 0.08),
  ('FD001', 'IG006', 0.04),
  ('FD001', 'IG004', 0.03),
  ('FD001', 'IG003', 0.05),
  ('FD002', 'IG007', 0.08),
  ('FD002', 'IG003', 0.06),
  ('FD002', 'IG004', 0.05),
  ('FD003', 'IG007', 0.1),
  ('FD003', 'IG003', 0.05),
  ('FD003', 'IG006', 0.05),
  ('FD004', 'IG007', 0.08),
  ('FD004', 'IG004', 0.05),
  ('FD004', 'IG003', 0.15);

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
ADD constraint fk_order_id foreign key (order_id) references orders(order_id);

INSERT INTO orderlines
VALUES
  ('OD0001','HC001', 2),
  ('OD0002','HC004', 1),
  ('OD0002','HC003', 1),
  ('OD0003','CC001', 1),
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

