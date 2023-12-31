CREATE DATABASE BD_Natan
USE BD_Natan

-- -----------------------------------------------------
-- Criando tabela `Cliente`
-- -----------------------------------------------------
CREATE TABLE Cliente (
  id_cliente SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  nome VARCHAR(50) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  data_nascimento DATE NOT NULL,
  );

-- -----------------------------------------------------
-- Criando tabela `Contato`
-- -----------------------------------------------------
CREATE TABLE Contato (
  id_contato SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  ddd_cel VARCHAR(3) NOT NULL,
  numero_cel VARCHAR(9) NOT NULL,
  whatsapp BIT NOT NULL,
  id_cliente SMALLINT FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  );

-- -----------------------------------------------------
-- Criando tabela `Animal`
-- -----------------------------------------------------
CREATE TABLE Animal (
  id_animal SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  nome VARCHAR(50) NOT NULL,
  );

-- -----------------------------------------------------
-- Criando tabela `Time`
-- -----------------------------------------------------
CREATE TABLE Timee (
  id_time SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  nome VARCHAR(50) NOT NULL,

  );

-- -----------------------------------------------------
-- Criando tabela `Cliente_Animal`
-- -----------------------------------------------------
CREATE TABLE Cliente_Animal (
  id_cliente_animal SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  favorito BIT NOT NULL,
  id_cliente SMALLINT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  id_animal SMALLINT NOT NULL,
  FOREIGN KEY (id_animal) REFERENCES Animal(id_animal)
  );

-- -----------------------------------------------------
-- Criando tabela `Cliente_Time`
-- -----------------------------------------------------
CREATE TABLE Cliente_Time (
  id_cliente_time SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  favorito BIT NOT NULL,
  id_cliente SMALLINT NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente),
  id_time SMALLINT NOT NULL,
  FOREIGN KEY (id_time) REFERENCES Timee(id_time)
  );


  
-- -----------------------------------------------------
-- Inserindo dados dos clientes
-- -----------------------------------------------------
  INSERT INTO Cliente VALUES
('Emanuel Batista', '273.461.520-77', '20011027'),
('Matheus Nascimento', '462.220.070-82', '20111113'),
('Erick Alves', '353.374.590-23', '19810617'),
('Alex Silva', '002.525.760-98', '19890603'),
('J�lia Evellyn', '947.395.940-05', '20020730'),
('Jo�o Emanoel', '444.610.740-21', '19771213'),
('Henrique Cip�', '418.702.550-20', '20010424'),
('Alcym�rio Gabriel', '499.117.210-19', '20000102'),
('Natan Ara�jo', '968.112.310-76', '19880710'),
('Lucas Mello', '347.696.060-95', '19900815')


-- -----------------------------------------------------
-- Inserindo dados de contatos
-- -----------------------------------------------------
  INSERT INTO Contato VALUES
('83', '983986947', 0, 1),
('68', '981021248', 1, 2),
('92', '995048874', 0, 3),
('69', '979623413', 1, 4),
('95', '997513131', 0, 5),
('62', '969115734', 1, 6),
('46', '975463612', 0, 7),
('84', '999368572', 1, 8),
('95', '979650542', 0, 9),
('35', '975597241', 1, 10);

-- -----------------------------------------------------
-- Inserindo dados dos animais
-- -----------------------------------------------------
  INSERT INTO Animal VALUES
('cavalo'),
('overlha'),
('gado'),
('c�o'),
('gato'),
('pato'),
('galinha'),
('porco'),
('hamsters'),
('abelha'),
('le�o'),
('macaco'),
('gorila'),
('falc�o'),
('tucano'),
('lobo'),
('tigre'),
('urso'),
('tatu'),
('coelho')

-- -----------------------------------------------------
-- Inserindo dados dos times
-- -----------------------------------------------------
  INSERT INTO Timee VALUES
('BOTAFOGO/RJ'),
('BOTAFOGO/PB'),
('BOTAFOGO/SP'),
('BOTAFOGO/MG'),
('BOTAFOGO/SE'),
('BOTAFOGO/MA'),
('BOTAFOGO/PI'),
('BOTAFOGO/RS'),
('BOTAFOGO/SC'),
('BOTAFOGO/RR'),
('MANCHESTER CITY'),
('BAYERN DE MUNIQUE'),
('REAL MADRID'),
('PARIS SAINT-GERMAIN'),
('BARCELONA'),
('LIVERPOOL'),
('ARSENAL'),
('MANCHESTER UNITED'),
('INTER DE MIL�O'),
('NEWCASTLE')
-- -----------------------------------------------------
-- Inserindo dados da tabela Cliente Aninal
-- -----------------------------------------------------
  INSERT INTO Cliente_Animal VALUES
(1, 1, 10),
(1, 2, 9),
(1, 3, 8),
(1, 4, 7),
(1, 5, 6),
(1, 6, 5),
(1, 7, 4),
(1, 8, 3),
(1, 9, 2),
(1, 10, 1),
(0, 1, 20),
(0, 2, 19),
(0, 3, 18),
(0, 4, 17),
(0, 5, 16),
(0, 6, 15),
(0, 7, 14),
(0, 8, 13),
(0, 9, 12),
(0, 10, 11)

-- -----------------------------------------------------
-- Inserindo dados da tabela Cliente Time
-- -----------------------------------------------------
  INSERT INTO Cliente_Time VALUES
(1, 1, 10),
(1, 2, 9),
(1, 3, 8),
(1, 4, 7),
(1, 5, 6),
(1, 6, 5),
(1, 7, 4),
(1, 8, 3),
(1, 9, 2),
(1, 10, 1),
(0, 1, 20),
(0, 2, 19),
(0, 3, 18),
(0, 4, 17),
(0, 5, 16),
(0, 6, 15),
(0, 7, 14),
(0, 8, 13),
(0, 9, 12),
(0, 10, 11)



SELECT C.nome, C.cpf, CT.ddd_cel, CT.numero_cel, CT.whatsapp, C.data_nascimento, A.nome, T.nome
		FROM Cliente C



		INNER JOIN Contato CT
		ON C.id_cliente = CT.id_cliente



		INNER JOIN Cliente_Time CliT
		ON C.id_cliente = CliT.id_cliente



		INNER JOIN Timee T
		ON CliT.id_time = T.id_time



		INNER JOIN Cliente_Animal CA
		ON CA.id_cliente = C.id_cliente



		INNER JOIN Animal A
		ON CA.id_animal = A.id_animal



