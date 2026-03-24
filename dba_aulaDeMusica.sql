CREATE DATABASE AULASDEMUSICA;

USE AULASDEMUSICA;


CREATE TABLE RESPONSAVEL (
    id_responsavel INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    cpf VARCHAR(14) NOT NULL UNIQUE, -- CPF formatado ou só números
    telefone VARCHAR(20),
    endereco VARCHAR(255),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE BENEFICIARIO (
    id_beneficiario INT AUTO_INCREMENT PRIMARY KEY,
    id_responsavel INT NOT NULL,
    nome VARCHAR(100) NOT NULL,
    data_nascimento DATE NOT NULL,
    sexo ENUM('M', 'F', 'Outro'),
    FOREIGN KEY (id_responsavel) REFERENCES RESPONSAVEL(id_responsavel)
);


CREATE TABLE SERVICO_AULA (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome_servico ENUM('Musicalização','Musicoterapia','Aula de Instrumento'), 
    modalidade ENUM('Individual', 'Dupla', 'Grupo P', 'Grupo G') NOT NULL,
    duracao_minutos INT DEFAULT 50
);


CREATE TABLE TURMA (
    id_turma INT AUTO_INCREMENT PRIMARY KEY,
    id_servico INT NOT NULL,
    dia_semana VARCHAR(20) NOT NULL,
    horario_inicio TIME NOT NULL,
    quantidade_alunos INT DEFAULT 1,
    FOREIGN KEY (id_servico) REFERENCES SERVICO_AULA(id_servico)
);


CREATE TABLE MATRICULA (
    id_matricula INT AUTO_INCREMENT PRIMARY KEY,
    id_beneficiario INT NOT NULL,
    id_turma INT NOT NULL,
    data_matricula DATE,
    FOREIGN KEY (id_beneficiario) REFERENCES BENEFICIARIO(id_beneficiario),
    FOREIGN KEY (id_turma) REFERENCES TURMA(id_turma)
);

-- 6. Financeiro
CREATE TABLE PAGAMENTOS (
    id_pagamento INT AUTO_INCREMENT PRIMARY KEY,
    id_responsavel INT NOT NULL,
    valor_total NUMERIC(10,2) NOT NULL,
    periodo_contratacao ENUM('Avulso', 'Mensal', 'Trimestral') DEFAULT 'Mensal',
    situacao ENUM('Pago', 'Aberto', 'Cancelado') DEFAULT 'Aberto',
    data_vencimento DATE NOT NULL,
    FOREIGN KEY (id_responsavel) REFERENCES RESPONSAVEL(id_responsavel)
);

