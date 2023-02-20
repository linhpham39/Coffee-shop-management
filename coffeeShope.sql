--Drop table
drop table if exists recipes;
drop table if exists ingredients;
drop table if exists orderlines;
drop table if exists products;
drop table if exists orders;
drop table if exists customers;
drop table if exists managers;
drop table if exists employees;

--Create table
--EMPLOYEES
create table if not exists employees(
	employee_id integer primary key,
    name varchar(30) not null,
	salary integer not null,
	email varchar(50) not null,
	dob date not null,
	password varchar(30) not null,
	check (length(password) >= 5)
);

--MANAGERS
create table if not exists managers(
	manager_id integer primary key,
	constraint fk_manager_employee foreign key (manager_id) references employees(employee_id) on delete cascade
);

--CUSTOMER
create table if not exists customers(
	customer_id integer primary key,
	name varchar(30) not null,
	dob date not null,
	email varchar(50) not null,
	password varchar(30) not null,
	check (length(password) >= 5),
	rank varchar(8),
	check ("rank" in('Silver', 'Gold', 'Diamond')), 
	expense numeric(10,2) default 0
);

--ORDERS
create table if not exists orders(
	order_id integer primary key,
	total_price numeric(6,2) default 0,
	date date not null,
	employee_id integer not null,
	constraint fk_order_employee foreign key(employee_id) references employees(employee_id) on delete set null,
	customer_id integer not null,
	constraint fk_order_customer foreign key(customer_id) references customers(customer_id) on delete set null
);
--PRODUCTS

create table if not exists products(
	product_id integer primary key,
	name varchar(30) not null,
	category varchar(15) not null,
	check ("category" in ('Cold Coffees', 'Hot Coffees', 'Food', 'Hot Drinks' )),
	selling_price numeric(6,2) not null,
	status varchar(15) not null,
	check ("status" in ('available', 'out of stock')),
	profit numeric(6,2) not null
);

-- ORDERLINES
create table if not exists orderlines(
	order_id integer,
	product_id integer,
	constraint fk_orderline_order foreign key(order_id) references orders(order_id),
	constraint fk_orderline_product foreign key(product_id) references products(product_id),
	primary key(order_id, product_id),
	quantity integer not null
);

--INGREDIENTS
create table if not exists ingredients(
	ingredient_id integer primary key,
	name varchar(30) not null,
	price_per_kg numeric(6,2) not null,
	available_mass numeric(6,2) not null
);

--RECIPES
create table if not exists recipes(
	product_id integer not null,
	constraint fk_recipe_product foreign key(product_id) references products(product_id) ON DELETE cascade,
	ingredient_id integer not null,
	constraint fk_recipe_ingredient foreign key(ingredient_id) references ingredients(ingredient_id) ON DELETE cascade,
	constraint pk_recipe primary key(product_id, ingredient_id),
	ingredient_mass numeric(6,2) not null	
);
