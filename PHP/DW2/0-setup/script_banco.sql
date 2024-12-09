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
  sexo ENUM('masculino', 'feminino'),
  dt_nasc date DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL,
  telefone VARCHAR(15) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET=UTF8MB4;
/* drop table clientes */

/*
INSERT INTO `banco_dw2`.`clientes`
(`codigo`,   `nome_completo`, `dt_nasc`, `email`,  `telefone`) VALUES
('codigo',   'nome_completo', 'dt_nasc', 'email' , 'telefone');
*/

INSERT INTO `banco_dw2`.`clientes`
(`codigo`,     `nome_completo`, `dt_nasc`,    `email`,             `telefone`) VALUES
('abcs-1234',  'Ricardo Alsoa', '1977-08-15', 'ricardo@acme.com' , '12991747581');


SELECT * FROM CLIENTES;


CREATE TABLE IF NOT EXISTS clientes (
  id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  codigo VARCHAR(50) DEFAULT NULL,
  nome_completo VARCHAR(255) NULL,
  sexo ENUM('masculino', 'feminino'),
  dt_nasc date DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL,
  telefone VARCHAR(15) DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE IF NOT EXISTS produtos (
  id_produto INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  codigo_produto VARCHAR(50) NOT NULL,
  nome_produto VARCHAR(255) NOT NULL,
  categoria_produto VARCHAR(255) NOT NULL,
  descricao TEXT DEFAULT NULL,
  preco DECIMAL(10, 2) NOT NULL,
  qtd_fotos INT DEFAULT 0,
  qtd INT DEFAULT 0,
  dt_reg DATETIME NULL,
  dt_alt DATETIME NULL
) ENGINE = InnoDB DEFAULT CHARSET=UTF8MB4;

CREATE TABLE IF NOT EXISTS usuarios (
  id_usuario INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  codigo VARCHAR(50) DEFAULT NULL,
  email VARCHAR(255) NULL,
  senha tinytext DEFAULT NULL,
  status ENUM('0', '1'),
  dt_reg DATETIME NULL,
  dt_alt DATETIME NULL
) ENGINE = InnoDB DEFAULT CHARSET=UTF8MB4;

INSERT INTO clientes (codigo, nome_completo, sexo, dt_nasc, email, telefone) VALUES
('DRW3X-RT45C', 'Lucas Oliveira', 'masculino', '1990-05-15', 'lucas.oliveira@email.com', '11987654321'),
('FQW2Z-YU34H', 'Ana Souza', 'feminino', '1988-10-22', 'ana.souza@email.com', '11923456789'),
('ZXCVB-12FGH', 'Carlos Silva', 'masculino', '1995-02-28', 'carlos.silva@email.com', '11876543210'),
('HYU8T-EW56L', 'Maria Santos', 'feminino', '1992-07-10', 'maria.santos@email.com', '11934567890'),
('RTY9U-PL09B', 'Felipe Costa', 'masculino', '1985-12-01', 'felipe.costa@email.com', '11765432109'),
('JHGF4-AS23D', 'Fernanda Lima', 'feminino', '1993-04-05', 'fernanda.lima@email.com', '11897654321'),
('QWER7-MN45K', 'Ricardo Almeida', 'masculino', '1991-08-16', 'ricardo.almeida@email.com', '11912345678'),
('ASDF8-ZX23M', 'Juliana Pereira', 'feminino', '1987-11-29', 'juliana.pereira@email.com', '11987654321'),
('TYUI4-QW23N', 'Eduardo Martins', 'masculino', '1994-01-13', 'eduardo.martins@email.com', '11854321678'),
('MNOP1-QW45E', 'Patrícia Rocha', 'feminino', '1989-09-07', 'patricia.rocha@email.com', '11965432107');


INSERT INTO usuarios (codigo, email, senha, status, dt_reg, dt_alt)
VALUES (
  'USRWDR-WE77TD',        -- Código do usuário
  'trakinas@acme.com',    -- Email
  'abc@1234',             -- Senha simples
  '1',                    -- Status (1 = ativo, 0 = inativo)
  NOW(),                  -- Data de registro atual
  NOW()                   -- Data de alteração atual
);

drop table usuarios





