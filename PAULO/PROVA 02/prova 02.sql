--------------------------------------------------------------
-- Aula12_Exercicios.sql
-- Exercícios da Aula 12
--------------------------------------------------------------

-- Habilita o banco de dado MASTER
USE master
GO

SELECT name
FROM sys.databases
GO

--------------------------------------------------------------
-- Criação do banco de dados LojaAULA12
--------------------------------------------------------------

-- Criação do banco de dados LojaAULA12
-- Repare que esse banco será criado em E:\LojaAULA12
CREATE DATABASE LojaAULA12
ON PRIMARY (
NAME = 'Arquivo_Principal',
FILENAME = 'C:\Paulo\Prova 2\LojaAULA12\Arquivo_Principal.mdf',
SIZE = 5 MB,
FILEGROWTH = 10%
),
FILEGROUP FG1 (
NAME = 'Arquivo_Dados',
FILENAME = 'C:\Paulo\Prova 2\LojaAULA12\Arquivo_Dados.ndf',
SIZE = 3 MB,
FILEGROWTH = 10%
)
LOG ON (
NAME = 'Arquivo_Log',
FILENAME = 'C:\Paulo\Prova 2\LojaAULA12\Arquivo_Log.ldf',
SIZE = 1 MB,
FILEGROWTH = 10%
)
GO

-- Exibe o conteúdo do diretório E:\LojaAULA12
EXECUTE xp_dirtree 'C:\Paulo\Prova 2\LojaAULA12', 10, 1
GO

USE LojaAULA12
GO



-- Pais_Origem CHAR(3)     NOT NULL FOREIGN KEY REFERENCES Paises(Cod_Pais),
    Cod_Viagem  INT         NOT NULL FOREIGN KEY REFERENCES Viagens(Cod_Viagem)
)

--CRIA A TABELA CLIENTE
CREATE TABLE CLIENTES (
    Codigo_Cliente		INT PRIMARY KEY,
    Nome_Cliente		VARCHAR(50),
    DDD_Cliente			CHAR (3),
	Telefone_Cliente	CHAR(9),
	Saldo_Cliente		DECIMAL(10,2)
)
GO

--CRIA A TABELA FATURAS
CREATE TABLE FATURAS (
    Numero_Fatura		INT PRIMARY KEY,
	Codigo_Cliente		INT IDENTITY(1,1),
	Data_Fatura			DATE,
	Subtotal_Fatura		DECIMAL(10,2),
	Imposto_Fatura		DECIMAL(10,2),
	Total_Fatura		DECIMAL(10,2),
)
GO

DROP TABLE LINHAS
GO

--CRIA A TABELA LINHAS
CREATE TABLE LINHAS (
    Numero_Fatura		INT,
	Numero_Linha		INT,
	Codigo_Produto		VARCHAR(10),
	Quantidade_Produto_Linha	INT,
	Valor_linha			DECIMAL(9,2),
	Total_Linha			DECIMAL(9,2)

)
GO

--CRIA A TABELA PRODUTOs
CREATE TABLE PRODUTOS (
	Codigo_Produto		VARCHAR(10) PRIMARY KEY,
	Descricao_Produto	VARCHAR(35),
	Data_Estocagem_Produto	DATE,
	Unidade_Disponivel_Produto	INT,
	Valor_UnitarioProduto	DECIMAL(9,2),
	Taxa_Desconto_Produto	DECIMAL(5,2),
	Codigo_Fornecedor		INT IDENTITY(1,1)
)
GO


--CRIA A TABELA FORNECEDORES
CREATE TABLE FORNECEDORES (
	Codigo_Fornecedor	INT PRIMARY KEY,
	Nome_Fornecedor		VARCHAR(35),
	Contato_Fornecedor	VARCHAR(15),
	DDD_Fornecedor		CHAR(3),
	Telefone_Fornecedor	CHAR(9),
	Estado_Fornecedor	CHAR(2)
)
GO

SELECT * FROM CLIENTES
GO

SELECT * FROM FATURAS
GO

SELECT * FROM LINHAS
GO

SELECT * FROM PRODUTOS
GO

SELECT * FROM FORNECEDORES
GO

--ADICIONA A COLUNA Data_Nascimento
ALTER TABLE CLIENTES
	ADD Data_Nascimento	DATE
GO

--6. Utilize os dados contidos no material fornecido pelo professor e faça o importe em massa para
--popular cada uma das tabelas do banco de dados LojaAULA12. Em seguida, liste o conteúdo de
--cada uma delas.
BULK INSERT CLIENTES 
FROM N'C:\Paulo\Prova 2\Dados\clientes.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

BULK INSERT FATURAS 
FROM N'C:\Paulo\Prova 2\Dados\faturas.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

BULK INSERT FORNECEDORES 
FROM N'C:\Paulo\Prova 2\Dados\fornecedores.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

BULK INSERT LINHAS 
FROM N'C:\Paulo\Prova 2\Dados\linhas.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

SELECT * FROM LINHAS

BULK INSERT PRODUTOS 
FROM N'C:\Paulo\Prova 2\Dados\produtos.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO