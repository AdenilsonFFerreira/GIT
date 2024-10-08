-- MySQL Script generated by MySQL Workbench
-- Mon Dec 11 20:02:40 2023
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`login`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`login` (
  `ID_Login` INT NULL COMMENT 'Id de login do usuario',
  `Usuario` VARCHAR(16) NULL COMMENT 'Nome do usuario',
  `Senha` VARCHAR(16) NULL COMMENT 'Senha para login do usuario',
  PRIMARY KEY (`ID_Login`))
ENGINE = InnoDB
COMMENT = '	';


-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `ID_Usuario` INT NOT NULL COMMENT 'Id do usuario que refencia ao seu cadastro junto a tabela login',
  `Nome` VARCHAR(50) NULL COMMENT 'cadastro do nome do usuario',
  `Endereco` VARCHAR(50) NULL COMMENT 'cadastro do endereço do usuario',
  `Numero` VARCHAR(10) NULL COMMENT 'cadastro do numero da residencia do usuario',
  `Bairro` VARCHAR(40) NULL COMMENT 'cadastro do bairo do usuario',
  `Cidade` VARCHAR(40) NULL COMMENT 'cadastro da cidade do usuario',
  `CEP` VARCHAR(8) NULL COMMENT 'cadastro do cep da localidade do usuario',
  `CPF` VARCHAR(11) NULL COMMENT 'cadastro do cpf do usuario que deve ser unico',
  `Email` VARCHAR(50) NULL COMMENT 'cadastro do email do usuario',
  `Sexo` VARCHAR(1) NULL COMMENT 'cadastro do sexo do usuario (opcional preencher)',
  `Celular` VARCHAR(15) NULL COMMENT 'cadastro do numero do celular do usuario',
  `Telefone` VARCHAR(15) NULL COMMENT 'cadastro do numerod de telefone fixo do usuario (opcional)',
  `ID_Login` INT NULL COMMENT 'ID de login para refenciar o usuario com o login',
  PRIMARY KEY (`ID_Usuario`),
  UNIQUE INDEX `CPF_UNIQUE` (`CPF` ASC) VISIBLE,
  INDEX `ID_Login_idx` (`ID_Login` ASC) VISIBLE,
  CONSTRAINT `ID_Login`
    FOREIGN KEY (`ID_Login`)
    REFERENCES `mydb`.`login` (`ID_Login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`acoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`acoes` (
  `ID_Acao` INT NOT NULL COMMENT 'Id de identificação referente as ações',
  `Acao` VARCHAR(10) NULL COMMENT 'Nome da ação negociada na Bolsa de Valores',
  `Quantidade` INT NULL COMMENT 'Quantidade comprada de ações',
  `Valor` FLOAT NULL COMMENT 'Valor do lote ou fracionamento das ações compradas',
  `Data_Compra` DATETIME NULL,
  `ID_Login` INT NULL COMMENT 'Id da tabela Login que vai refenciar o usuario e suas ações no logi do programa',
  PRIMARY KEY (`ID_Acao`),
  INDEX `ID_login_idx` (`ID_Login` ASC) VISIBLE,
  CONSTRAINT `ID_login`
    FOREIGN KEY (`ID_Login`)
    REFERENCES `mydb`.`login` (`ID_Login`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
