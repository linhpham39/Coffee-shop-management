-- Insert data into table employees
SELECT *
FROM employees;

DELETE FROM employees
WHERE TRUE = TRUE;

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


DELETE FROM customers
WHERE TRUE = TRUE;

insert into customers
VALUES
  ('Abigail',301,'07/23/1997','password',null,'abbotfrancis@outlook.com'),
  ('Adena',302,'07/07/2002','password', null,'carlosbeard9048@gmail.com'),
  ('Kameko',303,'08/18/2005','password', null,'ciaralowe@gmail.com'),
  ('Patrick',304,'09/03/1995','password', null,'indigoshort@outlook.com'),
  ('Dalton',305,'12/10/2000','password', null,'cheyennefry@gmail.com'),
  ('Whoopi',306,'01/04/2001','password', null,'whoopi1584@gmail.com'),
  ('Rana',307,'12/16/2005','password', null,'rana6602@outlook.com'),
  ('Lucius',308,'01/08/2002','password', null,'lucius@outlook.com'),
  ('Olga',309,'03/19/2000','password', null,'olga4071@gmail.com'),
  ('Michael',310,'10/30/1997','password', null,'michael@outlook.com');

SELECT *
FROM customers;

-- Insert data into table products

SELECT *
FROM pg_catalog.pg_constraint;

DELETE FROM pg_catalog.pg_constraint
WHERE oid = 17609;

ALTER table products
add constraint products_category_constraint check (category in ('Cold Coffees', 'Hot Coffees', 'Food', 'Hot Drinks'));

DELETE FROM products
WHERE TRUE;

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
  ('FD001', 'Chocolate Chip Cookie', 'Food', 2.3, 'available', 0.77),  
  ('FD002', 'Butter Croissant', 'Food', 2.1, 'available', 0.75),  
  ('FD003', 'Chocolate Croissant', 'Food', 2.4, 'available', 0.8),  
  ('FD004', 'Plain Bagel', 'Food', 1.7, 'out of stock', 0.71);

SELECT *
FROM products;

-- Insert data into table ingredients



