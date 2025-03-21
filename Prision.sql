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

USE SistemaCarcerario;

INSERT INTO Prisoes (endereco, N_celas, descricao) VALUES
('Rua da Paz, 123', 50, 'Prisão de segurança média localizada na cidade de São Paulo.'),
('Av. Liberdade, 456', 80, 'Prisão de segurança máxima localizada na cidade do Rio de Janeiro.'),
('Rua das Flores, 789', 30, 'Prisão de segurança mínima localizada na cidade de Belo Horizonte.'),
('Av. dos Estados, 1011', 100, 'Prisão de segurança máxima localizada na cidade de Brasília.'),
('Rua Nova, 1213', 60, 'Prisão de segurança média localizada na cidade de Curitiba.'),
('Av. Central, 1415', 45, 'Prisão de segurança mínima localizada na cidade de Porto Alegre.'),
('Rua Esperança, 1617', 70, 'Prisão de segurança média localizada na cidade de Salvador.'),
('Av. da Liberdade, 1819', 85, 'Prisão de segurança máxima localizada na cidade de Recife.'),
('Rua do Sol, 2021', 55, 'Prisão de segurança média localizada na cidade de Fortaleza.'),
('Av. Independência, 2223', 75, 'Prisão de segurança máxima localizada na cidade de Manaus.'),
('Rua do Comércio, 2425', 40, 'Prisão de segurança mínima localizada na cidade de Belém.'),
('Av. Principal, 2627', 90, 'Prisão de segurança máxima localizada na cidade de Goiânia.');

INSERT INTO Celas (setor, lotacao, N_presos, descricao, prisao_id) VALUES
('A', 10, 8, 'Cela no setor A, próxima ao refeitório.', 1),
('B', 12, 12, 'Cela no setor B, próxima ao pátio de exercícios.', 1),
('A', 10, 8, 'Cela no setor A, próxima ao refeitório.', 2),
('B', 12, 12, 'Cela no setor B, próxima ao pátio de exercícios.', 2),
('C', 8, 7, 'Cela no setor C, próximo à enfermaria.', 2),
('D', 15, 10, 'Cela no setor D, próximo ao campo de futebol.', 3),
('E', 10, 9, 'Cela no setor E, próxima à área de visitação.', 3),
('F', 12, 11, 'Cela no setor F, próxima à biblioteca.', 3),
('G', 14, 13, 'Cela no setor G, próximo ao bloco administrativo.', 4),
('H', 9, 8, 'Cela no setor H, próxima ao estacionamento.', 4),
('I', 11, 10, 'Cela no setor I, próximo à entrada principal.', 4),
('J', 13, 12, 'Cela no setor J, próximo ao pátio central.', 5),
('K', 10, 9, 'Cela no setor K, próxima à área de recreação.', 5),
('L', 12, 11, 'Cela no setor L, próxima ao bloco de oficinas.',6),
('M', 14, 12, 'Cela no setor M, próximo ao bloco de segurança.', 6),
('N', 8, 7, 'Cela no setor N, próxima ao setor médico.', 6),
('O', 10, 8, 'Cela no setor O, próximo ao refeitório principal.', 7),
('P', 12, 11, 'Cela no setor P, próxima ao campo de esportes.', 7),
('Q', 15, 13, 'Cela no setor Q, próximo à área de isolamento.', 7),
('R', 9, 8, 'Cela no setor R, próxima ao bloco de visitas íntimas.', 8),
('S', 11, 10, 'Cela no setor S, próxima ao pátio de visitas.', 8),
('T', 13, 12, 'Cela no setor T, próxima à área administrativa.', 9),
('U', 10, 9, 'Cela no setor U, próxima à biblioteca central.', 9),
('V', 12, 11, 'Cela no setor V, próxima ao estacionamento de funcionários.', 10),
('W', 14, 12, 'Cela no setor W, próxima ao bloco de segurança máxima.', 10),
('X', 8, 7, 'Cela no setor X, próxima ao setor de saúde mental.', 11),
('Y', 10, 8, 'Cela no setor Y, próximo ao refeitório de funcionários.', 11),
('Z', 12, 10, 'Cela no setor Z, próximo ao bloco de ensino.', 12);

INSERT INTO Presos (nome, data_nascimento, cpf, sexo, endereco, data_entrada, data_prevista_saida, cela_id) VALUES
('João Silva', '1985-05-15', '12345678901', 'M', 'Rua A, 123', '2022-01-10', '2025-01-10', 1),
('Maria Souza', '1990-08-22', '23456789012', 'F', 'Rua B, 456', '2021-03-15', '2024-03-15', 2),
('Pedro Oliveira', '1975-11-30', '34567890123', 'M', 'Rua C, 789', '2019-06-20', '2023-06-20', 3),
('Ana Costa', '1980-04-18', '45678901234', 'F', 'Rua D, 101', '2020-09-10', '2023-09-10', 4),
('Lucas Pereira', '1995-12-25', '56789012345', 'M', 'Rua E, 202', '2023-01-01', '2026-01-01', 5),
('Clara Santos', '1987-07-14', '67890123456', 'F', 'Rua F, 303', '2022-02-20', '2025-02-20', 6),
('Felipe Almeida', '1992-03-05', '78901234567', 'M', 'Rua G, 404', '2021-05-10', '2024-05-10', 7),
('Gabriela Lima', '1984-10-12', '89012345678', 'F', 'Rua H, 505', '2020-08-15', '2023-08-15', 8),
('Ricardo Silva', '1979-09-22', '90123456789', 'M', 'Rua I, 606', '2019-12-10', '2023-12-10', 9),
('Fernanda Oliveira', '1993-02-28', '01234567890', 'F', 'Rua J, 707', '2022-04-15', '2025-04-15', 10),
('Carlos Souza', '1981-06-18', '11234567890', 'M', 'Rua K, 808', '2021-07-20', '2024-07-20', 11),
('Juliana Costa', '1986-01-23', '21234567890', 'F', 'Rua L, 909', '2020-03-05', '2023-03-05', 12),
('Bruno Pereira', '1994-04-17', '31234567890', 'M', 'Rua M, 1010', '2019-10-10', '2023-10-10', 13),
('Larissa Santos', '1991-09-30', '41234567890', 'F', 'Rua N, 1111', '2022-05-20', '2025-05-20', 14),
('Renato Almeida', '1983-11-25', '51234567890', 'M', 'Rua O, 1212', '2021-02-10', '2024-02-10', 15),
('Mariana Lima', '1988-07-14', '61234567890', 'F', 'Rua P, 1313', '2020-09-15', '2023-09-15', 16),
('Thiago Silva', '1997-05-05', '71234567890', 'M', 'Rua Q, 1414', '2023-01-20', '2026-01-20', 17),
('Patrícia Souza', '1978-10-28', '81234567890', 'F', 'Rua R, 1515', '2022-02-10', '2025-02-10', 18),
('Gustavo Oliveira', '1990-06-20', '91234567890', 'M', 'Rua S, 1616', '2021-04-15', '2024-04-15', 19),
('Rafaela Costa', '1982-08-12', '13245678901', 'F', 'Rua T, 1717', '2020-12-10', '2023-12-10', 20),
('Eduardo Pereira', '1993-02-10', '23245678901', 'M', 'Rua U, 1818', '2019-11-15', '2023-11-15', 21),
('Sabrina Santos', '1985-11-30', '33245678901', 'F', 'Rua V, 1919', '2022-06-10', '2025-06-10', 22),
('Rodrigo Almeida', '1991-01-12', '43245678901', 'M', 'Rua W, 2020', '2021-08-15', '2024-08-15', 23),
('Daniela Lima', '1989-04-22', '53245678901', 'F', 'Rua X, 2121', '2020-10-10', '2023-10-10', 24),
('Marcos Silva', '1996-07-18', '63245678901', 'M', 'Rua Y, 2222', '2023-02-20', '2026-02-20', 25),
('Paula Souza', '1987-09-05', '73245678901', 'F', 'Rua Z, 2323', '2022-03-10', '2025-03-10', 1),
('Leandro Oliveira', '1984-12-18', '83245678901', 'M', 'Rua AA, 2424', '2021-01-15', '2024-01-15', 2),
('Carla Costa', '1992-03-25', '93245678901', 'F', 'Rua BB, 2525', '2020-04-10', '2023-04-10', 3),
('Vinícius Pereira', '1980-10-12', '04245678901', 'M', 'Rua CC, 2626', '2019-07-20', '2023-07-20', 4),
('Fabiana Santos', '1993-08-22', '14245678901', 'F', 'Rua DD, 2727', '2022-05-15', '2025-05-15', 5),
('Rafael Almeida', '1986-02-10', '24245678901', 'M', 'Rua EE, 2828', '2021-06-10', '2024-06-10', 6),
('Jéssica Lima', '1988-11-30', '34245678901', 'F', 'Rua FF, 2929', '2020-08-15', '2023-08-15', 7),
('Alexandre Silva', '1979-07-14', '44245678901', 'M', 'Rua GG, 3030', '2019-12-10', '2023-12-10', 8),
('Natália Souza', '1994-04-17', '54245678901', 'F', 'Rua HH, 3131', '2022-09-20', '2025-09-20', 9),
('Fernando Oliveira', '1983-01-23', '64245678901', 'M', 'Rua II, 3232', '2021-10-10', '2024-10-10', 10),
('Lívia Costa', '1989-06-18', '74245678901', 'F', 'Rua JJ, 3333', '2020-02-15', '2023-02-15', 11),
('Márcio Pereira', '1995-12-25', '84245678901', 'M', 'Rua KK, 3434', '2023-03-20', '2026-03-20', 12),
('Andréa Santos', '1984-08-14', '94245678901', 'F', 'Rua LL, 3535', '2022-01-10', '2025-01-10', 13),
('Diego Almeida', '1990-11-25', '05245678901', 'M', 'Rua MM, 3636', '2021-07-15', '2024-07-15', 14),
('Bianca Lima', '1987-05-15', '15245678901', 'F', 'Rua NN, 3737', '2020-09-10', '2023-09-10', 15),
('Wagner Silva', '1978-12-18', '25245678901', 'M', 'Rua OO, 3838', '2019-10-15', '2023-10-15', 16),
('Aline Souza', '1991-03-05', '35245678901', 'F', 'Rua PP, 3939', '2022-05-10', '2025-05-10', 17),
('Sandro Oliveira', '1985-07-22', '45245678901', 'M', 'Rua QQ, 4040', '2021-06-20', '2024-06-20', 18),
('Viviane Costa', '1990-11-30', '55245678901', 'F', 'Rua RR, 4141', '2020-08-10', '2023-08-10', 19),
('Cristiano Pereira', '1982-04-18', '65245678901', 'M', 'Rua SS, 4242', '2019-12-20', '2023-12-20', 20),
('Thaís Santos', '1994-09-05', '75245678901', 'F', 'Rua TT, 4343', '2022-10-10', '2025-10-10', 21),
('Adriano Almeida', '1986-02-28', '85245678901', 'M', 'Rua UU, 4444', '2021-03-20', '2024-03-20', 22),
('Juliana Lima', '1993-08-12', '95245678901', 'F', 'Rua VV, 4545', '2020-12-10', '2023-12-10', 23),
('Henrique Silva', '1987-06-20', '06245678901', 'M', 'Rua WW, 4646', '2019-11-15', '2023-11-15', 24),
('Isabela Souza', '1992-04-22', '16245678901', 'F', 'Rua XX, 4747', '2022-09-10', '2025-09-10', 25),
('Marcelo Oliveira', '1984-12-25', '26245678901', 'M', 'Rua YY, 4848', '2021-01-10', '2024-01-10', 1),
('Roberta Costa', '1990-05-15', '36245678901', 'F', 'Rua ZZ, 4949', '2020-07-20', '2023-07-20', 2),
('Vitor Pereira', '1988-08-18', '46245678901', 'M', 'Rua AA, 5050', '2023-02-15', '2026-02-15', 3),
('Débora Santos', '1985-11-25', '56245678901', 'F', 'Rua BB, 5151', '2022-03-20', '2025-03-20', 4),
('Antônio Almeida', '1991-09-30', '66245678901', 'M', 'Rua CC, 5252', '2021-10-10', '2024-10-10', 5),
('Simone Lima', '1979-07-14', '76245678901', 'F', 'Rua DD, 5353', '2020-11-15', '2023-11-15', 6),
('Murilo Silva', '1994-02-28', '86245678901', 'M', 'Rua EE, 5454', '2019-09-10', '2023-09-10', 7),
('Tatiana Souza', '1986-12-18', '96245678901', 'F', 'Rua FF, 5555', '2022-04-15', '2025-04-15', 8),
('Luís Oliveira', '1990-06-12', '07245678901', 'M', 'Rua GG, 5656', '2021-02-10', '2024-02-10', 9),
('Priscila Costa', '1984-09-30', '17245678901', 'F', 'Rua HH, 5757', '2020-06-15', '2023-06-15', 10),
('Otávio Pereira', '1987-03-25', '27245678901', 'M', 'Rua II, 5858', '2019-08-10', '2023-08-10', 11),
('Alice Santos', '1993-07-22', '37245678901', 'F', 'Rua JJ, 5959', '2022-01-20', '2025-01-20', 12),
('Ricardo Almeida', '1988-11-30', '47245678901', 'M', 'Rua KK, 6060', '2021-04-10', '2024-04-10', 13),
('Ingrid Lima', '1995-04-17', '57245678901', 'F', 'Rua LL, 6161', '2020-09-15', '2023-09-15', 14),
('Luan Silva', '1978-08-14', '67245678901', 'M', 'Rua MM, 6262', '2019-10-10', '2023-10-10', 15),
('Verônica Souza', '1990-05-05', '77245678901', 'F', 'Rua NN, 6363', '2022-05-10', '2025-05-10', 16),
('Nelson Oliveira', '1983-12-18', '87245678901', 'M', 'Rua OO, 6464', '2021-03-15', '2024-03-15', 17),
('Helena Costa', '1992-07-14', '97245678901', 'F', 'Rua PP, 6565', '2020-12-20', '2023-12-20', 18),
('Roberto Pereira', '1989-11-30', '08245678901', 'M', 'Rua QQ, 6666', '2019-06-10', '2023-06-10', 19),
('Claudia Santos', '1985-08-22', '18245678901', 'F', 'Rua RR, 6767', '2022-03-10', '2025-03-10', 20),
('Paulo Almeida', '1993-02-28', '28245678901', 'M', 'Rua SS, 6868', '2021-05-15', '2024-05-15', 21),
('Renata Lima', '1987-06-20', '38245678901', 'F', 'Rua TT, 6969', '2020-08-10', '2023-08-10', 22),
('Anderson Silva', '1990-04-12', '48245678901', 'M', 'Rua UU, 7070', '2019-12-15', '2023-12-15', 23),
('Vanessa Souza', '1982-09-05', '58245678901', 'F', 'Rua VV, 7171', '2022-09-10', '2025-09-10', 24),
('Miguel Oliveira', '1994-08-18', '68245678901', 'M', 'Rua WW, 7272', '2021-02-20', '2024-02-20', 25),
('Camila Costa', '1986-07-30', '78245678901', 'F', 'Rua XX, 7373', '2020-06-10', '2023-06-10', 1),
('Fábio Pereira', '1988-05-22', '88245678901', 'M', 'Rua YY, 7474', '2019-11-15', '2023-11-15', 2),
('Lara Santos', '1991-12-18', '98245678901', 'F', 'Rua ZZ, 7575', '2022-04-20', '2025-04-20', 3),
('Marcelo Almeida', '1979-10-12', '09245678901', 'M', 'Rua AA, 7676', '2021-07-10', '2024-07-10', 4),
('Bianca Lima', '1990-01-23', '19245678901', 'F', 'Rua BB, 7777', '2020-09-15', '2023-09-15', 5),
('Rodrigo Silva', '1985-03-25', '29245678901', 'M', 'Rua CC, 7878', '2019-10-20', '2023-10-20', 6),
('Daniele Souza', '1992-07-22', '39245678901', 'F', 'Rua DD, 7979', '2022-01-10', '2025-01-10', 7),
('Eduardo Oliveira', '1983-04-17', '49245678901', 'M', 'Rua EE, 8080', '2021-02-15', '2024-02-15', 8),
('Mariana Costa', '1986-08-14', '59245678901', 'F', 'Rua FF, 8181', '2020-10-10', '2023-10-10', 9),
('Felipe Pereira', '1991-05-05', '69245678901', 'M', 'Rua GG, 8282', '2019-09-15', '2023-09-15', 10),
('Clara Santos', '1984-12-25', '79245678901', 'F', 'Rua HH, 8383', '2022-05-10', '2025-05-10', 11),
('Lucas Almeida', '1990-07-14', '89245678901', 'M', 'Rua II, 8484', '2021-01-20', '2024-01-20', 12),
('Gabriela Lima', '1988-02-28', '99245678901', 'F', 'Rua JJ, 8585', '2020-03-15', '2023-03-15', 13),
('Ricardo Silva', '1987-11-30', '00245678901', 'M', 'Rua KK, 8686', '2019-10-10', '2023-10-10', 14),
('Amanda Souza', '1993-08-12', '10245678901', 'F', 'Rua LL, 8787', '2022-04-10', '2025-04-10', 15),
('Vitor Oliveira', '1986-06-18', '20245678901', 'M', 'Rua MM, 8888', '2021-09-10', '2024-09-10', 16),
('Tatiana Costa', '1994-04-22', '30245678901', 'F', 'Rua NN, 8989', '2020-12-15', '2023-12-15', 17),
('Leandro Pereira', '1985-11-25', '40245678901', 'M', 'Rua OO, 9090', '2019-07-10', '2023-07-10', 18),
('Patrícia Santos', '1991-09-30', '50245678901', 'F', 'Rua PP, 9191', '2022-03-20', '2025-03-20', 19),
('Gustavo Almeida', '1987-08-14', '60245678901', 'M', 'Rua QQ, 9292', '2021-10-15', '2024-10-15', 20),
('Vanessa Lima', '1992-07-05', '70245678901', 'F', 'Rua RR, 9393', '2020-08-10', '2023-08-10', 21),
('Renato Silva', '1983-02-10', '80245678901', 'M', 'Rua SS, 9494', '2019-12-15', '2023-12-15', 22),
('Lívia Souza', '1990-01-23', '90245678901', 'F', 'Rua TT, 9595', '2022-06-10', '2025-06-10', 23),
('Henrique Oliveira', '1988-05-15', '01245678901', 'M', 'Rua UU, 9696', '2021-03-20', '2024-03-20', 24),
('Cláudia Costa', '1993-11-30', '11245678901', 'F', 'Rua VV, 9797', '2020-07-10', '2023-07-10', 25);

INSERT INTO Crimes (tipo, gravidade, descricao, preso_id) VALUES
('Roubo', 'Alto', 'Roubo à mão armada', 1),
('Tráfico', 'Alto', 'Tráfico de drogas', 2),
('Assassinato', 'Extremo', 'Homicídio doloso', 3),
('Furto', 'Médio', 'Furto de veículo', 4),
('Estelionato', 'Médio', 'Fraude financeira', 5),
('Sequestro', 'Alto', 'Sequestro e cárcere privado', 6),
('Porte Ilegal de Arma', 'Alto', 'Porte ilegal de arma de fogo', 7),
('Violência Doméstica', 'Médio', 'Agressão física a cônjuge', 8),
('Latrocínio', 'Extremo', 'Roubo seguido de morte', 9),
('Corrupção', 'Alto', 'Corrupção ativa', 10),
('Tráfico de Drogas', 'Alto', 'Tráfico internacional de entorpecentes', 11),
('Lavagem de Dinheiro', 'Alto', 'Lavagem de dinheiro', 12),
('Assalto', 'Alto', 'Assalto à mão armada', 13),
('Extorsão', 'Alto', 'Extorsão mediante sequestro', 14),
('Homicídio', 'Extremo', 'Homicídio qualificado', 15),
('Tráfico Humano', 'Extremo', 'Tráfico de pessoas', 16),
('Fraude', 'Médio', 'Fraude bancária', 17),
('Abuso de Menores', 'Extremo', 'Abuso sexual de menores', 18),
('Incêndio Criminoso', 'Alto', 'Incêndio doloso', 19),
('Estupro', 'Extremo', 'Violência sexual', 20),
('Falsificação', 'Médio', 'Falsificação de documentos', 21),
('Conspiração', 'Alto', 'Conspiração para cometer crime', 22),
('Ameaça', 'Médio', 'Ameaça de morte', 23),
('Receptação', 'Médio', 'Receptação de produtos roubados', 24),
('Desacato', 'Médio', 'Desacato à autoridade', 25),
('Roubo', 'Alto', 'Roubo à mão armada', 26),
('Tráfico', 'Alto', 'Tráfico de drogas', 27),
('Assassinato', 'Extremo', 'Homicídio doloso', 28),
('Furto', 'Médio', 'Furto de veículo', 29),
('Estelionato', 'Médio', 'Fraude financeira', 30),
('Sequestro', 'Alto', 'Sequestro e cárcere privado', 31),
('Porte Ilegal de Arma', 'Alto', 'Porte ilegal de arma de fogo', 32),
('Violência Doméstica', 'Médio', 'Agressão física a cônjuge', 33),
('Latrocínio', 'Extremo', 'Roubo seguido de morte', 34),
('Corrupção', 'Alto', 'Corrupção ativa', 35),
('Tráfico de Drogas', 'Alto', 'Tráfico internacional de entorpecentes', 36),
('Lavagem de Dinheiro', 'Alto', 'Lavagem de dinheiro', 37),
('Assalto', 'Alto', 'Assalto à mão armada', 38),
('Extorsão', 'Alto', 'Extorsão mediante sequestro', 39),
('Homicídio', 'Extremo', 'Homicídio qualificado', 40),
('Tráfico Humano', 'Extremo', 'Tráfico de pessoas', 41),
('Fraude', 'Médio', 'Fraude bancária', 42),
('Abuso de Menores', 'Extremo', 'Abuso sexual de menores', 43),
('Incêndio Criminoso', 'Alto', 'Incêndio doloso', 44),
('Estupro', 'Extremo', 'Violência sexual', 45),
('Falsificação', 'Médio', 'Falsificação de documentos', 46),
('Conspiração', 'Alto', 'Conspiração para cometer crime', 47),
('Ameaça', 'Médio', 'Ameaça de morte', 48),
('Receptação', 'Médio', 'Receptação de produtos roubados', 49),
('Desacato', 'Médio', 'Desacato à autoridade', 50),
('Roubo', 'Alto', 'Roubo à mão armada', 51),
('Tráfico', 'Alto', 'Tráfico de drogas', 52),
('Assassinato', 'Extremo', 'Homicídio doloso', 53),
('Furto', 'Médio', 'Furto de veículo', 54),
('Estelionato', 'Médio', 'Fraude financeira', 55),
('Sequestro', 'Alto', 'Sequestro e cárcere privado', 56),
('Porte Ilegal de Arma', 'Alto', 'Porte ilegal de arma de fogo', 57),
('Violência Doméstica', 'Médio', 'Agressão física a cônjuge', 58),
('Latrocínio', 'Extremo', 'Roubo seguido de morte', 59),
('Corrupção', 'Alto', 'Corrupção ativa', 60),
('Tráfico de Drogas', 'Alto', 'Tráfico internacional de entorpecentes', 61),
('Lavagem de Dinheiro', 'Alto', 'Lavagem de dinheiro', 62),
('Assalto', 'Alto', 'Assalto à mão armada', 63),
('Extorsão', 'Alto', 'Extorsão mediante sequestro', 64),
('Homicídio', 'Extremo', 'Homicídio qualificado', 65),
('Tráfico Humano', 'Extremo', 'Tráfico de pessoas', 66),
('Fraude', 'Médio', 'Fraude bancária', 67),
('Abuso de Menores', 'Extremo', 'Abuso sexual de menores', 68),
('Incêndio Criminoso', 'Alto', 'Incêndio doloso', 69),
('Estupro', 'Extremo', 'Violência sexual', 70),
('Falsificação', 'Médio', 'Falsificação de documentos', 71),
('Conspiração', 'Alto', 'Conspiração para cometer crime', 72),
('Ameaça', 'Médio', 'Ameaça de morte', 73),
('Receptação', 'Médio', 'Receptação de produtos roubados', 74),
('Desacato', 'Médio', 'Desacato à autoridade', 75),
('Roubo', 'Alto', 'Roubo à mão armada', 76),
('Tráfico', 'Alto', 'Tráfico de drogas', 77),
('Assassinato', 'Extremo', 'Homicídio doloso', 78),
('Furto', 'Médio', 'Furto de veículo', 79),
('Estelionato', 'Médio', 'Fraude financeira', 80),
('Sequestro', 'Alto', 'Sequestro e cárcere privado', 81),
('Porte Ilegal de Arma', 'Alto', 'Porte ilegal de arma de fogo', 82),
('Violência Doméstica', 'Médio', 'Agressão física a cônjuge', 83),
('Latrocínio', 'Extremo', 'Roubo seguido de morte', 84),
('Corrupção', 'Alto', 'Corrupção ativa', 85),
('Tráfico de Drogas', 'Alto', 'Tráfico internacional de entorpecentes', 86),
('Lavagem de Dinheiro', 'Alto', 'Lavagem de dinheiro', 87),
('Assalto', 'Alto', 'Assalto à mão armada', 88),
('Extorsão', 'Alto', 'Extorsão mediante sequestro', 89),
('Homicídio', 'Extremo', 'Homicídio qualificado', 90),
('Tráfico Humano', 'Extremo', 'Tráfico de pessoas', 91),
('Fraude', 'Médio', 'Fraude bancária', 92),
('Abuso de Menores', 'Extremo', 'Abuso sexual de menores', 93),
('Incêndio Criminoso', 'Alto', 'Incêndio doloso', 94),
('Estupro', 'Extremo', 'Violência sexual', 95),
('Falsificação', 'Médio', 'Falsificação de documentos', 96),
('Conspiração', 'Alto', 'Conspiração para cometer crime', 97),
('Ameaça', 'Médio', 'Ameaça de morte', 98),
('Receptação', 'Médio', 'Receptação de produtos roubados', 99),
('Desacato', 'Médio', 'Desacato à autoridade', 100);

INSERT INTO Sentencas (duracao, descricao, crime_id) VALUES
('5 anos', 'Sentença por roubo à mão armada', 1),
('10 anos', 'Sentença por tráfico de drogas', 2),
('25 anos', 'Sentença por homicídio doloso', 3),
('3 anos', 'Sentença por furto de veículo', 4),
('4 anos', 'Sentença por fraude financeira', 5),
('15 anos', 'Sentença por sequestro e cárcere privado', 6),
('7 anos', 'Sentença por porte ilegal de arma de fogo', 7),
('2 anos', 'Sentença por agressão física a cônjuge', 8),
('30 anos', 'Sentença por roubo seguido de morte', 9),
('8 anos', 'Sentença por corrupção ativa', 10),
('20 anos', 'Sentença por tráfico internacional de entorpecentes', 11),
('12 anos', 'Sentença por lavagem de dinheiro', 12),
('6 anos', 'Sentença por assalto à mão armada', 13),
('18 anos', 'Sentença por extorsão mediante sequestro', 14),
('25 anos', 'Sentença por homicídio qualificado', 15),
('20 anos', 'Sentença por tráfico de pessoas', 16),
('5 anos', 'Sentença por fraude bancária', 17),
('30 anos', 'Sentença por abuso sexual de menores', 18),
('10 anos', 'Sentença por incêndio doloso', 19),
('25 anos', 'Sentença por violência sexual', 20),
('4 anos', 'Sentença por falsificação de documentos', 21),
('7 anos', 'Sentença por conspiração para cometer crime', 22),
('2 anos', 'Sentença por ameaça de morte', 23),
('3 anos', 'Sentença por receptação de produtos roubados', 24),
('1 ano', 'Sentença por desacato à autoridade', 25),
('5 anos', 'Sentença por roubo à mão armada', 26),
('10 anos', 'Sentença por tráfico de drogas', 27),
('25 anos', 'Sentença por homicídio doloso', 28),
('3 anos', 'Sentença por furto de veículo', 29),
('4 anos', 'Sentença por fraude financeira', 30),
('15 anos', 'Sentença por sequestro e cárcere privado', 31),
('7 anos', 'Sentença por porte ilegal de arma de fogo', 32),
('2 anos', 'Sentença por agressão física a cônjuge', 33),
('30 anos', 'Sentença por roubo seguido de morte', 34),
('8 anos', 'Sentença por corrupção ativa', 35),
('20 anos', 'Sentença por tráfico internacional de entorpecentes', 36),
('12 anos', 'Sentença por lavagem de dinheiro', 37),
('6 anos', 'Sentença por assalto à mão armada', 38),
('18 anos', 'Sentença por extorsão mediante sequestro', 39),
('25 anos', 'Sentença por homicídio qualificado', 40),
('20 anos', 'Sentença por tráfico de pessoas', 41),
('5 anos', 'Sentença por fraude bancária', 42),
('30 anos', 'Sentença por abuso sexual de menores', 43),
('10 anos', 'Sentença por incêndio doloso', 44),
('25 anos', 'Sentença por violência sexual', 45),
('4 anos', 'Sentença por falsificação de documentos', 46),
('7 anos', 'Sentença por conspiração para cometer crime', 47),
('2 anos', 'Sentença por ameaça de morte', 48),
('3 anos', 'Sentença por receptação de produtos roubados', 49),
('1 ano', 'Sentença por desacato à autoridade', 50),
('5 anos', 'Sentença por roubo à mão armada', 51),
('10 anos', 'Sentença por tráfico de drogas', 52),
('25 anos', 'Sentença por homicídio doloso', 53),
('3 anos', 'Sentença por furto de veículo', 54),
('4 anos', 'Sentença por fraude financeira', 55),
('15 anos', 'Sentença por sequestro e cárcere privado', 56),
('7 anos', 'Sentença por porte ilegal de arma de fogo', 57),
('2 anos', 'Sentença por agressão física a cônjuge', 58),
('30 anos', 'Sentença por roubo seguido de morte', 59),
('8 anos', 'Sentença por corrupção ativa', 60),
('20 anos', 'Sentença por tráfico internacional de entorpecentes', 61),
('12 anos', 'Sentença por lavagem de dinheiro', 62),
('6 anos', 'Sentença por assalto à mão armada', 63),
('18 anos', 'Sentença por extorsão mediante sequestro', 64),
('25 anos', 'Sentença por homicídio qualificado', 65),
('20 anos', 'Sentença por tráfico de pessoas', 66),
('5 anos', 'Sentença por fraude bancária', 67),
('30 anos', 'Sentença por abuso sexual de menores', 68),
('10 anos', 'Sentença por incêndio doloso', 69),
('25 anos', 'Sentença por violência sexual', 70),
('4 anos', 'Sentença por falsificação de documentos', 71),
('7 anos', 'Sentença por conspiração para cometer crime', 72),
('2 anos', 'Sentença por ameaça de morte', 73),
('3 anos', 'Sentença por receptação de produtos roubados', 74),
('1 ano', 'Sentença por desacato à autoridade', 75),
('5 anos', 'Sentença por roubo à mão armada', 76),
('10 anos', 'Sentença por tráfico de drogas', 77),
('25 anos', 'Sentença por homicídio doloso', 78),
('3 anos', 'Sentença por furto de veículo', 79),
('4 anos', 'Sentença por fraude financeira', 80),
('15 anos', 'Sentença por sequestro e cárcere privado', 81),
('7 anos', 'Sentença por porte ilegal de arma de fogo', 82),
('2 anos', 'Sentença por agressão física a cônjuge', 83),
('30 anos', 'Sentença por roubo seguido de morte', 84),
('8 anos', 'Sentença por corrupção ativa', 85),
('20 anos', 'Sentença por tráfico internacional de entorpecentes', 86),
('12 anos', 'Sentença por lavagem de dinheiro', 87),
('6 anos', 'Sentença por assalto à mão armada', 88),
('18 anos', 'Sentença por extorsão mediante sequestro', 89),
('25 anos', 'Sentença por homicídio qualificado', 90),
('20 anos', 'Sentença por tráfico de pessoas', 91),
('5 anos', 'Sentença por fraude bancária', 92),
('30 anos', 'Sentença por abuso sexual de menores', 93),
('10 anos', 'Sentença por incêndio doloso', 94),
('25 anos', 'Sentença por violência sexual', 95),
('4 anos', 'Sentença por falsificação de documentos', 96),
('7 anos', 'Sentença por conspiração para cometer crime', 97),
('2 anos', 'Sentença por ameaça de morte', 98),
('3 anos', 'Sentença por receptação de produtos roubados', 99),
('1 ano', 'Sentença por desacato à autoridade', 100);

INSERT INTO Programa (nome, tipo, descricao) VALUES
('Trabalho', 'Reabilitação', 'Duração: 6 meses'),
('Educação', 'Reabilitação', 'Duração: 6 meses'),
('Terapia', 'Reabilitação', 'Duração: 6 meses'),
('Treinamento', 'Reabilitação', 'Duração: 6 meses'),
('Oficinas Culturais', 'Reabilitação', 'Duração: 3 meses'),
('Esportes', 'Reabilitação', 'Duração: 4 meses'),
('Artesanato', 'Reabilitação', 'Duração: 5 meses'),
('Leitura e Escrita', 'Reabilitação', 'Duração: 6 meses'),
('Programação', 'Reabilitação', 'Duração: 8 meses'),
('Música', 'Reabilitação', 'Duração: 4 meses'),
('Teatro', 'Reabilitação', 'Duração: 4 meses'),
('Culinária', 'Reabilitação', 'Duração: 3 meses'),
('Jardinagem', 'Reabilitação', 'Duração: 2 meses'),
('Empreendedorismo', 'Reabilitação', 'Duração: 7 meses'),
('Meditação', 'Reabilitação', 'Duração: 1 mês');

INSERT INTO Participacao (dt_inicio, dt_fim, descricao, programa_id, preso_id) VALUES
('2023-01-01', '2023-06-30', 'Trabalho', 1, 1),
('2023-02-01', '2023-07-31', 'Educação', 2, 2),
('2023-03-01', '2023-08-31', 'Terapia', 3, 3),
('2023-04-01', '2023-09-30', 'Treinamento', 4, 4),
('2023-05-01', '2023-08-31', 'Oficinas Culturais', 5, 5),
('2023-06-01', '2023-09-30', 'Esportes', 6, 6),
('2023-07-01', '2023-11-30', 'Artesanato', 7, 7),
('2023-08-01', '2024-01-31', 'Leitura e Escrita', 8, 8),
('2023-09-01', '2024-04-30', 'Programação', 9, 9),
('2023-10-01', '2024-01-31', 'Música', 10, 10),
('2023-11-01', '2024-02-29', 'Teatro', 11, 11),
('2023-12-01', '2024-02-29', 'Culinária', 12, 12),
('2024-01-01', '2024-02-29', 'Jardinagem', 13, 13),
('2024-02-01', '2024-08-31', 'Empreendedorismo', 14, 14),
('2024-03-01', '2024-03-31', 'Meditação', 15, 15),
('2024-04-01', '2024-09-30', 'Trabalho', 1, 16),
('2024-05-01', '2024-10-31', 'Educação', 2, 17),
('2024-06-01', '2024-11-30', 'Terapia', 3, 18),
('2024-07-01', '2024-12-31', 'Treinamento', 4, 19),
('2024-08-01', '2024-11-30', 'Oficinas Culturais', 5, 20),
('2024-09-01', '2024-12-31', 'Esportes', 6, 21),
('2024-10-01', '2025-02-28', 'Artesanato', 7, 22),
('2024-11-01', '2025-04-30', 'Leitura e Escrita', 8, 23),
('2024-12-01', '2025-07-31', 'Programação', 9, 24),
('2025-01-01', '2025-04-30', 'Música', 10, 25),
('2025-02-01', '2025-05-31', 'Teatro', 11, 26),
('2025-03-01', '2025-05-31', 'Culinária', 12, 27),
('2025-04-01', '2025-05-31', 'Jardinagem', 13, 28),
('2025-05-01', '2025-11-30', 'Empreendedorismo', 14, 29),
('2025-06-01', '2025-06-30', 'Meditação', 15, 30),
('2025-07-01', '2025-12-31', 'Trabalho', 1, 31),
('2025-08-01', '2026-01-31', 'Educação', 2, 32),
('2025-09-01', '2026-02-28', 'Terapia', 3, 33),
('2025-10-01', '2026-03-31', 'Treinamento', 4, 34),
('2025-11-01', '2026-02-28', 'Oficinas Culturais', 5, 35),
('2025-12-01', '2026-03-31', 'Esportes', 6, 36),
('2026-01-01', '2026-05-31', 'Artesanato', 7, 37),
('2026-02-01', '2026-07-31', 'Leitura e Escrita', 8, 38),
('2026-03-01', '2026-10-31', 'Programação', 9, 39),
('2026-04-01', '2026-07-31', 'Música', 10, 40),
('2026-05-01', '2026-08-31', 'Teatro', 11, 41),
('2026-06-01', '2026-08-31', 'Culinária', 12, 42),
('2026-07-01', '2026-08-31', 'Jardinagem', 13, 43),
('2026-08-01', '2027-02-28', 'Empreendedorismo', 14, 44),
('2026-09-01', '2026-09-30', 'Meditação', 15, 45),
('2026-10-01', '2027-03-31', 'Trabalho', 1, 46),
('2026-11-01', '2027-04-30', 'Educação', 2, 47),
('2026-12-01', '2027-05-31', 'Terapia', 3, 48),
('2027-01-01', '2027-06-30', 'Treinamento', 4, 49),
('2027-02-01', '2027-05-31', 'Oficinas Culturais', 5, 50),
('2027-03-01', '2027-06-30', 'Esportes', 6, 51),
('2027-04-01', '2027-08-31', 'Artesanato', 7, 52),
('2027-05-01', '2027-10-31', 'Leitura e Escrita', 8, 53),
('2027-06-01', '2028-01-31', 'Programação', 9, 54),
('2027-07-01', '2027-10-31', 'Música', 10, 55),
('2027-08-01', '2027-11-30', 'Teatro', 11, 56),
('2027-09-01', '2027-11-30', 'Culinária', 12, 57),
('2027-10-01', '2027-11-30', 'Jardinagem', 13, 58),
('2027-11-01', '2028-05-31', 'Empreendedorismo', 14, 59),
('2027-12-01', '2027-12-31', 'Meditação', 15, 60),
('2028-01-01', '2028-06-30', 'Trabalho', 1, 61),
('2028-02-01', '2028-07-31', 'Educação', 2, 62),
('2028-03-01', '2028-08-31', 'Terapia', 3, 63),
('2028-04-01', '2028-09-30', 'Treinamento', 4, 64),
('2028-05-01', '2028-08-31', 'Oficinas Culturais', 5, 65),
('2028-06-01', '2028-09-30', 'Esportes', 6, 66),
('2028-07-01', '2028-11-30', 'Artesanato', 7, 67),
('2028-08-01', '2029-01-31', 'Leitura e Escrita', 8, 68),
('2028-09-01', '2029-04-30', 'Programação', 9, 69),
('2028-10-01', '2029-01-31', 'Música', 10, 70),
('2028-11-01', '2029-02-28', 'Teatro', 11, 71),
('2028-12-01', '2029-02-28', 'Culinária', 12, 72),
('2029-01-01', '2029-02-28', 'Jardinagem', 13, 73),
('2029-02-01', '2029-08-31', 'Empreendedorismo', 14, 74),
('2029-03-01', '2029-03-31', 'Meditação', 15, 75),
('2029-04-01', '2029-09-30', 'Trabalho', 1, 76),
('2029-05-01', '2029-10-31', 'Educação', 2, 77),
('2029-06-01', '2029-11-30', 'Terapia', 3, 78),
('2029-07-01', '2029-12-31', 'Treinamento', 4, 79),
('2029-08-01', '2029-11-30', 'Oficinas Culturais', 5, 80),
('2029-09-01', '2029-12-31', 'Esportes', 6, 81),
('2029-10-01', '2030-02-28', 'Artesanato', 7, 82),
('2029-11-01', '2030-04-30', 'Leitura e Escrita', 8, 83),
('2029-12-01', '2030-07-31', 'Programação', 9, 84),
('2030-01-01', '2030-04-30', 'Música', 10, 85),
('2030-02-01', '2030-05-31', 'Teatro', 11, 86),
('2030-03-01', '2030-05-31', 'Culinária', 12, 87),
('2030-04-01', '2030-05-31', 'Jardinagem', 13, 88),
('2030-05-01', '2030-11-30', 'Empreendedorismo', 14, 89),
('2030-06-01', '2030-06-30', 'Meditação', 15, 90),
('2030-07-01', '2030-12-31', 'Trabalho', 1, 91),
('2030-08-01', '2031-01-31', 'Educação', 2, 92),
('2030-09-01', '2031-02-28', 'Terapia', 3, 93),
('2030-10-01', '2031-03-31', 'Treinamento', 4, 94),
('2030-11-01', '2031-02-28', 'Oficinas Culturais', 5, 95),
('2030-12-01', '2031-03-31', 'Esportes', 6, 96),
('2031-01-01', '2031-05-31', 'Artesanato', 7, 97),
('2031-02-01', '2031-07-31', 'Leitura e Escrita', 8, 98),
('2031-03-01', '2031-10-31', 'Programação', 9, 99),
('2031-04-01', '2031-07-31', 'Música', 10, 100);

INSERT INTO Saude (complicacao, condicao, dt_diagnostico, tratamento, preso_id) VALUES
('Nenhuma', 'Saudável', '2023-01-01', 'Nenhum', 1),
('Hipertensão', 'Controlada', '2023-02-01', 'Medicação diária', 2),
('Diabetes', 'Controlada', '2023-03-01', 'Insulina diária', 3),
('Nenhuma', 'Saudável', '2023-04-01', 'Nenhum', 4),
('Asma', 'Controlada', '2023-05-01', 'Inalação', 5),
('Nenhuma', 'Saudável', '2023-06-01', 'Nenhum', 6),
('Depressão', 'Tratamento', '2023-07-01', 'Terapia semanal', 7),
('Nenhuma', 'Saudável', '2023-08-01', 'Nenhum', 8),
('Hipertensão', 'Controlada', '2023-09-01', 'Medicação diária', 9),
('Nenhuma', 'Saudável', '2023-10-01', 'Nenhum', 10),
('Diabetes', 'Controlada', '2023-11-01', 'Insulina diária', 11),
('Nenhuma', 'Saudável', '2023-12-01', 'Nenhum', 12),
('Asma', 'Controlada', '2024-01-01', 'Inalação', 13),
('Nenhuma', 'Saudável', '2024-02-01', 'Nenhum', 14),
('Depressão', 'Tratamento', '2024-03-01', 'Terapia semanal', 15),
('Nenhuma', 'Saudável', '2024-04-01', 'Nenhum', 16),
('Hipertensão', 'Controlada', '2024-05-01', 'Medicação diária', 17),
('Nenhuma', 'Saudável', '2024-06-01', 'Nenhum', 18),
('Diabetes', 'Controlada', '2024-07-01', 'Insulina diária', 19),
('Nenhuma', 'Saudável', '2024-08-01', 'Nenhum', 20),
('Asma', 'Controlada', '2024-09-01', 'Inalação', 21),
('Nenhuma', 'Saudável', '2024-10-01', 'Nenhum', 22),
('Depressão', 'Tratamento', '2024-11-01', 'Terapia semanal', 23),
('Nenhuma', 'Saudável', '2024-12-01', 'Nenhum', 24),
('Hipertensão', 'Controlada', '2025-01-01', 'Medicação diária', 25),
('Nenhuma', 'Saudável', '2025-02-01', 'Nenhum', 26),
('Diabetes', 'Controlada', '2025-03-01', 'Insulina diária', 27),
('Nenhuma', 'Saudável', '2025-04-01', 'Nenhum', 28),
('Asma', 'Controlada', '2025-05-01', 'Inalação', 29),
('Nenhuma', 'Saudável', '2025-06-01', 'Nenhum', 30),
('Depressão', 'Tratamento', '2025-07-01', 'Terapia semanal', 31),
('Nenhuma', 'Saudável', '2025-08-01', 'Nenhum', 32),
('Hipertensão', 'Controlada', '2025-09-01', 'Medicação diária', 33),
('Nenhuma', 'Saudável', '2025-10-01', 'Nenhum', 34),
('Diabetes', 'Controlada', '2025-11-01', 'Insulina diária', 35),
('Nenhuma', 'Saudável', '2025-12-01', 'Nenhum', 36),
('Asma', 'Controlada', '2026-01-01', 'Inalação', 37),
('Nenhuma', 'Saudável', '2026-02-01', 'Nenhum', 38),
('Depressão', 'Tratamento', '2026-03-01', 'Terapia semanal', 39),
('Nenhuma', 'Saudável', '2026-04-01', 'Nenhum', 40),
('Hipertensão', 'Controlada', '2026-05-01', 'Medicação diária', 41),
('Nenhuma', 'Saudável', '2026-06-01', 'Nenhum', 42),
('Diabetes', 'Controlada', '2026-07-01', 'Insulina diária', 43),
('Nenhuma', 'Saudável', '2026-08-01', 'Nenhum', 44),
('Asma', 'Controlada', '2026-09-01', 'Inalação', 45),
('Nenhuma', 'Saudável', '2026-10-01', 'Nenhum', 46),
('Depressão', 'Tratamento', '2026-11-01', 'Terapia semanal', 47),
('Nenhuma', 'Saudável', '2026-12-01', 'Nenhum', 48),
('Hipertensão', 'Controlada', '2027-01-01', 'Medicação diária', 49),
('Nenhuma', 'Saudável', '2027-02-01', 'Nenhum', 50),
('Diabetes', 'Controlada', '2027-03-01', 'Insulina diária', 51),
('Nenhuma', 'Saudável', '2027-04-01', 'Nenhum', 52),
('Asma', 'Controlada', '2027-05-01', 'Inalação', 53),
('Nenhuma', 'Saudável', '2027-06-01', 'Nenhum', 54),
('Depressão', 'Tratamento', '2027-07-01', 'Terapia semanal', 55),
('Nenhuma', 'Saudável', '2027-08-01', 'Nenhum', 56),
('Hipertensão', 'Controlada', '2027-09-01', 'Medicação diária', 57),
('Nenhuma', 'Saudável', '2027-10-01', 'Nenhum', 58),
('Diabetes', 'Controlada', '2027-11-01', 'Insulina diária', 59),
('Nenhuma', 'Saudável', '2027-12-01', 'Nenhum', 60),
('Asma', 'Controlada', '2028-01-01', 'Inalação', 61),
('Nenhuma', 'Saudável', '2028-02-01', 'Nenhum', 62),
('Depressão', 'Tratamento', '2028-03-01', 'Terapia semanal', 63),
('Nenhuma', 'Saudável', '2028-04-01', 'Nenhum', 64),
('Hipertensão', 'Controlada', '2028-05-01', 'Medicação diária', 65),
('Nenhuma', 'Saudável', '2028-06-01', 'Nenhum', 66),
('Diabetes', 'Controlada', '2028-07-01', 'Insulina diária', 67),
('Nenhuma', 'Saudável', '2028-08-01', 'Nenhum', 68),
('Asma', 'Controlada', '2028-09-01', 'Inalação', 69),
('Nenhuma', 'Saudável', '2028-10-01', 'Nenhum', 70),
('Depressão', 'Tratamento', '2028-11-01', 'Terapia semanal', 71),
('Nenhuma', 'Saudável', '2028-12-01', 'Nenhum', 72),
('Hipertensão', 'Controlada', '2029-01-01', 'Medicação diária', 73),
('Nenhuma', 'Saudável', '2029-02-01', 'Nenhum', 74),
('Diabetes', 'Controlada', '2029-03-01', 'Insulina diária', 75),
('Nenhuma', 'Saudável', '2029-04-01', 'Nenhum', 76),
('Asma', 'Controlada', '2029-05-01', 'Inalação', 77),
('Nenhuma', 'Saudável', '2029-06-01', 'Nenhum', 78),
('Depressão', 'Tratamento', '2029-07-01', 'Terapia semanal', 79),
('Nenhuma', 'Saudável', '2029-08-01', 'Nenhum', 80),
('Hipertensão', 'Controlada', '2029-09-01', 'Medicação diária', 81),
('Nenhuma', 'Saudável', '2029-10-01', 'Nenhum', 82),
('Diabetes', 'Controlada', '2029-11-01', 'Insulina diária', 83),
('Nenhuma', 'Saudável', '2029-12-01', 'Nenhum', 84),
('Asma', 'Controlada', '2030-01-01', 'Inalação', 85),
('Nenhuma', 'Saudável', '2030-02-01', 'Nenhum', 86),
('Depressão', 'Tratamento', '2030-03-01', 'Terapia semanal', 87),
('Nenhuma', 'Saudável', '2030-04-01', 'Nenhum', 88),
('Hipertensão', 'Controlada', '2030-05-01', 'Medicação diária', 89),
('Nenhuma', 'Saudável', '2030-06-01', 'Nenhum', 90),
('Diabetes', 'Controlada', '2030-07-01', 'Insulina diária', 91),
('Nenhuma', 'Saudável', '2030-08-01', 'Nenhum', 92),
('Asma', 'Controlada', '2030-09-01', 'Inalação', 93),
('Nenhuma', 'Saudável', '2030-10-01', 'Nenhum', 94),
('Depressão', 'Tratamento', '2030-11-01', 'Terapia semanal', 95),
('Nenhuma', 'Saudável', '2030-12-01', 'Nenhum', 96),
('Hipertensão', 'Controlada', '2031-01-01', 'Medicação diária', 97),
('Nenhuma', 'Saudável', '2031-02-01', 'Nenhum', 98),
('Diabetes', 'Controlada', '2031-03-01', 'Insulina diária', 99),
('Nenhuma', 'Saudável', '2031-04-01', 'Nenhum', 100);

INSERT INTO Funcionario (nome, cargo, h_inicio, h_fim, contato) VALUES
('Carlos Silva', 'Agente Penitenciário', '08:00:00', '17:00:00', 'carlos.silva@example.com'),
('Ana Paula Souza', 'Assistente Social', '09:00:00', '18:00:00', 'ana.souza@example.com'),
('João Ferreira', 'Psicólogo', '08:00:00', '17:00:00', 'joao.ferreira@example.com'),
('Maria Oliveira', 'Médica', '07:00:00', '16:00:00', 'maria.oliveira@example.com'),
('Pedro Santos', 'Enfermeiro', '08:00:00', '17:00:00', 'pedro.santos@example.com'),
('Fernanda Lima', 'Advogada', '09:00:00', '18:00:00', 'fernanda.lima@example.com'),
('Daniel Rodrigues', 'Agente Penitenciário', '08:00:00', '17:00:00', 'daniel.rodrigues@example.com'),
('Lucas Almeida', 'Professor', '10:00:00', '19:00:00', 'lucas.almeida@example.com'),
('Juliana Costa', 'Coordenadora', '07:00:00', '16:00:00', 'juliana.costa@example.com'),
('Ricardo Pereira', 'Instrutor de Oficinas', '08:00:00', '17:00:00', 'ricardo.pereira@example.com'),
('Beatriz Ramos', 'Nutricionista', '07:00:00', '16:00:00', 'beatriz.ramos@example.com'),
('Gustavo Nunes', 'Agente Penitenciário', '08:00:00', '17:00:00', 'gustavo.nunes@example.com'),
('Carla Mendes', 'Psicóloga', '09:00:00', '18:00:00', 'carla.mendes@example.com'),
('Rafael Lima', 'Advogado', '10:00:00', '19:00:00', 'rafael.lima@example.com'),
('Bruna Souza', 'Enfermeira', '08:00:00', '17:00:00', 'bruna.souza@example.com'),
('Felipe Martins', 'Médico', '07:00:00', '16:00:00', 'felipe.martins@example.com'),
('Renata Silva', 'Assistente Social', '09:00:00', '18:00:00', 'renata.silva@example.com'),
('Marcelo Costa', 'Professor', '10:00:00', '19:00:00', 'marcelo.costa@example.com'),
('Larissa Almeida', 'Nutricionista', '07:00:00', '16:00:00', 'larissa.almeida@example.com'),
('Tiago Santos', 'Instrutor de Oficinas', '08:00:00', '17:00:00', 'tiago.santos@example.com'),
('Camila Pereira', 'Coordenadora', '07:00:00', '16:00:00', 'camila.pereira@example.com');

USE SistemaCarcerario;

SELECT Presos.nome AS Preso, Celas.setor AS Setor, Celas.descricao AS CelaDescricao
FROM Presos
INNER JOIN Celas ON Presos.cela_id = Celas.cela_id;

SELECT Crimes.tipo AS Crime, Sentencas.duracao AS Duracao, Sentencas.descricao AS SentencaDescricao
FROM Crimes
INNER JOIN Sentencas ON Crimes.crime_id = Sentencas.crime_id;

SELECT Presos.nome AS Preso, Saude.complicacao AS Complicacao, Saude.condicao AS Condicao
FROM Presos
LEFT JOIN Saude ON Presos.preso_id = Saude.preso_id;

SELECT Familia.numero AS FamiliaNumero, Visita.dt_visita AS DataVisita, Visita.h_inicio AS HoraInicio
FROM Familia
LEFT JOIN Visita ON Familia.Familia_id = Visita.Familia_id;

SELECT Programa.nome AS Programa, Participacao.dt_inicio AS DataInicio, Participacao.dt_fim AS DataFim
FROM Participacao
RIGHT JOIN Programa ON Participacao.participacao_id = Programa.programa_id;

SELECT Crimes.tipo AS Crime, Presos.nome AS Preso, Crimes.descricao AS CrimeDescricao
FROM Crimes
RIGHT JOIN Presos ON Crimes.preso_id = Presos.preso_id;

SELECT
    Presos.nome AS Preso,
    Participacao.dt_inicio AS DataInicio,
    Participacao.dt_fim AS DataFim,
    Programa.nome AS Programa,
    Programa.tipo AS TipoPrograma,
    Programa.descricao AS ProgramaDescricao
FROM
    Presos
INNER JOIN
    Participacao ON Presos.preso_id = Participacao.preso_id
INNER JOIN
    Programa ON Participacao.programa_id = Programa.programa_id;
  
SELECT
    Presos.nome AS Preso,
    Participacao.dt_inicio AS DataInicio,
    Participacao.dt_fim AS DataFim,
    Programa.nome AS Programa,
    Programa.tipo AS TipoPrograma,
    Programa.descricao AS ProgramaDescricao
FROM
    Presos
RIGHT JOIN
    Participacao ON Presos.preso_id = Participacao.preso_id
RIGHT JOIN
    Programa ON Participacao.programa_id = Programa.programa_id;
 
SELECT
    Presos.nome AS Preso,
    Crimes.tipo AS Crime,
    Crimes.gravidade AS Gravidade,
    Crimes.descricao AS CrimeDescricao,
    Sentencas.duracao AS DuracaoSentenca,
    Sentencas.descricao AS SentencaDescricao
FROM
    Presos
INNER JOIN
    Crimes ON Presos.preso_id = Crimes.preso_id
INNER JOIN
    Sentencas ON Crimes.crime_id = Sentencas.crime_id;
    
SELECT
    Presos.nome AS Preso,
    Saude.complicacao AS Complicacao,
    Saude.condicao AS Condicao,
    Saude.dt_diagnostico AS DataDiagnostico,
    Saude.tratamento AS Tratamento
FROM
    Presos
INNER JOIN
    Saude ON Presos.preso_id = Saude.preso_id;

SELECT
    Presos.nome AS Preso,
    Saude.complicacao AS Complicacao,
    Saude.condicao AS Condicao,
    Saude.dt_diagnostico AS DataDiagnostico,
    Saude.tratamento AS Tratamento
FROM
    Presos
RIGHT JOIN
    Saude ON Presos.preso_id = Saude.preso_id;


USE SistemaCarcerario;

SELECT * FROM Presos;
SELECT * FROM Prisoes;
SELECT * FROM saude;
SELECT * FROM Programa;
SELECT * FROM Participacao;
SELECT * FROM Celas;
SELECT * FROM Funcionario;

DELETE FROM Funcionario WHERE funcionario_id = 21;
SELECT * FROM Funcionario;

UPDATE Presos
SET endereco = 'Rua dos bobo, 0'
WHERE preso_id = 1;
SELECT * FROM Presos;

UPDATE Saude
SET condicao = 'Melhorando', tratamento = 'Cha de Picão Doce'
WHERE preso_id = 2;
SELECT * FROM saude;

UPDATE Celas
SET lotacao = 15
WHERE cela_id = 3;
SELECT * FROM Celas;

UPDATE Funcionario
SET h_inicio = '09:00:00', h_fim = '18:00:00'
WHERE funcionario_id = 10;
SELECT * FROM Funcionario;
