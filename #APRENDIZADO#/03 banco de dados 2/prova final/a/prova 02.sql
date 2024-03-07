--3. Utilizando o Microsoft SQL Server, execute o código SQL a seguir para criar o banco de dados
--LojaAULA12, dentro do diretório E:\LojaAULA12. Caso necessário, utilize outra letra para
--representar o seu diretório. Observe que está sendo utilizado o recurso de FILEGROUPS, para
--a criação do banco de dados em um diretório específico.


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

SET DATEFORMAT DMY
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

--4. Após criar o banco de dados LojaAULA12, habilite seu contexto e crie as tabelas
--correspondentes ao DER descrito nos exercícios 1 e 2. Verifique se as tabelas foram criadas.

USE LojaAULA12
GO


--CRIA A TABELA CLIENTE
CREATE TABLE CLIENTES (
    Codigo_Cliente		INT PRIMARY KEY,

    Nome_Cliente		VARCHAR(50),
    DDD_Cliente			CHAR (3),
	Telefone_Cliente	CHAR(9),
	Saldo_Cliente		DECIMAL(10,2)
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


--CRIA A TABELA FATURA
CREATE TABLE FATURAS (
	Numero_fatura		INT PRIMARY KEY,

	Codigo_Cliente		INT	NOT NULL FOREIGN KEY REFERENCES CLIENTES(Codigo_Cliente),

	Data_Fatura			DATE,
	Subtotal_Fatura		DECIMAL(10,2),
	Imposto_Fatura		DECIMAL(10,2),
	Total_Fatura		DECIMAL(10,2)
)
GO


--CRIA A TABELA PRODUTOS
CREATE TABLE PRODUTOS (
	Codigo_Produto				VARCHAR(10) PRIMARY KEY,
			
	Descricao_Produto			VARCHAR(35),
	Data_Estocagem_Produto		DATE,
	Unidade_Disponivel_Produto	INT,
	Valor_UnitarioProduto		DECIMAL(9,2),
	Taxa_Desconto_Produto		DECIMAL(5,2),
	
	Codigo_Fornecedor			INT	NOT NULL FOREIGN KEY REFERENCES FORNECEDORES(Codigo_Fornecedor)
)
GO


--CRIA A TABELA LINHAS
CREATE TABLE LINHAS (
	Numero_Fatura				INT	NOT NULL FOREIGN KEY REFERENCES FATURAS(Numero_Fatura),

    Numero_Linha				INT PRIMARY KEY,

	Codigo_Produto				VARCHAR(10) FOREIGN KEY REFERENCES PRODUTOS(Codigo_Produto),

	Quantidade_Produto_Linha	INT,
	Valor_linha					DECIMAL(9,2),
	Total_Linha					DECIMAL(9,2)
)
GO


SELECT * FROM CLIENTES
GO

SELECT * FROM FORNECEDORES
GO

SELECT * FROM FATURAS
GO

SELECT * FROM PRODUTOS
GO

SELECT * FROM LINHAS
GO



--5. Altere a estrutura da tabela CLIENTES, inserindo um novo campo do tipo DATE, denominado
--de Data_Nascimento, para armazenar os valores referentes à data de nascimento de cada
--cliente.

--ADICIONA A COLUNA Data_Nascimento
ALTER TABLE CLIENTES
	ADD Data_Nascimento	DATE
GO

SELECT * FROM CLIENTES
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

SELECT * FROM CLIENTES
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

SELECT * FROM FORNECEDORES
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

SELECT * FROM FATURAS
GO


BULK INSERT PRODUTOS 
FROM N'C:\Paulo\Prova 2\Dados\produtos.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

SELECT * FROM PRODUTOS
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