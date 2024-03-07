--------------------------------------------------------------------------------
-- 01_Cria_Intercambio - BULK INSERT.sql
-- Script para criar o banco de dados INTERCAMBIO
--------------------------------------------------------------------------------



-- Habilita o contexto do banco de dados MASTER
USE Master
GO



-- Verifica se o banco de dados INTERCAMBIO existe. Se for o caso, cria o banco 
-- de dados. Caso contrário, habilita o contexto do banco de dados INTERCAMBIO
IF DB_ID(N'INTERCAMBIO') IS NULL
    CREATE DATABASE INTERCAMBIO
GO



-- Habilita o banco de dados INTERCAMBIO
USE INTERCAMBIO
GO



--------------------------------------------------------------------------------
-- Criação das tabelas
--------------------------------------------------------------------------------



-- Tabela PAISES
CREATE TABLE Paises (
    Cod_Pais    CHAR(3)      PRIMARY KEY, -- Código ISO3
    Nome_Pais   VARCHAR(255) NOT NULL,
    Idioma_Pais VARCHAR(50)
)
GO



-- Tabela VIAGENS
CREATE TABLE Viagens (
    Cod_Viagem   INT             PRIMARY KEY,
    Data_Saida   DATE            NOT NULL,
    Data_Retorno DATE            NOT NULL,
    Valor        DECIMAL(10,2)   NOT NULL,
    Pais_Destino CHAR(3)         NOT NULL FOREIGN KEY REFERENCES Paises(Cod_Pais)
)
GO



-- Tabela ALUNOS
CREATE TABLE Alunos (
    Cod_Aluno   INT         IDENTITY PRIMARY KEY,
    Nome_Aluno  CHAR(20)    NOT NULL,
    Data_Nasc   DATE        NOT NULL,
    Endereco    VARCHAR(60) NOT NULL,
    Telefone    CHAR(10)    NOT NULL,
    Sexo        CHAR(1),
    Pais_Origem CHAR(3)     NOT NULL FOREIGN KEY REFERENCES Paises(Cod_Pais),
    Cod_Viagem  INT         NOT NULL FOREIGN KEY REFERENCES Viagens(Cod_Viagem)
)
GO




-- Tabela ALUNOSCOPIA
-- Essa tabela será utilizada apenas para demonstrar os operadores do conjunto relacional
CREATE TABLE AlunosCOPIA (
    Cod_Aluno   INT         IDENTITY PRIMARY KEY,
    Nome_Aluno  CHAR(20)    NOT NULL,
    Data_Nasc   DATE        NOT NULL,
    Endereco    VARCHAR(60) NOT NULL,
    Telefone    CHAR(10)    NOT NULL,
    Sexo        CHAR(1),
    Pais_Origem CHAR(3)     NOT NULL FOREIGN KEY REFERENCES Paises(Cod_Pais),
    Cod_Viagem  INT         NOT NULL FOREIGN KEY REFERENCES Viagens(Cod_Viagem)
)
GO



-- Exibe o nome das tabelas que existem no banco de dados em uso
SELECT name 
FROM sys.tables
GO



--------------------------------------------------------------------------------
-- Inserção dos dados
--------------------------------------------------------------------------------



-- Insere 244 registros na tabela PAISES
BULK INSERT PAISES 
-- [TODO]



-- Exibe os valores da tabela PAISES
SELECT Cod_Pais     AS 'Código do País',
       Nome_Pais    AS 'Nome',
       Idioma_Pais  AS 'Idioma Principal'
FROM Paises
GO



-- Altera o formato de entrada da Data e Hora
SET DATEFORMAT YMD
GO



-- Insere 30 registros na tabela VIAGENS
BULK INSERT VIAGENS 
-- [TODO]



-- Exibe os valores da tabela VIAGENS
SELECT Cod_Viagem    AS 'Código da Viagem',
       Data_Saida    AS 'Data de Saída',
       Data_Retorno  AS 'Data de Retorno',
       Valor         AS 'Valor R$',
       Pais_Destino  AS 'Destino'
FROM Viagens
GO



-- Reseta o campo IDENTITY
DBCC CHECKIDENT ('ALUNOS', RESEED, 0)
GO



-- Altera o formato de entrada da Data e Hora
SET DATEFORMAT YMD
GO



-- Insere 50 registros na tabela ALUNOS
BULK INSERT ALUNOS 
-- [TODO]



-- Exibe os valores da tabela ALUNOS
SELECT Cod_Aluno   AS 'Código do Aluno',
       Nome_Aluno  AS 'Nome do Aluno',
       Data_Nasc   AS 'Data de Nascimento',
       Endereco    AS 'Endereço',
       Telefone 
       Sexo,
       Pais_Origem AS 'País de Origem',
       Cod_Viagem  As 'Código da Viagem'
FROM Alunos
GO



-- Reseta o campo IDENTITY
DBCC CHECKIDENT ('AlunosCOPIA', RESEED, 0)
GO



-- Altera o formato de entrada da Data e Hora
SET DATEFORMAT YMD
GO



-- Insere 20 registros na tabela ALUNOSCOPIA
BULK INSERT AlunosCOPIA
-- [TODO]



-- Exibe os valores da tabela ALUNOSCOPIA
SELECT Cod_Aluno   AS 'Código do Aluno',
       Nome_Aluno  AS 'Nome do Aluno',
       Data_Nasc   AS 'Data de Nascimento',
       Endereco    AS 'Endereço',
       Telefone 
       Sexo,
       Pais_Origem AS 'País de Origem',
       Cod_Viagem  As 'Código da Viagem'
FROM AlunosCOPIA
GO


--------------------------------------------------------------------------------
-- FIM!
--------------------------------------------------------------------------------
