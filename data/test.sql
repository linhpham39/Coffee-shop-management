delete from customers;
insert into customers (customer_id, name, dob, email, password, rank, expense) 
values
 (1, 'Shanon Massen', '1953-09-25', 'smassen0@gmpg.org', 'F1PEFWiky', 'Diamond', 0),
 (2, 'Georgiana Runnicles', '2008-02-15', 'grunnicles1@smugmug.com', 'yxrFa5Uac', 'Diamond', 0),
 (3, 'Emmeline Antoinet', '1953-07-22', 'eantoinet2@ftc.gov', '75OW9e', null, 0),
 (4, 'Carla Mudge', '1993-05-01', 'cmudge3@newyorker.com', 'uzhmt56', null, 0),
 (5, 'Elisabetta Padula', '1981-06-21', 'epadula4@macromedia.com', 'mgN3t3S', 'Diamond', 0);



 INSERT INTO employees
 values
 (1, 'Minh',1000,'aaaaaaa@gmail.com' ,'2023-01-01','password1');

delete from orders;
 INSERT INTO orders
 values
 (1, 0.0, '2023-01-01',1,1);

 UPDATE orders
 SET total_price = 200.0
 WHERE order_id = 1;

delete from orderlines
INSERT INTO orderlines
VALUES (1, 2, 1);
