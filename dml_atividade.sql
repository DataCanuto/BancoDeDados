create database dml_operation;

use dml_operation;

create table usuarios(
id int not null auto_increment primary key,
nome varchar(100) not null,
idade int);


insert into usuarios values(0,"Maria",25);
insert into usuarios values(0,"Carlos",40);
insert into usuarios (idade, nome) values (31,"Ana");


update usuarios set idade = 50 where id = 2;
update usuarios set nome = "Paulo Silva" where id = 3;
update usuarios set nome = "José", idade = 25 where id = 4;
SET SQL_SAFE_UPDATES = 0;
update usuarios set idade = idade + 1;

delete from usuarios where id = 5;
delete from usuarios where idade < 18;
delete from usuarios where idade > 80;
delete from usuarios;

select * from usuarios;
select nome from usuarios;
select nome, idade from usuarios;
select * from usuarios where id = 2;
select * from usuarios where idade > 30;

select * from usuarios where idade = 25;
select * from usuarios where idade <> 40;
select * from usuarios where idade >= 18;
select * from usuarios where idade <= 60;

select * from usuarios where id >= 1 and id <= 5;
select * from usuarios where idade >= 20 and idade <= 50;
select * from usuarios where idade = 18 or idade = 60;
select * from usuarios where id = 1 or id = 10;
select * from usuarios where not id = 3;
select * from usuarios where not idade = 25;

select * from usuarios where id between 1 and 10;
select * from usuarios where idade between 20 and 40;
select * from usuarios where id not between 5 and 15;
select * from usuarios where idade not between 30 and 50;

select * from usuarios where id in (1,3,5);
select * from usuarios where idade in (18,25,40);
select * from usuarios where id not in (2,4,6);
select * from usuarios where idade not in (20,30,50);

select * from usuarios where nome like 'M%';
select * from usuarios where nome like '%a';
select * from usuarios where nome like '%os%';
select * from usuarios where nome like '%an%';
select * from usuarios where nome not like '%ar%';

select * from usuarios where nome is null;
select * from usuarios where nome is not null;
select * from usuarios where idade is null;
select * from usuarios where idade is not null;

select sum(idade) as "Soma das idades" from usuarios;
select sum(idade) as "Soma das idades" from usuarios where idade > 50;

select avg(idade) as "Média das idades" from usuarios;
select avg(idade) as "Média das idades maiores que 18" from usuarios where idade > 18;

select min(idade) as "Menor idade" from usuarios;
select max(iadde) as "Maior idade" from usuarios;

select count(*) as "Quantidade de clientes" from usuarios;
select count(*) as "Quantida de clientes com mais de 30 anos" from usuarios where idade > 30;