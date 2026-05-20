create database livros;

use livros;

create table livro(
id int not null auto_increment primary key,
nome varchar(100),
autor varchar(100),
preco numeric(9,2),
qtd_estoque int,
categoria varchar(100)
);

insert into livro (nome,autor,preco,qtd_estoque,categoria) values
("Java","Anildo",49.50,100,"Ficcção"),
("Python","Rodrigo",79.90,50,"Tecnologia"),
("C++","Jorge Silva", 200,20,"Comédia"),
("C#",'George Orwell',85.20,40,"Suspense"),
("JavaScript","João",115.40,80,"Didático");
SET SQL_SAFE_UPDATES = 0;
update livro set categoria = "Ficção" where categoria = "Ficcção";

select * from livro where categoria = "Ficção" and preco < 50;
select * from livro where nome like 'O%' or nome like 'J%';
select * from livro where nome in 'Silva';









