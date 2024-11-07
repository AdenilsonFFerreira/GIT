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

INSERT INTO clientes (codigo, nome_completo, sexo, dt_nasc, email, telefone) VALUES
('ARX9P-KL17J', 'Ana Silva', 'feminino', '1985-03-20', 'ana.silva@email.com', '11987654322'),
('BRL2M-FN34Q', 'Carlos Souza', 'masculino', '1978-09-12', 'carlos.souza@email.com', '11987654323'),
('CTX7W-GH56B', 'Beatriz Oliveira', 'feminino', '1992-11-07', 'beatriz.oliveira@email.com', '11987654324'),
('DTS4E-JM18C', 'Pedro Lima', 'masculino', '1983-06-30', 'pedro.lima@email.com', '11987654325'),
('ERF8Y-NK23D', 'Juliana Costa', 'feminino', '1995-07-19', 'juliana.costa@email.com', '11987654326'),
('FLP1Q-PH45R', 'Fernando Alves', 'masculino', '1980-04-25', 'fernando.alves@email.com', '11987654327'),
('GMB6K-QT67V', 'Patricia Santos', 'feminino', '1987-08-23', 'patricia.santos@email.com', '11987654328'),
('HRL9V-RJ12T', 'Ricardo Pereira', 'masculino', '1991-02-10', 'ricardo.pereira@email.com', '11987654329'),
('ITX3N-SK34W', 'Mariana Ferreira', 'feminino', '1986-05-05', 'mariana.ferreira@email.com', '11987654330'),
('JKP4M-TL56X', 'Gustavo Rodrigues', 'masculino', '1979-03-18', 'gustavo.rodrigues@email.com', '11987654331'),
('LRW7Y-UM89Z', 'Luciana Martins', 'feminino', '1993-09-29', 'luciana.martins@email.com', '11987654332'),
('MTS1Q-VP12A', 'Rafael Araujo', 'masculino', '1988-01-14', 'rafael.araujo@email.com', '11987654333'),
('NXP9E-WK34B', 'Amanda Mendes', 'feminino', '1984-02-22', 'amanda.mendes@email.com', '11987654334'),
('ORT4M-XM56C', 'Fábio Carvalho', 'masculino', '1996-10-08', 'fabio.carvalho@email.com', '11987654335'),
('PRZ6V-YQ78D', 'Vanessa Ribeiro', 'feminino', '1990-11-25', 'vanessa.ribeiro@email.com', '11987654336'),
('QSL2P-ZJ12E', 'Thiago Almeida', 'masculino', '1982-07-17', 'thiago.almeida@email.com', '11987654337'),
('RTX7K-AK34F', 'Bruna Lopes', 'feminino', '1977-12-06', 'bruna.lopes@email.com', '11987654338'),
('SRF8N-BM56G', 'Marcelo Castro', 'masculino', '1981-08-02', 'marcelo.castro@email.com', '11987654339'),
('TLX3Q-CN78H', 'Renata Duarte', 'feminino', '1994-03-21', 'renata.duarte@email.com', '11987654340'),
('UPW5M-DO12J', 'Alexandre Vieira', 'masculino', '1989-10-11', 'alexandre.vieira@email.com', '11987654341'),
('VRZ9P-EP34K', 'Carolina Santana', 'feminino', '1992-06-14', 'carolina.santana@email.com', '11987654342'),
('WTS1Q-FR56L', 'Murilo Lima', 'masculino', '1985-01-09', 'murilo.lima@email.com', '11987654343'),
('XLP2M-GS78M', 'Larissa Campos', 'feminino', '1991-11-03', 'larissa.campos@email.com', '11987654344'),
('YRM8V-HQ12N', 'Daniel Moura', 'masculino', '1978-04-20', 'daniel.moura@email.com', '11987654345'),
('ZXP9E-JK34O', 'Isabela Nunes', 'feminino', '1987-07-28', 'isabela.nunes@email.com', '11987654346'),
('ARN1Q-KL56P', 'Leandro Gonçalves', 'masculino', '1993-02-26', 'leandro.goncalves@email.com', '11987654347'),
('BTF4M-LM78Q', 'Aline Moreira', 'feminino', '1980-09-15', 'aline.moreira@email.com', '11987654348'),
('CRL6V-MN12R', 'Hugo Batista', 'masculino', '1984-06-30', 'hugo.batista@email.com', '11987654349'),
('DRX8P-NP34S', 'Clarice Araújo', 'feminino', '1979-08-19', 'clarice.araujo@email.com', '11987654350'),
('ETL2N-OQ56T', 'Jorge Neves', 'masculino', '1995-10-22', 'jorge.neves@email.com', '11987654351'),
('FRZ9E-PM78U', 'Paula Sousa', 'feminino', '1991-03-07', 'paula.sousa@email.com', '11987654352'),
('GRX3K-QN12V', 'Felipe Correia', 'masculino', '1983-11-09', 'felipe.correia@email.com', '11987654353'),
('HRW7Y-RP34W', 'Célia Marques', 'feminino', '1986-01-04', 'celia.marques@email.com', '11987654354'),
('JSL5P-SQ56X', 'Vitor Borges', 'masculino', '1994-08-17', 'vitor.borges@email.com', '11987654355'),
('KLZ2Q-TM78Y', 'Andréia Souza', 'feminino', '1988-02-12', 'andreia.souza@email.com', '11987654356');

INSERT INTO clientes (codigo, nome_completo, sexo, dt_nasc, email, telefone) VALUES
('BRQ8W-LZ34G', 'Maria Oliveira', 'feminino', '1992-07-15', 'maria.oliveira@email.com', '31987654324'),
('VRN7D-PX89H', 'Pedro Silva', 'masculino', '1990-04-10', 'pedro.silva@email.com', '41987654325'),
('CQY3F-WA67J', 'Juliana Mendes', 'feminino', '1989-08-22', 'juliana.mendes@email.com', '51987654326'),
('UHN9X-TY45K', 'Lucas Lima', 'masculino', '1988-12-30', 'lucas.lima@email.com', '61987654327'),
('KTL1H-MC56V', 'Fernanda Rocha', 'feminino', '1993-05-05', 'fernanda.rocha@email.com', '71987654328');


INSERT INTO usuarios (codigo, email, senha, status, dt_reg, dt_alt)
VALUES (
  'USRWDR-WE77TD',        -- Código do usuário
  'trakinas@acme.com',    -- Email
  'abc@1234',             -- Senha simples
  '1',                    -- Status (1 = ativo, 0 = inativo)
  NOW(),                  -- Data de registro atual
  NOW()                   -- Data de alteração atual
);

INSERT INTO usuarios (codigo, email, senha, status, dt_reg, dt_alt)
VALUES (
  'USRWDR-WE77TD',        -- Código do usuário
  'trakinas@acme.com',    -- Email
  '$2y$10$e.ImpeGnK9vZB9GJ6D8F5.1myQJk5pS9mTO1nB1.xYt/qk1Fg2xBW',  -- Senha hasheada
  '1',                    -- Status (1 = ativo, 0 = inativo)
  NOW(),                  -- Data de registro atual
  NOW()                   -- Data de alteração atual
);


SELECT * FROM usuarios;
SELECT * FROM clientes;
drop table usuarios





