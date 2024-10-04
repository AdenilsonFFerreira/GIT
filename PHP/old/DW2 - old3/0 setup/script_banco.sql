-- -----------------------------------------------------
-- Criando DATABASE `BANCO_DW2`
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `BANCO_DW2` DEFAULT CHARACTER SET UTF8MB4;
USE `BANCO_DW2`;
/* DROP SCHEMA BANCO_DW2 /*

-- -----------------------------------------------------
-- Table clientes
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS clientes (
  id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  codigo VARCHAR(50) DEFAULT NULL,
  nome_completo VARCHAR(255) NULL,  
  dt_nasc date DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL,
  telefone VARCHAR(15) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET=UTF8MB4; /* para caracteres especiais muito importante*/
/* drop table clientes */

/*sexo ENUM('masculino', 'feminino'),*/

alter table clientes add colunn sexo ENUM ('masculino', 'feminino') after nome_completo,

/*
INSERT INTO `banco_dw2`.`clientes`
(`codigo`,   `nome_completo`, `dt_nasc`, `email`,  `telefone`) VALUES
('codigo',   'nome_completo', 'dt_nasc', 'email' , 'telefone');
*/

INSERT INTO `banco_dw2`.`clientes`
(`codigo`,     `nome_completo`, `dt_nasc`,    `email`,             `telefone`) VALUES
('ABCD-4321',  'Adenilson Fernandes Ferreira', '1982-05-04', 'adenilson@acme.com' , '12988275865');

SELECT * FROM CLIENTES;




