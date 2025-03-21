CREATE DATABASE SistemaCarcerario;

USE SistemaCarcerario;

CREATE TABLE Prisoes (
    prisao_id INT PRIMARY KEY AUTO_INCREMENT,
    endereco VARCHAR(50),
    N_celas INT,
    descricao VARCHAR(255)
);

CREATE TABLE Celas (
    cela_id INT PRIMARY KEY AUTO_INCREMENT,
    setor VARCHAR(50),
    lotacao INT,
    N_presos INT,
    descricao VARCHAR(255),
    prisao_id INT,
    FOREIGN KEY (prisao_id) REFERENCES Prisoes(prisao_id)
);

CREATE TABLE Presos (
    preso_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(100),
    data_nascimento DATE,
    cpf VARCHAR(11),
    sexo CHAR(1),
    endereco VARCHAR(255),
    data_entrada DATE,
    data_prevista_saida DATE,
    cela_id INT,
    FOREIGN KEY (cela_id) REFERENCES Celas(cela_id)
);

CREATE TABLE Crimes (
    crime_id INT PRIMARY KEY AUTO_INCREMENT,
    tipo VARCHAR(50),
    gravidade VARCHAR(50),
    descricao VARCHAR(255),
    preso_id INT,
    FOREIGN KEY (preso_id) REFERENCES Presos(preso_id)
);

CREATE TABLE Sentencas (
    sentenca_id INT PRIMARY KEY AUTO_INCREMENT,
    duracao VARCHAR(50),
    descricao VARCHAR(255),
    crime_id INT,
    FOREIGN KEY (crime_id) REFERENCES Crimes(crime_id)
);

CREATE TABLE Programa (
    programa_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    tipo VARCHAR(50),
    descricao VARCHAR(255)
);

CREATE TABLE Participacao (
    participacao_id INT PRIMARY KEY AUTO_INCREMENT,
    dt_inicio DATE,
    dt_fim DATE,
    descricao VARCHAR(255),
    preso_id INT,
    programa_id INT,
    FOREIGN KEY (preso_id) REFERENCES Presos(preso_id),
    FOREIGN KEY (programa_id) REFERENCES Programa(programa_id)
);

CREATE TABLE Saude (
    saude_id INT PRIMARY KEY AUTO_INCREMENT,
    complicacao VARCHAR(50),
    condicao VARCHAR(50),
    dt_diagnostico DATE,
    tratamento VARCHAR(255),
    preso_id INT,
    FOREIGN KEY (preso_id) REFERENCES Presos(preso_id)
);

CREATE TABLE Funcionario (
    funcionario_id INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    cargo VARCHAR(50),
    h_inicio TIME,
    h_fim TIME,
    contato VARCHAR(50),
    prisao_id INT,
    FOREIGN KEY (prisao_id) REFERENCES Prisoes(prisao_id)
);
