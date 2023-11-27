CREATE DATABASE Restaurante_Teste

GO

USE Restaurante_Teste


-- -----------------------------------------------------
-- Criando tabela Usuario
-- -----------------------------------------------------
CREATE TABLE Usuario (
    id_usuario SMALLINT PRIMARY KEY IDENTITY NOT NULL,
    nome NVARCHAR(45) NOT NULL,
    sobrenome NVARCHAR(90) NOT NULL,
    cpf NVARCHAR(14) NOT NULL,
    registro_geral NVARCHAR(14) NOT NULL,
    data_nascimento DATE NOT NULL,
    email NVARCHAR(100) NOT NULL UNIQUE,
    senha NVARCHAR(15) NOT NULL
);


-- -----------------------------------------------------
-- Criando tabela Endereco_Usuario
-- -----------------------------------------------------
CREATE TABLE Endereco_Usuario (
    id_end_usuario SMALLINT IDENTITY PRIMARY KEY NOT NULL ,
    id_usuario SMALLINT NOT NULL FOREIGN KEY REFERENCES Usuario(id_usuario),
    cep INT NOT NULL,
    logradouro NVARCHAR(90) NOT NULL,
    numero NVARCHAR(10) NOT NULL,
    bairro NVARCHAR(70) NOT NULL,
    municipio NVARCHAR(70) NOT NULL,
    estado NVARCHAR(70) NOT NULL,
    pais NVARCHAR(70) NOT NULL
);


-- -----------------------------------------------------
-- Criando tabela Nota_Fical
-- -----------------------------------------------------
CREATE TABLE Nota_Fiscal (
    id_nota_fiscal SMALLINT PRIMARY KEY IDENTITY NOT NULL,
    valor_total DECIMAL(10,2) NOT NULL,
    valor_tributos DECIMAL(10,2) NOT NULL
);


-- -----------------------------------------------------
-- Criando tabela Motoboy
-- -----------------------------------------------------
CREATE TABLE Motoboy (
    id_motoboy SMALLINT PRIMARY KEY IDENTITY NOT NULL,
    nome NVARCHAR(45) NOT NULL,
    sobrenome NVARCHAR(70) NOT NULL,
    data_nascimento DATE NOT NULL,
    cnh NVARCHAR(14) NOT NULL,
    cpf NVARCHAR(14) NOT NULL
);


-- -----------------------------------------------------
-- Criando tabela Localizacao_Motoboy
-- -----------------------------------------------------
CREATE TABLE Localizacao_Motoboy (
    id_local_motoboy SMALLINT PRIMARY KEY IDENTITY NOT NULL,
	id_motobooy SMALLINT NOT NULL FOREIGN KEY REFERENCES Motoboy(id_motoboy),
    longitude FLOAT NOT NULL,
    latitude FLOAT NOT NULL
	
);



-- -----------------------------------------------------
-- Criando tabela Cupom_Desconto
-- -----------------------------------------------------
CREATE TABLE Cupom_Desconto (
  id_cupom SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  nome VARCHAR(45) NOT NULL,
  desconto DECIMAL NOT NULL
);



-- -----------------------------------------------------
-- Criando tabela Pedido
-- -----------------------------------------------------
CREATE TABLE Pedido (
    id_pedido SMALLINT PRIMARY KEY IDENTITY NOT NULL,
    id_usuario SMALLINT NOT NULL FOREIGN KEY REFERENCES Usuario(id_usuario),
    id_nota_fiscal SMALLINT NOT NULL FOREIGN KEY REFERENCES Nota_Fiscal(id_nota_fiscal),
    id_local_motoboy SMALLINT NOT NULL FOREIGN KEY REFERENCES Localizacao_Motoboy(id_local_motoboy),
	id_cupom SMALLINT NOT NULL FOREIGN KEY (id_cupom) REFERENCES Cupom_Desconto(id_cupom),
    Valor_Total DECIMAL(10,2) NOT NULL
);



-- -----------------------------------------------------
-- Criando tabela Restaurante
-- -----------------------------------------------------
CREATE TABLE Restaurante (
    id_restaurante SMALLINT PRIMARY KEY IDENTITY NOT NULL,
    filial_restaurante NVARCHAR(90),
    nome NVARCHAR(90) NOT NULL,
    data_inauguracao DATE NOT NULL,
    cnpj NVARCHAR(45) NOT NULL UNIQUE
);



-- -----------------------------------------------------
-- Criando tabela Endereco_Restaurante
-- -----------------------------------------------------
CREATE TABLE Endereco_Restaurante (
    id_end_restaurante SMALLINT PRIMARY KEY IDENTITY NOT NULL,
	id_restaurante SMALLINT NOT NULL FOREIGN KEY REFERENCES Restaurante(id_restaurante),
    cep NVARCHAR(15) NOT NULL,
    logradouro NVARCHAR(90) NOT NULL,
    numero NVARCHAR(10) NOT NULL,
    bairro NVARCHAR(70) NOT NULL,
    municipio NVARCHAR(70) NOT NULL,
    estado NVARCHAR(70) NOT NULL,
    pais NVARCHAR(70) NOT NULL
);




-- -----------------------------------------------------
-- Criando tabela Regiao_Atuacao_Rest
-- -----------------------------------------------------
CREATE TABLE Regiao_Atuacao_Rest (
    id_atuacao_rest SMALLINT PRIMARY KEY IDENTITY NOT NULL,
    id_restaurante SMALLINT NOT NULL FOREIGN KEY REFERENCES Restaurante(id_restaurante),
    nome NVARCHAR(70) NOT NULL,
    bairro NVARCHAR(70) NOT NULL,
    municipio NVARCHAR(70) NOT NULL,
    estado NVARCHAR(70) NOT NULL
);


-- -----------------------------------------------------
-- Criando tabela Moto
-- -----------------------------------------------------
CREATE TABLE Moto (
    id_moto SMALLINT PRIMARY KEY IDENTITY NOT NULL,
    id_motoboy SMALLINT NOT NULL FOREIGN KEY REFERENCES Motoboy(id_motoboy),
    modelo NVARCHAR(45) NOT NULL,
    marca NVARCHAR(45) NOT NULL,
    ano NVARCHAR(5) NOT NULL
);


-- -----------------------------------------------------
-- Criando tabela Comida
-- -----------------------------------------------------
CREATE TABLE Comida (
  id_comida SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  id_restaurante SMALLINT NOT NULL FOREIGN KEY REFERENCES Restaurante(id_restaurante),
  nome VARCHAR(255) NOT NULL,
  ingrediente VARCHAR(255) NOT NULL,
  custo_producao DECIMAL NOT NULL,
  valor_venda DECIMAL NOT NULL
);



-- -----------------------------------------------------
-- Criando tabela Dono
-- -----------------------------------------------------
CREATE TABLE Dono (
  id_dono SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  nome VARCHAR(45) NOT NULL,
  sobrenome VARCHAR(45) NOT NULL,
  data_nascimento VARCHAR(45) NOT NULL,
  registro_geral VARCHAR(45) NOT NULL
);


-- -----------------------------------------------------
-- Criando tabela Telefone_Usuario
-- -----------------------------------------------------
CREATE TABLE Telefone_Usuario (
  id_tel_usuario SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  id_usuario SMALLINT NOT NULL FOREIGN KEY REFERENCES Usuario(id_usuario),
  ddd_cel INT NOT NULL,
  numero_cel INT NOT NULL,
  ddd_fixo INT NULL,
  numero_fixo INT NULL,
);


-- -----------------------------------------------------
-- Criando tabela Telefone_Resturante
-- -----------------------------------------------------
CREATE TABLE Telefone_Restaurante (
  id_tel_restaurante SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  id_restaurante SMALLINT NOT NULL FOREIGN KEY REFERENCES Restaurante(id_restaurante),
  ddd_cel INT NOT NULL,
  numero_cel INT NOT NULL,
  ddd_fixo INT NULL,
  numero_fixo INT NULL
);



-- -----------------------------------------------------
-- Criando tabela Pedido_Comida
-- -----------------------------------------------------
CREATE TABLE Pedido_Comida (
  id_pedido_comida SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  id_comida SMALLINT NOT NULL FOREIGN KEY REFERENCES Comida(id_comida),
  id_pedido SMALLINT NOT NULL FOREIGN KEY REFERENCES Pedido(id_pedido)
);


-- -----------------------------------------------------
-- Criando tabela Restaurante_Dono
-- -----------------------------------------------------
CREATE TABLE Restaurante_Dono (
  id_restaurante_dono SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  id_restaurante SMALLINT NOT NULL FOREIGN KEY REFERENCES Restaurante(id_restaurante),
  id_dono SMALLINT NOT NULL FOREIGN KEY REFERENCES Dono(id_dono), 
);



-- -----------------------------------------------------
-- Inserindo dados na tabela usuário
-- -----------------------------------------------------
INSERT INTO Usuario (nome, sobrenome, cpf, registro_geral, data_nascimento, email, senha) VALUES
('João', 'Silva', '123456789012', '123456789', '1990-01-01', 'joao.silva@email.com', 'senha123'),
('Maria', 'Souza', '987654321098', '987654321', '1995-05-12', 'maria.souza@email.com', 'senha456'),
('Pedro', 'Santos', '345678901234', '345678901', '1985-10-23', 'pedro.santos@email.com', 'senha789'),
('Ana', 'Oliveira', '765432109876', '765432109', '2000-03-08', 'ana.oliveira@email.com', 'senha012'),
('Paulo', 'Costa', '109876543210', '109876543', '1975-07-14', 'paulo.costa@email.com', 'senha345'),
('Carla', 'Almeida', '234567890123', '234567890', '1980-12-25', 'carla.almeida@email.com', 'senha678'),
('Bruno', 'Ferreira', '456789012345', '456789012', '1992-04-06', 'bruno.ferreira@email.com', 'senha901'),
('Luciana', 'Pereira', '678901234567', '678901234', '1965-09-11', 'luciana.pereira@email.com', 'senha234'),
('Roberto', 'Martins', '890123456789', '890123456', '1970-02-16', 'roberto.martins@email.com', 'senha567'),
('Daniele', 'Gomes', '012345678901', '012345678', '1988-06-21', 'daniele.gomes@email.com', 'senha890');



-- -----------------------------------------------------
-- Inserindo dados na Endereco_Usuario
-- -----------------------------------------------------
INSERT INTO Endereco_Usuario (id_usuario, cep, logradouro, numero, bairro, municipio, estado, pais) VALUES
(1, 04560010, 'Rua dos Cravos', '52', 'Centro', 'São Paulo', 'SP', 'Brasil'),
(2, 22760360, 'Avenida Atlântica', '1024', 'Copacabana', 'Rio de Janeiro', 'RJ', 'Brasil'),
(3, 41550000, 'Rua Marechal Deodoro', '423', 'Centro', 'Salvador', 'BA', 'Brasil'),
(4, 31050000, 'Rua Barão da Torre', '1290', 'Boa Vista', 'Belo Horizonte', 'MG', 'Brasil'),
(5, 50720070, 'Avenida Paulista', '1500', 'Consolação', 'São Paulo', 'SP', 'Brasil'),
(6, 13010100, 'Rua Augusta', '2000', 'Jardim Paulista', 'São Paulo', 'SP', 'Brasil'),
(7, 01045010, 'Rua das Flores', '234', 'Liberdade', 'São Paulo', 'SP', 'Brasil'),
(8, 80060130, 'Avenida Marechal Floriano', '2500', 'Centro', 'Curitiba', 'PR', 'Brasil'),
(9, 70000900, 'Rua da Bahia', '100', 'Centro Histórico', 'Brasília', 'DF', 'Brasil'),
(10, 90010070, 'Rua 7 de Setembro', '321', 'Centro', 'Porto Alegre', 'RS', 'Brasil');


-- -----------------------------------------------------
-- Inserindo dados na tabela usuário
-- -----------------------------------------------------
INSERT INTO Nota_Fiscal (valor_total, valor_tributos) VALUES
(100.00, 5.00),
(200.00, 10.00),
(300.00, 15.00),
(400.00, 20.00),
(500.00, 25.00),
(600.00, 30.00),
(700.00, 35.00),
(800.00, 40.00),
(900.00, 45.00),
(1000.00, 50.00);



-- -----------------------------------------------------
-- Inserindo dados na Motoboy
-- -----------------------------------------------------
INSERT INTO Motoboy (nome, sobrenome, data_nascimento, cnh, cpf) VALUES
('Antonio', 'Silva', '1990-01-01', '486264', '123456789012'),
('Maria', 'Souza', '1995-05-12', '953751', '987654321098'),
('Pedro', 'Santos', '1985-10-23', '759351', '345678901234'),
('Ana', 'Oliveira', '2000-03-08', '426846', '765432109876'),
('Paulo', 'Costa', '1975-07-14', '852963', '109876543210'),
('Carla', 'Almeida', '1980-12-25', '147852', '234567890123'),
('Bruno', 'Ferreira', '1992-04-06', '987654', '456789012345'),
('Luciana', 'Pereira', '1965-09-11', '789321', '678901234567'),
('Roberto', 'Martins', '1970-02-16', '654741', '890123456789'),
('Daniele', 'Gomes', '1988-06-21', '852456', '0123456789012');



-- -----------------------------------------------------
-- Inserindo dados na tabela Localizacao_Motoboy
-- -----------------------------------------------------
INSERT INTO Localizacao_Motoboy (id_motobooy,longitude, latitude) VALUES
(1, -46.653302, -23.550523),
(2, -43.207297, -22.907517),
(3, -40.277056, -22.907517),
(4, -37.346815, -22.907517),
(5, -34.416574, -22.907517),
(6, -31.486333, -22.907517),
(7, -28.556092, -22.907517),
(8, -25.625851, -22.907517),
(9, -22.695610, -22.907517),
(10, -19.765369, -22.907517);



-- -----------------------------------------------------
-- Inserindo dados na tabela Cupom_Desconto
-- -----------------------------------------------------
INSERT INTO Cupom_Desconto (nome, desconto)
VALUES
('Cupom de boas-vindas', 20),
('Cupom de aniversário', 15),
('Cupom de segunda-feira', 10),
('Cupom de terça-feira', 5),
('Cupom de quarta-feira', 10),
('Cupom de quinta-feira', 5),
('Cupom de sexta-feira', 10),
('Cupom de sábado', 5),
('Cupom de domingo', 10),
('Cupom da sorte', 25);



-- -----------------------------------------------------
-- Inserindo dados na tabela Pedido
-- -----------------------------------------------------
INSERT INTO Pedido (id_usuario, id_nota_fiscal, id_local_motoboy, id_cupom, Valor_Total) VALUES
(1, 1, 1, 1, 100.00),
(2, 2, 2, 2, 150.00),
(3, 3, 3, 3, 200.00),
(4, 4, 4, 4, 250.00),
(5, 5, 5, 5, 300.00),
(6, 6, 6, 6, 350.00),
(7, 7, 7, 7, 400.00),
(8, 8, 8, 8, 450.00),
(9, 9, 9, 9, 500.00),
(10, 10, 10, 2, 550.00);


-- -----------------------------------------------------
-- Inserindo dados na tabela Restaurante
-- -----------------------------------------------------
INSERT INTO Restaurante (filial_restaurante, nome, data_inauguracao, cnpj) VALUES
('Matriz', 'Restaurante Ingá', '1995-05-15', '00.000.000/0001-01'),
('Filial 1', 'Pizzaria Paulista', '1998-10-12', '11.111.111/1111-11'),
('Filial 2', 'Sushi do Japa', '2005-02-23', '22.222.222/2222-22'),
('Filial 3', 'Restaurante China', '2010-04-06', '33.333.333/3333-33'),
('Filial 4', 'Restaurante Americano', '1995-09-11', '44.444.444/4444-44'),
('Filial 5', 'Restaurante Itatuba', '2000-02-16', '55.555.555/5555-55'),
('Filial 6', 'Restaurante Mogeiro', '1999-12-21', '66.666.666/6666-66'),
('Filial 7', 'Restaurante da Serra', '1998-08-26', '77.777.777/7777-77'),
('Filial 8', 'Restaurante do Monte', '1996-06-10', '88.888.888/8888-88'),
('Filial 9', 'Restaurante Campina', '1997-03-25', '99.999.999/9999-99');



-- -----------------------------------------------------
-- Inserindo dados na tabela Endereco_Restaurante
-- -----------------------------------------------------
INSERT INTO Endereco_Restaurante (id_restaurante, cep, logradouro, numero, bairro, municipio, estado, pais) VALUES
(1, '04560010', 'Rua dos Cravos', '52', 'Centro', 'São Paulo', 'SP', 'Brasil'),
(2, '22760360', 'Avenida Atlântica', '1024', 'Copacabana', 'Rio de Janeiro', 'RJ', 'Brasil'),
(3, '41550000', 'Rua Marechal Deodoro', '423', 'Centro', 'Salvador', 'BA', 'Brasil'),
(4, '31050000', 'Rua Barão da Torre', '1290', 'Boa Vista', 'Belo Horizonte', 'MG', 'Brasil'),
(5, '50720070', 'Avenida Paulista', '1500', 'Consolação', 'São Paulo', 'SP', 'Brasil'),
(6, '13010100', 'Rua Augusta', '2000', 'Jardim Paulista', 'São Paulo', 'SP', 'Brasil'),
(7, '01045010', 'Rua das Flores', '234', 'Liberdade', 'São Paulo', 'SP', 'Brasil'),
(8, '80060130', 'Avenida Marechal Floriano', '2500', 'Centro', 'Curitiba', 'PR', 'Brasil'),
(9, '70000900', 'Rua da Bahia', '100', 'Centro Histórico', 'Brasília', 'DF', 'Brasil'),
(10, '90010070', 'Rua 7 de Setembro', '321', 'Centro', 'Porto Alegre', 'RS', 'Brasil');



-- -----------------------------------------------------
-- Inserindo dados na tabela Regiao_Atuacao_Rest
-- -----------------------------------------------------
INSERT INTO Regiao_Atuacao_Rest (id_restaurante, nome, bairro, municipio, estado) VALUES
(1, 'Zona Sul', 'Moema', 'São Paulo', 'SP'),
(1, 'Zona Oeste', 'Butantã', 'São Paulo', 'SP'),
(1, 'Zona Norte', 'Tatuapé', 'São Paulo', 'SP'),
(2, 'Zona Sul', 'Copacabana', 'Rio de Janeiro', 'RJ'),
(2, 'Zona Oeste', 'Barra da Tijuca', 'Rio de Janeiro', 'RJ'),
(3, 'Centro', 'Centro', 'Salvador', 'BA'),
(3, 'Zona Norte', 'Pituba', 'Salvador', 'BA'),
(4, 'Zona Leste', 'Barreiro', 'Belo Horizonte', 'MG'),
(4, 'Zona Sul', 'Pampulha', 'Belo Horizonte', 'MG'),
(5, 'Centro', 'Centro', 'Brasília', 'DF');



-- -----------------------------------------------------
-- Inserindo dados na tabela usuário
-- -----------------------------------------------------
INSERT INTO Moto (id_motoboy, modelo, marca, ano) VALUES
(1, 'Honda CG 125', 'Honda', '2022'),
(1, 'Yamaha YBR 150', 'Yamaha', '2023'),
(2, 'Honda Bros 160', 'Honda', '2021'),
(2, 'Yamaha Fazer 250', 'Yamaha', '2020'),
(3, 'Honda PCX 150', 'Honda', '2022'),
(3, 'Yamaha NMAX 160', 'Yamaha', '2023'),
(4, 'Honda SH 300i', 'Honda', '2021'),
(4, 'Yamaha XMAX 300', 'Yamaha', '2020'),
(5, 'Honda Forza 350', 'Honda', '2022'),
(5, 'Yamaha TMAX 560', 'Yamaha', '2023');



-- -----------------------------------------------------
-- Inserindo dados na tabela usuário
-- -----------------------------------------------------
INSERT INTO Comida (id_restaurante, nome, ingrediente, custo_producao, valor_venda) VALUES
(1, 'Hamburguer Especial', 'Pão, 2 hambúrgueres de carne, queijo, alface, cebola, picles, molho especial', 10.00, 18.00),
(1, 'Nuggets', '10 pedaços de nuggets de frango, molho barbecue', 8.00, 12.00),
(1, 'Batata Frita', 'Batatas fritas crocantes', 5.00, 8.00),
(2, 'Margherita', 'Massa, molho de tomate, mussarela, manjericão', 15.00, 25.00),
(2, 'Quatro Queijos', 'Massa, molho de tomate, mozzarella, gorgonzola, parmesão, brie', 18.00, 30.00),
(3, 'Sushi Salmão', 'Arroz, salmão cru, alga marinha', 12.00, 20.00),
(3, 'Temaki Philadelphia', 'Cone de alga marinha, cream cheese, salmão cru', 10.00, 16.00),
(4, 'Frango Xadrez', 'Frango em cubos, pimentão vermelho, pimentão verde, cebola roxa, molho shoyu', 15.00, 25.00),
(4, 'Carne com Brócolis', 'Carne em tiras, brócolis, molho chinês', 14.00, 22.00),
(5, 'Salada de Frutas', 'Mix de frutas da estação', 8.00, 12.00);


-- -----------------------------------------------------
-- Inserindo dados na tabela Dono
-- -----------------------------------------------------
INSERT INTO Dono (nome, sobrenome, data_nascimento, registro_geral)
VALUES
('João', 'Silva', '1980-10-01', '123456789'),
('Maria', 'Souza', '1990-01-01', '987654321'),
('Pedro', 'Santos', '2000-05-01', '321456789'),
('Ana', 'Oliveira', '2010-09-01', '654321789'),
('Paulo', 'Pereira', '2020-01-01', '987654321'),
('Carla', 'Nunes', '1985-03-01', '321654789'),
('Bruno', 'Almeida', '1995-07-01', '654987321'),
('Fernanda', 'Costa', '2005-11-01', '987123456'),
('Roberto', 'Lima', '2015-03-01', '321456987'),
('Gabriela', 'Ferreira', '2025-07-01', '654789321');


-- -----------------------------------------------------
-- Inserindo dados na tabela Telefone_Usuario
-- -----------------------------------------------------
INSERT INTO Telefone_Usuario (id_usuario, ddd_cel, numero_cel, ddd_fixo, numero_fixo)
VALUES
(1, 11, 987654321, 11, 321456789),
(2, 12, 987654322, 12, 321456790),
(3, 13, 987654323, 13, 321456791),
(4, 14, 987654324, 14, 321456792),
(5, 15, 987654325, 15, 321456793),
(6, 21, 987654326, 21, 321456794),
(7, 22, 987654327, 22, 321456795),
(8, 23, 987654328, 23, 321456796),
(9, 24, 987654329, 24, 321456797),
(10, 25, 987654330, 25, 321456798);


-- -----------------------------------------------------
-- Inserindo dados na tabela Telefone_Restaurante
-- -----------------------------------------------------
INSERT INTO Telefone_Restaurante (id_restaurante, ddd_cel, numero_cel, ddd_fixo, numero_fixo)
VALUES
(1, 11, 321456789, 11, 987654321),
(2, 12, 321456790, 12, 987654322),
(3, 13, 321456791, 13, 987654323),
(4, 14, 321456792, 14, 987654324),
(5, 15, 321456793, 15, 987654325),
(6, 11, 987654330, 11, 321456798),
(7, 13, 321456791, 13, 987654323),
(8, 14, 321456792, 14, 987654324),
(9, 15, 321456793, 15, 987654325),
(10, 11, 987654330, 11, 321456798);


-- -----------------------------------------------------
-- Inserindo dados na tabela Pedido_Comida
-- -----------------------------------------------------
INSERT INTO Pedido_Comida (id_comida, id_pedido)
VALUES
(1, 10),
(2, 9),
(3, 8),
(4, 7),
(5, 6),
(6, 5),
(7, 4),
(8, 3),
(9, 2),
(10, 1);



-- -----------------------------------------------------
-- Inserindo dados na tabela Restaurante_Dono
-- -----------------------------------------------------
INSERT INTO Restaurante_Dono (id_restaurante, id_dono)
VALUES
(1, 10),
(2, 9),
(3, 8),
(4, 7),
(5, 6),
(6, 5),
(7, 4),
(8, 3),
(9, 2),
(10, 1);


-- -----------------------------------------------------
-- Exibindo todas as tabelas e todos os dados inseridos
-- -----------------------------------------------------
SELECT *
FROM Comida
SELECT *
FROM Usuario
SELECT *
FROM Restaurante
SELECT *
FROM Dono