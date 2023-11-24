CREATE TABLE Restaurante
GO
USE Restaurante

-- -----------------------------------------------------
-- Table `mydb`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE Usuario (
  id_usuario SMALLINT PRIMARY KEY IDENTITY NOT NULL,
  nome_usuario VARCHAR(45) NOT NULL,
  sobrenome_usuario VARCHAR(90) NOT NULL,
  cpf VARCHAR(14) NOT NULL,
  registro_geral VARCHAR(14) NOT NULL,
  data_nascimento DATE NOT NULL,
  email VARCHAR(100) NOT NULL,
  senha VARCHAR(15) NOT NULL
  );

-- -----------------------------------------------------
-- Table `mydb`.`Endereco_Usuario`
-- -----------------------------------------------------
CREATE TABLE Endereco_Usuario (
  id_endereco_user SMALLINT NOT NULL,
  cep INT NOT NULL,
  logradouro VARCHAR(90) NOT NULL,
  numero VARCHAR(10) NOT NULL,
  bairro VARCHAR(70) NOT NULL,
  municipio VARCHAR(70) NOT NULL,
  estado VARCHAR(70) NOT NULL,
  pais VARCHAR(70) NOT NULL,
  usuario_id SMALLINT NOT NULL
  );


-- -----------------------------------------------------
-- Table `mydb`.`Nota_Fical`
-- -----------------------------------------------------
CREATE TABLE Nota_Fical (
  id_nota_fiscal INT NOT NULL,
  valor_total DECIMAL NOT NULL,
  valor_tributos DECIMAL NOT NULL
  );

-- -----------------------------------------------------
-- Table `mydb`.`Motoboy`
-- -----------------------------------------------------
CREATE TABLE Motoboy (
  id_motoboy SMALLINT NOT NULL,
  nome_motoboy VARCHAR(45) NOT NULL,
  sobrenome_motoboy VARCHAR(70) NOT NULL,
  data_nascimento DATE NOT NULL,
  cnh INT NOT NULL,
  cpf INT NOT NULL
  );

-- -----------------------------------------------------
-- Table `mydb`.`Localizacao_Motoboy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Localizacao_Motoboy` (
  id_localizacao SMALLINT NOT NULL,
  longitude FLOAT NOT NULL,
  latitude FLOAT NOT NULL,
  Motoboy_id INT NOT NULL (CHAVE ESTRANGEIRA)
  );


-- -----------------------------------------------------
-- Table `mydb`.`Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Pedido` (
  `id` INT NOT NULL,
  `Usuario_id` INT NOT NULL,
  `Nota_Fical_id` INT NOT NULL,
  `Localizacao_Motoboy_id` INT NOT NULL,
  `Valor_Total` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Pedido_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  INDEX `fk_Pedido_Nota_Fical1_idx` (`Nota_Fical_id` ASC) VISIBLE,
  INDEX `fk_Pedido_Localizacao_Motoboy1_idx` (`Localizacao_Motoboy_id` ASC) VISIBLE,
  CONSTRAINT `fk_Pedido_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Nota_Fical1`
    FOREIGN KEY (`Nota_Fical_id`)
    REFERENCES `mydb`.`Nota_Fical` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Pedido_Localizacao_Motoboy1`
    FOREIGN KEY (`Localizacao_Motoboy_id`)
    REFERENCES `mydb`.`Localizacao_Motoboy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco_Restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco_Restaurante` (
  `id` INT NOT NULL,
  `cep` INT NOT NULL,
  `logradouro` VARCHAR(90) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `bairro` VARCHAR(70) NOT NULL,
  `municipio` VARCHAR(70) NOT NULL,
  `estado` VARCHAR(70) NOT NULL,
  `pais` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Restaurante` (
  `id` INT NOT NULL,
  `Endereco_Restaurante_id` INT NOT NULL,
  `nome` VARCHAR(90) NOT NULL,
  `data_inauguracao` DATE NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Restaurante_Endereco_Restaurante1_idx` (`Endereco_Restaurante_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurante_Endereco_Restaurante1`
    FOREIGN KEY (`Endereco_Restaurante_id`)
    REFERENCES `mydb`.`Endereco_Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Regiao_Atuacao_Rest`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Regiao_Atuacao_Rest` (
  `id` INT NOT NULL,
  `Restaurante_id` INT NOT NULL,
  `nome` VARCHAR(70) NOT NULL,
  `bairro` VARCHAR(70) NOT NULL,
  `municipio` VARCHAR(70) NOT NULL,
  `estado` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Regiao_Atuacao_Restaurante1_idx` (`Restaurante_id` ASC) VISIBLE,
  CONSTRAINT `fk_Regiao_Atuacao_Restaurante1`
    FOREIGN KEY (`Restaurante_id`)
    REFERENCES `mydb`.`Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Moto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Moto` (
  `id` INT NOT NULL,
  `Motoboy_id` INT NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `ano` VARCHAR(45) NOT NULL,
  `cor` VARCHAR(45) NOT NULL,
  `placa` VARCHAR(7) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Moto_Motoboy1_idx` (`Motoboy_id` ASC) VISIBLE,
  CONSTRAINT `fk_Moto_Motoboy1`
    FOREIGN KEY (`Motoboy_id`)
    REFERENCES `mydb`.`Motoboy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comida` (
  `id` INT NOT NULL,
  `Pedido_id` INT NOT NULL,
  `Restaurante_id` INT NOT NULL,
  `nome` VARCHAR(255) NOT NULL,
  `ingrediente` VARCHAR(45) NOT NULL,
  `custo_producao` DECIMAL NOT NULL,
  `valor_venda` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Comida_Pedido1_idx` (`Pedido_id` ASC) VISIBLE,
  INDEX `fk_Comida_Restaurante1_idx` (`Restaurante_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comida_Pedido1`
    FOREIGN KEY (`Pedido_id`)
    REFERENCES `mydb`.`Pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Comida_Restaurante1`
    FOREIGN KEY (`Restaurante_id`)
    REFERENCES `mydb`.`Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Tipo_Comida`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Tipo_Comida` (
  `id` INT NOT NULL,
  `Comida_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Tipo_Comida_Comida1_idx` (`Comida_id` ASC) VISIBLE,
  CONSTRAINT `fk_Tipo_Comida_Comida1`
    FOREIGN KEY (`Comida_id`)
    REFERENCES `mydb`.`Comida` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Forma_Pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Forma_Pagamento` (
  `id` INT NOT NULL,
  `Pedido_id` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Forma_Pagamento_Pedido1_idx` (`Pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_Forma_Pagamento_Pedido1`
    FOREIGN KEY (`Pedido_id`)
    REFERENCES `mydb`.`Pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Endereco_Filial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Endereco_Filial` (
  `id` INT NOT NULL,
  `cep` INT NOT NULL,
  `logradouro` VARCHAR(90) NOT NULL,
  `numero` VARCHAR(10) NOT NULL,
  `bairro` VARCHAR(70) NOT NULL,
  `municipio` VARCHAR(70) NOT NULL,
  `estado` VARCHAR(70) NOT NULL,
  `pais` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Filial_Restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Filial_Restaurante` (
  `id` INT NOT NULL,
  `Restaurante_id` INT NOT NULL,
  `Endereco_Filial_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Filial_Restaurante_Restaurante1_idx` (`Restaurante_id` ASC) VISIBLE,
  INDEX `fk_Filial_Restaurante_Endereco_Filial1_idx` (`Endereco_Filial_id` ASC) VISIBLE,
  CONSTRAINT `fk_Filial_Restaurante_Restaurante1`
    FOREIGN KEY (`Restaurante_id`)
    REFERENCES `mydb`.`Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Filial_Restaurante_Endereco_Filial1`
    FOREIGN KEY (`Endereco_Filial_id`)
    REFERENCES `mydb`.`Endereco_Filial` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Status_Pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Status_Pedido` (
  `id` INT NOT NULL,
  `Pedido_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Status_Pedido_Pedido1_idx` (`Pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_Status_Pedido_Pedido1`
    FOREIGN KEY (`Pedido_id`)
    REFERENCES `mydb`.`Pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Avaliacao_Restaurante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Avaliacao_Restaurante` (
  `id` INT NOT NULL,
  `Restaurante_id` INT NOT NULL,
  `nota` INT NOT NULL,
  `comentario` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Avaliacao_Restaurante_Restaurante1_idx` (`Restaurante_id` ASC) VISIBLE,
  CONSTRAINT `fk_Avaliacao_Restaurante_Restaurante1`
    FOREIGN KEY (`Restaurante_id`)
    REFERENCES `mydb`.`Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Restaurante_has_Motoboy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Restaurante_has_Motoboy` (
  `Restaurante_id` INT NOT NULL,
  `Motoboy_id` INT NOT NULL,
  PRIMARY KEY (`Restaurante_id`, `Motoboy_id`),
  INDEX `fk_Restaurante_has_Motoboy_Motoboy1_idx` (`Motoboy_id` ASC) VISIBLE,
  INDEX `fk_Restaurante_has_Motoboy_Restaurante1_idx` (`Restaurante_id` ASC) VISIBLE,
  CONSTRAINT `fk_Restaurante_has_Motoboy_Restaurante1`
    FOREIGN KEY (`Restaurante_id`)
    REFERENCES `mydb`.`Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Restaurante_has_Motoboy_Motoboy1`
    FOREIGN KEY (`Motoboy_id`)
    REFERENCES `mydb`.`Motoboy` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Dono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Dono` (
  `id` INT NOT NULL,
  `Restaurante_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `data_nascimento` VARCHAR(45) NOT NULL,
  `registro_geral` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Dono_Restaurante1_idx` (`Restaurante_id` ASC) VISIBLE,
  CONSTRAINT `fk_Dono_Restaurante1`
    FOREIGN KEY (`Restaurante_id`)
    REFERENCES `mydb`.`Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone_Usuario` (
  `id` INT NOT NULL,
  `Usuario_id` INT NOT NULL,
  `ddd_cel` INT NOT NULL,
  `numero_cel` INT NOT NULL,
  `ddd_fixo` INT NULL,
  `numero_fixo` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Telefone_Usuario1_idx` (`Usuario_id` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Usuario1`
    FOREIGN KEY (`Usuario_id`)
    REFERENCES `mydb`.`Usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_Resturante`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone_Resturante` (
  `id` INT NOT NULL,
  `Restaurante_id` INT NOT NULL,
  `ddd_cel` INT NOT NULL,
  `numero_cel` INT NOT NULL,
  `ddd_fixo` INT NULL,
  `numero_fixo` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Telefone_Contato_Restaurante1_idx` (`Restaurante_id` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Contato_Restaurante1`
    FOREIGN KEY (`Restaurante_id`)
    REFERENCES `mydb`.`Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Telefone_Filial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Telefone_Filial` (
  `id` INT NOT NULL,
  `Filial_Restaurante_id` INT NOT NULL,
  `ddd_cel` INT NOT NULL,
  `numero_cel` INT NOT NULL,
  `ddd_fixo` INT NULL,
  `numero_fixo` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Telefone_Filial_Filial_Restaurante1_idx` (`Filial_Restaurante_id` ASC) VISIBLE,
  CONSTRAINT `fk_Telefone_Filial_Filial_Restaurante1`
    FOREIGN KEY (`Filial_Restaurante_id`)
    REFERENCES `mydb`.`Filial_Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cupom_Desconto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cupom_Desconto` (
  `id` INT NOT NULL,
  `Pedido_id` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `desconto` DECIMAL NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Cupom_Desconto_Pedido1_idx` (`Pedido_id` ASC) VISIBLE,
  CONSTRAINT `fk_Cupom_Desconto_Pedido1`
    FOREIGN KEY (`Pedido_id`)
    REFERENCES `mydb`.`Pedido` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Regiao_Atuacao_Filial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Regiao_Atuacao_Filial` (
  `id` INT NOT NULL,
  `Filial_Restaurante_id` INT NOT NULL,
  `nome` VARCHAR(70) NOT NULL,
  `bairro` VARCHAR(70) NOT NULL,
  `municipio` VARCHAR(70) NOT NULL,
  `estado` VARCHAR(70) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Regiao_Atuacao_Filial_Filial_Restaurante1_idx` (`Filial_Restaurante_id` ASC) VISIBLE,
  CONSTRAINT `fk_Regiao_Atuacao_Filial_Filial_Restaurante1`
    FOREIGN KEY (`Filial_Restaurante_id`)
    REFERENCES `mydb`.`Filial_Restaurante` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;