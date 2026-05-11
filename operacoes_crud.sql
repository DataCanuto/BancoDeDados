CREATE DATABASE LOJAVIRTUAL;

USE LOJAVIRTUAL;

CREATE TABLE CLIENTE(
id int not null auto_increment primary key,
nome varchar(100) default null,
email varchar(100) default null,
telefone varchar(20)
);

CREATE TABLE PRODUTO(
id int not null auto_increment primary key,
preco numeric(9,2),
estoque int default 1
);
alter table produto add nome varchar(20);

insert into CLIENTE (nome, email, numero) values
("Pedro","pedro@email.com","7199999999"),
("Heitor","heitor@email.com","71988888888"),
("Anildo","anildo@email.com","7177777777"),
("Geisiane","geisiane@email.com","7155555555"),
("Jon","jon@email.com","7144444444");

insert into PRODUTO value(0,6.90,100,"Coca-cola");
insert into PRODUTO value(0,2.00,100, "Guaraná-Jesus");
insert into PRODUTO value(0,6.00,100, "Fanta");
insert into PRODUTO value(0,5.00,100, "Antartica");
insert into PRODUTO value(0,1.00,100, "Gugs");

alter table cliente add data_cadastro datetime default current_timestamp();
alter table produto add categoria varchar(50);

update produto set categoria = "Coca" where id = 1;
update produto set categoria = "Guaraná" where id > 1;

update produto set preco = 10 where id = 1;

update cliente set telefone = 1100000000 where id = 1;

delete from cliente where id = 3;

select * from produto;

select * from cliente;

