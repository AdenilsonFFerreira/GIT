-- -----------------------------------------------------
-- Criando DATABASE `php_oo`
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `php_oo` DEFAULT CHARACTER SET UTF8MB4;
USE `php_oo`;
/* DROP SCHEMA php_oo */
-- -----------------------------------------------------
-- Table Usuarios
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS usuarios (
  id INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
  nome VARCHAR(255) DEFAULT NULL,
  email VARCHAR(255) DEFAULT NULL,
  senha tinytext DEFAULT NULL
) ENGINE = InnoDB DEFAULT CHARSET=UTF8MB4;
/* drop table clientes */

INSERT INTO `php_oo`.`usuarios` (`nome`, `email`, `senha`) VALUES ('Jao Trakinas', 'trakinas@acme.com', '1234');
INSERT INTO `php_oo`.`usuarios` (`nome`, `email`, `senha`) VALUES ('Maria Tostines', 'tostines@acme.com', '1234');

SELECT * FROM usuarios;



