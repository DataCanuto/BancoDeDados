DROP DATABASE IF EXISTS ECOMMERCE;

CREATE DATABASE ECOMMERCE;

USE ECOMMERCE;

/*DDL 
1. Criar o banco de dados respeitando os relacionamentos.
*/

CREATE TABLE USERS(
id int not null auto_increment primary key,
nome varchar(100) not null,
email varchar(100) not null,
password varchar(100) not null,
created_at timestamp default current_timestamp, 
phone varchar(20) not null
);



CREATE TABLE ADDRESSES(
id int not null auto_increment primary key,
user_id int not null,
street varchar(100),
city varchar(100),
state varchar(100),
zip varchar(100),
type int not null default 0,
is_default timestamp,
constraint fk_addresses_user foreign key (user_id) references USERS(id)
);

CREATE TABLE CATEGORIES(
id int not null auto_increment primary key,
name varchar(100) not null,
discription varchar (250) not null,
parent_category_id int not null
);



CREATE TABLE PRODUCTS(
id int not null auto_increment primary key,
category_id int not null,
name varchar(100) not null,
description varchar (100) not null,
price numeric(9,2),
stock int not null,
sku int not null,
image_url varchar (250) not null,
constraint fk_products_category foreign key (category_id) references CATEGORIES (id)
);

CREATE TABLE SHOPPING_CART(
id int not null auto_increment primary key,
user_id int not null,
created_at timestamp default current_timestamp,
updated_at timestamp default current_timestamp on update current_timestamp,
constraint fk_shoppingcart_user foreign key (user_id) references USERS(id)
);

CREATE TABLE CART_ITEMS(
id int not null auto_increment primary key,
cart_id int not null,
product_id int not null,
quantity int not null,
constraint fk_cartitems_shoppingcart foreign key (cart_id) references SHOPPING_CART(id),
constraint fk_cartitems_product foreign key (product_id) references PRODUCTS(id)
);

CREATE TABLE ORDERS(
id int not null auto_increment primary key,
user_id int not null,
addres_id int not null,
order_date timestamp,
total_amount numeric(9,2),
status bool,
constraint fk_orders_user foreign key (user_id) references USERS(id),
constraint fk_orders_addres foreign key (addres_id) references ADDRESSES(id)
);



CREATE TABLE PAYMENTS(
id int not null auto_increment primary key,
order_id int not null,
payment_method varchar (50),
amount numeric (9,2),
payment_status varchar (50),
transacional_id int not null,
constraint fk_payments_order foreign key (order_id) references ORDERS(id)
);


CREATE TABLE ORDER_ITEMS(
id int not null auto_increment primary key,
order_id int not null,
product_id int not null,
quantity int not null default 1,
price_at_purchase numeric(9,2) not null default 0,
constraint fk_orderitems_order foreign key (order_id) references ORDERS(id),
constraint fk_orderitem_product foreign key (product_id) references PRODUCTS(id)
);




