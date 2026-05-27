CREATE DATABASE ESCOLA;
USE ESCOLA;

CREATE TABLE ALUNO(
    id_aluno INT PRIMARY KEY AUTO_INCREMENT,
    nome_aluno VARCHAR(100),
    idade INT
);

CREATE TABLE PROFESSOR(
    id_professor INT PRIMARY KEY AUTO_INCREMENT,
    nome_professor VARCHAR(100),
    especialidade VARCHAR(100)
);

CREATE TABLE CURSO(
    id_curso INT PRIMARY KEY AUTO_INCREMENT,
    nome_curso VARCHAR(100),
    carga_horaria INT
);

CREATE TABLE TURMA(
    id_turma INT PRIMARY KEY AUTO_INCREMENT,
    nome_turma VARCHAR(50),
    id_curso INT,
    id_professor INT,
   
    FOREIGN KEY(id_curso)
    REFERENCES CURSO(id_curso),
   
    FOREIGN KEY(id_professor)
    REFERENCES PROFESSOR(id_professor)
);

CREATE TABLE MATRICULA(
    id_matricula INT PRIMARY KEY AUTO_INCREMENT,
    id_aluno INT,
    id_turma INT,
    data_matricula DATE,
   
    FOREIGN KEY(id_aluno)
    REFERENCES ALUNO(id_aluno),
   
    FOREIGN KEY(id_turma)
    REFERENCES TURMA(id_turma)
);

INSERT INTO ALUNO(nome_aluno, idade)
VALUES
('Carlos', 20),
('Ana', 22),
('Juliana', 19),
('Roberto', 25);

INSERT INTO PROFESSOR(nome_professor, especialidade)
VALUES
('Marcos Lima', 'Banco de Dados'),
('Fernanda Souza', 'Programação'),
('Ricardo Alves', 'Redes');

INSERT INTO CURSO(nome_curso, carga_horaria)
VALUES
('Desenvolvimento Web', 200),
('Java Fundamentals', 180),
('Administração de Redes', 150);


INSERT INTO TURMA(nome_turma, id_curso, id_professor)
VALUES
('Turma A', 1, 1),
('Turma B', 2, 2),
('Turma C', 3, 3),
('Turma D', 1, NULL);

INSERT INTO MATRICULA(id_aluno, id_turma, data_matricula)
VALUES
(1, 1, '2026-05-01'),
(2, 1, '2026-05-01'),
(3, 2, '2026-05-02');

select a.nome_aluno as 'aluno',  m.data_matricula as 'data', t.nome_turma as 'turma'
from matricula m 
inner join aluno a on a.id_aluno = m.id_aluno
inner join turma t on t.id_turma = m.id_turma;

select
p.nome_professor as 'professor',
t.nome_turma as 'turma'
from turma t
left join professor p on p.id_professor = t.id_professor;

select
p.nome_professor as 'professor',
t.nome_turma as 'turma'
from turma t
left join professor p on p.id_professor = t.id_professor;

select
a.nome_aluno as 'nome',
m.id_matricula as 'matricula'
from matricula m
right join aluno a on a.id_aluno = m.id_aluno;

select
t.nome_turma as 'turma',
c.nome_curso as 'curso'
from turma t
right join curso c on t.id_curso = c.id_curso;

select
p.nome_professor as 'professor',
t.nome_turma as 'turma'
from turma t
right join professor p on p.id_professor = t.id_professor;

select
a.nome_aluno as 'aluno',
t.nome_turma as 'turma',
c.nome_curso as 'curso'
from matricula m
inner join aluno a on a.id_aluno = m.id_aluno
inner join turma t on t.id_turma = m.id_turma
inner join curso c on c.id_curso = t.id_curso
where c.nome_curso = "Java Fundamentals";

select
t.nome_turma as 'turma',
c.nome_curso as 'curso'
from turma t
right join curso c on c.id_curso = t.id_curso;

select * from turma where id_professor is null;

select
p.nome_professor as 'professor',
t.nome_turma as 'turma'
from turma t
right join professor p on p.id_professor = t.id_professor;

select * from professor;

select
a.nome_aluno as 'nome',
m.id_matricula as 'matricula'
from matricula m
right join aluno a on a.id_aluno = m.id_aluno
where m.id_matricula is null;

select
a.nome_aluno as 'aluno',
t.nome_turma as 'turma',
p.nome_professor as 'professor',
c.nome_curso as 'curso',
m.data_matricula as 'data'
from matricula m
inner join aluno a on a.id_aluno = m.id_aluno
inner join turma t on t.id_turma = m.id_turma
inner join professor p on p.id_professor = t.id_professor
inner join curso c on c.id_curso = t.id_curso;
