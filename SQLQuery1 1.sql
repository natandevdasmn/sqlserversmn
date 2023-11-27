-- Create table `Usuario`
CREATE TABLE Usuario (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    sobrenome VARCHAR(90) NOT NULL,
    cpf INT NOT NULL,
    registro_geral INT NOT NULL,
    data_nascimento DATE NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha VARCHAR(15) NOT NULL
);

-- Create table `Endereco_Usuario`
CREATE TABLE Endereco_Usuario (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Usuario_id INT NOT NULL FOREIGN KEY REFERENCES Usuario(id),
    cep INT NOT NULL,
    logradouro VARCHAR(90) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(70) NOT NULL,
    municipio VARCHAR(70) NOT NULL,
    estado VARCHAR(70) NOT NULL,
    pais VARCHAR(70) NOT NULL
);

-- Create table `Nota_Fical`
CREATE TABLE Nota_Fical (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    valor_total DECIMAL(10,2) NOT NULL,
    valor_tributos DECIMAL(10,2) NOT NULL
);

-- Create table `Motoboy`
CREATE TABLE Motoboy (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    sobrenome VARCHAR(70) NOT NULL,
    data_nascimento DATE NOT NULL,
    cnh INT NOT NULL,
    cpf INT NOT NULL
);

-- Create table `Localizacao_Motoboy`
CREATE TABLE Localizacao_Motoboy (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    longitude FLOAT NOT NULL,
    latitude FLOAT NOT NULL,
    Motoboy_id INT NOT NULL FOREIGN KEY REFERENCES Motoboy(id)
);

-- Create table `Pedido`
CREATE TABLE Pedido (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Usuario_id INT NOT NULL FOREIGN KEY REFERENCES Usuario(id),
    Nota_Fical_id INT NOT NULL FOREIGN KEY REFERENCES Nota_Fical(id),
    Localizacao_Motoboy_id INT NOT NULL FOREIGN KEY REFERENCES Localizacao_Motoboy(id),
    Valor_Total DECIMAL(10,2) NOT NULL
);

-- Create table `Endereco_Restaurante`
CREATE TABLE Endereco_Restaurante (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    cep INT NOT NULL,
    logradouro VARCHAR(90) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    bairro VARCHAR(70) NOT NULL,
    municipio VARCHAR(70) NOT NULL,
    estado VARCHAR(70) NOT NULL,
    pais VARCHAR(70) NOT NULL
);

-- Create table `Restaurante`
CREATE TABLE Restaurante (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Endereco_Restaurante_id INT NOT NULL FOREIGN KEY REFERENCES Endereco_Restaurante(id),
    nome VARCHAR(90) NOT NULL,
    data_inauguracao DATE NOT NULL,
    cnpj VARCHAR(45) NOT NULL UNIQUE
);

-- Create table `Regiao_Atuacao_Rest`
CREATE TABLE Regiao_Atuacao_Rest (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Restaurante_id INT NOT NULL FOREIGN KEY REFERENCES Restaurante(id),
    nome VARCHAR(70) NOT NULL,
    bairro VARCHAR(70) NOT NULL,
    municipio VARCHAR(70) NOT NULL,
    estado VARCHAR(70) NOT NULL
);

-- Create table `Moto`
CREATE TABLE Moto (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Motoboy_id INT NOT NULL FOREIGN KEY REFERENCES Motoboy(id),
    modelo VARCHAR(45) NOT NULL,
    marca VARCHAR(45) NOT NULL,
    ano VARCHAR(45) NOT NULL,
    cor VARCHAR(45) NOT NULL,
    placa VARCHAR(7) NOT NULL UNIQUE
);

-- Create table `Comida`
CREATE TABLE Comida (
    id INT NOT NULL IDENTITY(1,1) PRIMARY KEY,
    Restaurante_id INT NOT NULL FOREIGN KEY REFERENCES Restaurante(id),
    nome VARCHAR(255) NOT NULL,
    ingrediente VARCHAR(45) NOT NULL,