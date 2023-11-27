CREATE DATABASE Teste3

GO

USE Teste3

-- -----------------------------------------------------
-- Criando tabela Restaurante_Dono
-- -----------------------------------------------------
CREATE TABLE Pedido2 (
  ID_NF SMALLINT NOT NULL,
  ID_ITEM SMALLINT NOT NULL, 
  COD_PROD SMALLINT NOT NULL, 
  VALOR_UNIT MONEY NOT NULL,
  QUANTIDADE SMALLINT NOT NULL, 
  DESCONTO DECIMAL
);

-- -----------------------------------------------------
-- Inserindo dados na tabela usuário
-- -----------------------------------------------------
INSERT INTO Pedido2 (ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, QUANTIDADE, DESCONTO) VALUES
(1, 1, 1, 25.00, 10, 5),
(1, 2, 2, 13.50, 3, NULL),
(1, 3, 3, 15.00, 2, NULL),
(1, 4, 4, 10.00, 1, NULL),
(1, 5, 5, 30.00, 1, NULL),
(2, 1, 3, 15.00, 4, NULL),
(2, 2, 4, 10.00, 5, NULL),
(2, 3, 5, 30.00, 7, NULL),
(3, 1, 1, 25.00, 5, NULL),
(3, 2, 4, 10.00, 4, NULL),
(3, 3, 5, 30.00, 5, NULL),
(3, 4, 2, 13.50, 7, NULL),
(4, 1, 5, 30.00, 10, 1),
(4, 2, 4, 10.00, 12, 5),
(4, 3, 1, 25.00, 13, 5),
(4, 4, 2, 13.50, 15, 5),
(5, 1, 3, 15.00, 3, NULL),
(5, 2, 5, 30.00, 6, NULL),
(6, 1, 1, 25.00, 22, 15),
(6, 2, 3, 15.00, 25, 20),
(7, 1, 1, 25.00, 10, 3),
(7, 2, 2, 13.50, 10, 4),
(7, 3, 3, 15.00, 10, 4),
(7, 4, 5, 30.00, 10, 1);


-- A
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT FROM Pedido2 WHERE DESCONTO IS NULL


-- B
SELECT ID_NF, ID_ITEM, COD_PROD, VALOR_UNIT, (VALOR_UNIT - (VALOR_UNIT * (DESCONTO / 100))) AS VALOR_VENDIDO FROM Pedido2 WHERE DESCONTO IS NOT NULL


-- C
UPDATE Pedido2 SET DESCONTO = 0 WHERE DESCONTO IS NULL


