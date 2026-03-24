-- Active: 1771079526057@@127.0.0.1@3306
create database petshop;

use petshop;

create table login(
    id int auto_increment primary key,
    email varchar(255) not null,
    senha varchar(255) not null,
    nivel_acesso int not null
)

/* Restrição para o email ser único */
alter table login add constraint UNIQUE (email);

create table cliente (
    telefone varchar(20) primary key,
    nome varchar(255),
    nascimento date,
    endereco varchar(255),
    ponto_referencia varchar (255)
)

create table empresa (
    id int auto_increment primary key,
    nome varchar(255),
    cnpj varchar(20),
    email varchar(255),
    telefone varchar(20),
    endereco varchar(255)
)

create table entregador (
    id int auto_increment primary key,
    id_empresa int,
    nome varchar(255),
    cpf varchar(20),
    rg varchar(20),
    celular varchar(20)    
)

alter table entregador add constraint fk_entregador_empresa foreign key (id_empresa) references empresa(id);

create table marmita (
    id int auto_increment primary key,
    nome varchar(255),
    descricao MEDIUMTEXT,
    tamanho varchar(255),
    valor varchar(255)
)

alter table marmita modify valor numeric(9,2);

create table item_pedido (
    id_marmita int,
    id_pedido int,
    quantidade int
)


create table pedido (
    id int auto_increment primary key,
    telefone_cliente varchar(20),
    id_entregador int,
    status varchar(255),
    taxa_entrega varchar(255),
    data datetime
)
/*Atribuindo foreing key de pedido a item_pedido*/
alter table item_pedido add constraint fk_item_pedido_pedido foreign key (id_pedido) references pedido(id);
alter table item_pedido add constraint fk_item_pedido_marmita foreign key (id_marmita) references marmita(id);

/*Atribuindo foreing key de cliente e entregador a pedido*/
alter table pedido add constraint fk_pedido_cliente foreign key (telefone_cliente) references cliente(telefone);
alter table pedido add constraint fk_pedido_entregador foreign key (id_entregador) references entregador(id);

/*Alterar tipo de dado da taxa de entrega e marmita para numérico*/
alter table pedido modify taxa_entrega numeric(9,2);
alter table marmita modify valor numeric(9,2);

/*Banco de Dados Criado com Sucesso!*/

/*Inserindo dados de teste para o banco de dados petshop*/

insert into login (email, senha, nivel_acesso) values ('pedrocanuto96@gmail.com','1234abc',1);
insert into login (email, senha, nivel_acesso) values ('mariasilva@gmail','5678def',2);
insert into cliente (telefone, nome, nascimento, endereco, ponto_referencia) values ('11987654321', 'João Silva', '1990-05-15', 'Rua A, 123', 'Perto do supermercado');
insert into cliente (telefone, nome, nascimento, endereco, ponto_referencia) values ('11912345678', 'Maria Souza', '1985-10-20', 'Avenida B, 456', 'Próximo à escola');
