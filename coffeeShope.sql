--CUSTOMERS
create table if not exists customers(
	customer_id integer primary key,
	name varchar(50),
	dob date,
	email varchar(50),
	password varchar(50),
	rank varchar(30),
	check ("rank" in('Silver', 'Gold', 'Diamond')), 
	expense double precision
);

--EMPLOYEES
create table if not exists employees(
	employee_id integer primary key,
    name varchar(50),
	salary integer,
	email varchar(50),
	dob date,
	password varchar(50)
);

--MANAGERS
create table if not exists managers(
	employee_id integer,
	constraint fk_employee foreign key (employee_id) references employees(employee_id) ON DELETE cascade
);


--ORDERS 
create table if not exists Orders(
	order_id varchar(10) primary key,
	total_price double precision,
	date date,
	employee_id integer,
	constraint fk_employee foreign key(employee_id) references employees(employee_id) ON DELETE cascade,
	customer_id integer,
	constraint fk_customer foreign key(customer_id) references customers(customer_id) on delete cascade
);


--PRODUCTS
create table if not exists products(
	product_id varchar(10) primary key,
	name varchar(30) ,
	category varchar(20),
	check ("category" in ('Cold Coffees', 'Hot Coffees', 'Food', 'Hot Drinks' )),
	selling_price double precision,
	state varchar(20),
	check ("state" in ('available', 'out of stock')),
	revenue double precision
);

-- ORDERLINES
create table if not exists orderlines(
	order_id varchar(10),
	product_id varchar(10),
	constraint fk_order foreign key(order_id) references orders(order_id) on delete cascade,
	constraint fk_product foreign key(product_id) references products(product_id),
	primary key(order_id, product_id),
	quantity integer
);


--INGREDIENTS
create table if not exists ingredients(
	ingredient_id varchar(10) primary key,
	price_per_kg double precision,
	name varchar(30),
	available_mass double precision
);


--RECIPES
create table if not exists recipes(
	product_id varchar(10),
	constraint fk_product2 foreign key(product_id) references products(product_id) ON DELETE cascade,
	ingredient_id varchar(10),
	constraint fk_ingredient foreign key(ingredient_id) references ingredients(ingredient_id) ON DELETE cascade,
	constraint pk_recipe primary key(product_id, ingredient_id)
	ingredient_mass double precision	
);

