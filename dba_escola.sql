/*1. Criar o banco de dados respeitando os relacionamentos.*/
create database escola;

use escola;

create table responsavel (
id int not null auto_increment primary key,
nome varchar(100) not null,
cpf varchar(100) not null,
telefone varchar(100) null,
email varchar(100) not null
);


create table aluno (
id int not null auto_increment primary key,
nome varchar(100) not null,
data_nascimento datetime not null,
cpf varchar(100) not null,
sexo char(1) not null default 'F',
telefone varchar(100) null,
email varchar(100) not null
);



create table matricula (
id int not null auto_increment primary key,
data_matricula datetime not null default now(),
status varchar (100) not null,
id_aluno int not null,
id_turma int not null,
constraint fk_matricula_aluno foreign key(id_aluno) references aluno(id),
constraint fk_matricula_turma foreign key(id_turma) references turma(id)
);



create table turma (
id int not null auto_increment primary key,
nome_turma varchar(100) not null,
ano_letivo varchar(100) not null,
turno varchar(100) not null default "Matutino",
id_curso int not null,
constraint fk_turma_curso foreign key(id_curso) references curso(id) 
);



create table curso (
id int not null auto_increment primary key,
nome_curso varchar(100) not null,
nivel varchar(100) not null,
carga_horaria time not null
);

create table disciplina (
id int not null auto_increment primary key,
nome_disciplina varchar(100) not null,
carga_horaria int not null,
id_curso int not null,
constraint fk_disciplina_curso foreign key(id_curso) references curso(id)
);

create table professor (
id int not null auto_increment primary key,
nome varchar(100) not null,
cpf varchar(100) not null,
telefone varchar(100) null,
email varchar(100) null,
especialidade varchar(100) not null
);


/* 2. Adicione na tabela ALUNO: Coluna endereco do tipo VARCHAR(150)*/
alter table aluno add endereco varchar(150) not null;

/*3. Altere a tabela PROFESSOR: Modifique o campo email para ser NOT NULL*/
alter table professor modify email varchar(100) not null;

/*4. Adicione uma restrição: Na tabela DISCIPLINA, a carga_horaria deve ser maior que 20*/
alter table disciplina add constraint check_ch check (carga_horaria > 20);

/*5. Adicione uma nova coluna na tabela TURMA: capacidade (inteiro) Valor padrão: 30  */
alter table turma add capacidade int not null default 30;

/*6. Remova a coluna telefone da tabela RESPONSAVEL*/
alter table responsavel drop column telefone;

/*7. Remova a tabela MATRICULA, garantindo que não haja erro de chave estrangeira.  */
drop table matricula;

/*8. Remova a restrição de chave estrangeira entre TURMA e CURSO*/
alter table turma drop foreign key fk_turma_curso;

/*9. Exclua a tabela DISCIPLINA*/
drop table disciplina;

/*10. Apague todas as tabelas do banco respeitando a ordem correta (sem erro de dependência)*/
drop table if exists professor;
drop table if exists curso;
drop table if exists disciplina;
drop table if exists turma;
drop table if exists matricula;
drop table if exists aluno;
drop table if exists responsavel;

/*11. Crie a tabela RESPONSAVEL com:
cpf único
Relacionamento 1:1 com ALUNO*/

create table aluno (
id int not null auto_increment primary key,
nome varchar(100) not null,
data_nascimento datetime not null,
cpf varchar(100) not null,
sexo char(1) not null default 'F',
telefone varchar(100) null,
email varchar(100) not null
);

create table responsavel (
id int not null auto_increment primary key,
nome varchar(100) not null,
cpf varchar(100) not null unique,
telefone varchar(100) null,
email varchar(100) not null,
id_aluno int not null,
constraint fk_responsavel_aluno foreign key(id_aluno) references aluno(id) on delete cascade
);

/*12. Altere a tabela MATRICULA:
Adicione um CHECK para status aceitar apenas:
'ativa', 'trancada', 'cancelada'*/

create table curso (
id int not null auto_increment primary key,
nome_curso varchar(100) not null,
nivel varchar(100) not null,
carga_horaria time not null
);

create table turma (
id int not null auto_increment primary key,
nome_turma varchar(100) not null,
ano_letivo varchar(100) not null,
turno varchar(100) not null default "Matutino",
id_curso int not null,
constraint fk_turma_curso foreign key(id_curso) references curso(id) 
);

create table matricula (
id int not null auto_increment primary key,
data_matricula datetime not null default now(),
status varchar (100) not null,
id_aluno int not null,
id_turma int not null,
constraint fk_matricula_aluno foreign key(id_aluno) references aluno(id),
constraint fk_matricula_turma foreign key(id_turma) references turma(id)
);
alter table matricula add constraint check_status check(status ('ativa' or 'trancada' or 'cancelada'));

/*13. Renomeie a tabela DISCIPLINA para MATERIA*/
create table disciplina (
id int not null auto_increment primary key,
nome_disciplina varchar(100) not null,
carga_horaria int not null,
id_curso int not null,
constraint fk_disciplina_curso foreign key(id_curso) references curso(id)
);

alter table disciplina rename to materia;



















