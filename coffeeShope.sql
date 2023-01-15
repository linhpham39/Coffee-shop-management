
create table if not exists customers(
	 name varchar(50),
	customer_id integer primary key,
	dob date,
	password varchar(50),
	rank varchar(30),
	check ("rank" in('Silver', 'Gold', 'Diamond'))
);
create table if not exists employees(
	employee_id integer primary key,
    name varchar(50),
	salary integer,
	email varchar(50),
	dob date,
	password varchar(50)
);
create table if not exists managers(
	employee_id integer,
	constraint fk_employee foreign key (employee_id) references employees(employee_id)
);
create table if not exists Orders(
	order_id varchar(10),
	total_price double precision,
	date date,
	employee_id integer,
	constraint fk_employee foreign key(employee_id) references employees(employee_id),
	customer_id integer,
	constraint fk_customer foreign key(customer_id) references customers(customer_id)	
);

create table if not exists products(
	product_id varchar(10) primary key,
	name varchar(30) ,
	category varchar(20),
	check ("category" in ('Drinks', 'Food')),
	selling_price double precision,
	state varchar(20),
	check ("state" in ('available', 'out of stock')),
	revenue double precision
);
create table if not exists orderlines(
	order_id varchar(10),
	product_id varchar(10),
	constraint fk_product foreign key(product_id) references products(product_id),
	primary key(order_id, product_id),
	quantity integer
);

create table if not exists ingredients(
	ingredient_id varchar(10) primary key,
	price_per_kg double precision,
	name varchar(30),
	available_mass double precision
);

create table if not exists recipes(
	product_id varchar(10),
	constraint fk_product2 foreign key(product_id) references products(product_id),
	ingredient_id varchar(10),
	constraint fk_ingredient foreign key(ingredient_id) references ingredients(ingredient_id),
	constraint pk_recipe primary key(product_id, ingredient_id)
);
-- Employee
insert into employees values
(1,'Linh',20000, 'linh@gmail.com', '3/9/2002', 'linhcoffeeshop'),
(2, 'Minh', 40000, 'minh@gmail.com', '10/23/2002', 'minhcoffeeshop'),
(3,'Huyen', 30000,'huyen@gmail.com', '11/08/2002', 'huyencoffeshop');



