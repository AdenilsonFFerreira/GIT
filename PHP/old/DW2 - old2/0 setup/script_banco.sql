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

SELECT * FROM CLIENTES;usuarios

INSERT INTO `banco_dw2`.`clientes`
(`codigo`,     `nome_completo`, `dt_nasc`,    `email`,             `telefone`) VALUES
('ABCD-4321',  'Adenilson Fernandes Ferreira', '1982-05-04', 'adenilson@acme.com' , '12988275865'),
('ABCD-4322',  'Beatriz Oliveira Santos', '1990-08-12', 'beatriz.oliveira@acme.com', '11987654321'),
('ABCD-4323',  'Carlos Eduardo Silva', '1985-11-23', 'carlos.silva@acme.com', '11987654322'),
('ABCD-4324',  'Daniela Souza Lima', '1992-03-15', 'daniela.souza@acme.com', '11987654323'),
('ABCD-4325',  'Eduardo Pereira Fernandes', '1987-07-29', 'eduardo.pereira@acme.com', '11987654324'),
('ABCD-4326',  'Fernanda Alves Costa', '1995-09-19', 'fernanda.alves@acme.com', '11987654325'),
('ABCD-4327',  'Gabriel Martins Rocha', '1983-12-14', 'gabriel.martins@acme.com', '11987654326'),
('ABCD-4328',  'Helena Lima Nunes', '1991-04-09', 'helena.lima@acme.com', '11987654327'),
('ABCD-4329',  'Igor Ferreira Gomes', '1989-06-24', 'igor.ferreira@acme.com', '11987654328'),
('ABCD-4330',  'Juliana Almeida Araujo', '1988-10-31', 'juliana.almeida@acme.com', '11987654329'),
('ABCD-4331',  'Kleber Melo dos Santos', '1994-02-20', 'kleber.melo@acme.com', '11987654330'),
('ABCD-4332',  'Larissa Ramos Barbosa', '1986-08-05', 'larissa.ramos@acme.com', '11987654331'),
('ABCD-4333',  'Mariana Duarte Tavares', '1993-01-18', 'mariana.duarte@acme.com', '11987654332'),
('ABCD-4334',  'Nicolas Ribeiro Mendes', '1980-03-02', 'nicolas.ribeiro@acme.com', '11987654333'),
('ABCD-4335',  'Olivia Silva Teixeira', '1984-11-11', 'olivia.silva@acme.com', '11987654334'),
('ABCD-4336',  'Paulo Henrique Costa', '1990-07-22', 'paulo.henrique@acme.com', '11987654335'),
('ABCD-4337',  'Quintino Barbosa Vieira', '1979-09-03', 'quintino.barbosa@acme.com', '11987654336'),
('ABCD-4338',  'Raquel Farias Silva', '1987-12-26', 'raquel.farias@acme.com', '11987654337'),
('ABCD-4339',  'Sergio Oliveira Azevedo', '1981-05-16', 'sergio.oliveira@acme.com', '11987654338'),
('ABCD-4340',  'Tatiana Lima Matos', '1996-11-08', 'tatiana.lima@acme.com', '11987654339'),
('ABCD-4341',  'Ursula Farias Almeida', '1982-02-14', 'ursula.farias@acme.com', '11987654340'),
('ABCD-4342',  'Victor Hugo Costa', '1988-06-28', 'victor.hugo@acme.com', '11987654341'),
('ABCD-4343',  'Wesley Gomes de Lima', '1991-09-21', 'wesley.gomes@acme.com', '11987654342'),
('ABCD-4344',  'Xavier Souza Campos', '1984-01-19', 'xavier.souza@acme.com', '11987654343'),
('ABCD-4345',  'Yasmin Oliveira Silva', '1992-10-13', 'yasmin.oliveira@acme.com', '11987654344'),
('ABCD-4346',  'Zoraide Mendes Ribeiro', '1983-08-07', 'zoraide.mendes@acme.com', '11987654345'),
('ABCD-4347',  'Andreia Melo dos Santos', '1990-11-15', 'andreia.melo@acme.com', '11987654346'),
('ABCD-4348',  'Bruno Fernandes Vieira', '1986-07-12', 'bruno.fernandes@acme.com', '11987654347'),
('ABCD-4349',  'Claudia Almeida Silva', '1988-03-29', 'claudia.almeida@acme.com', '11987654348'),
('ABCD-4350',  'Diego Nunes Teixeira', '1989-12-01', 'diego.nunes@acme.com', '11987654349'),
('ABCD-4351',  'Elisa Ramos Pereira', '1985-04-10', 'elisa.ramos@acme.com', '11987654350'),
('ABCD-4352',  'Flavio Araujo Costa', '1995-05-20', 'flavio.araujo@acme.com', '11987654351'),
('ABCD-4353',  'Gustavo Farias Tavares', '1983-09-11', 'gustavo.farias@acme.com', '11987654352'),
('ABCD-4354',  'Helio Ferreira da Silva', '1991-10-01', 'helio.ferreira@acme.com', '11987654353'),
('ABCD-4355',  'Iris Melo Azevedo', '1987-06-17', 'iris.melo@acme.com', '11987654354'),
('ABCD-4356',  'Joana Santos Costa', '1984-08-25', 'joana.santos@acme.com', '11987654355'),
('ABCD-4357',  'Lucas Teixeira Gomes', '1993-02-27', 'lucas.teixeira@acme.com', '11987654356'),
('ABCD-4358',  'Monica Ferreira Alves', '1992-01-06', 'monica.ferreira@acme.com', '11987654357'),
('ABCD-4359',  'Natalia Ribeiro Pereira', '1985-03-21', 'natalia.ribeiro@acme.com', '11987654358'),
('ABCD-4360',  'Oscar Costa da Silva', '1989-05-12', 'oscar.costa@acme.com', '11987654359'),
('ABCD-4361',  'Patricia Lima Nunes', '1994-10-31', 'patricia.lima@acme.com', '11987654360'),
('ABCD-4362',  'Quenia Oliveira Santos', '1991-12-19', 'quenia.oliveira@acme.com', '11987654361'),
('ABCD-4363',  'Rodrigo Araujo Vieira', '1982-07-03', 'rodrigo.araujo@acme.com', '11987654362'),
('ABCD-4364',  'Sofia Gomes de Lima', '1988-02-23', 'sofia.gomes@acme.com', '11987654363'),
('ABCD-4365',  'Tatiane Costa Pereira', '1987-11-28', 'tatiane.costa@acme.com', '11987654364'),
('ABCD-4366',  'Ueslei Santos Teixeira', '1990-06-14', 'ueslei.santos@acme.com', '11987654365'),
('ABCD-4367',  'Vanessa Souza Ribeiro', '1989-01-30', 'vanessa.souza@acme.com', '11987654366'),
('ABCD-4368',  'Walter Nunes de Almeida', '1983-04-05', 'walter.nunes@acme.com', '11987654367');
('ABCD-4369', 'Xuxa Meneghel', '1963-03-27', 'xuxa.meneghel@acme.com', '11987654368'),
('ABCD-4370', 'Julio Cesar Souza', '1980-09-13', 'julio.souza@acme.com', '11987654369'),
('ABCD-4371', 'Francisca Gomes', '1977-11-22', 'francisca.gomes@acme.com', '11987654370');




