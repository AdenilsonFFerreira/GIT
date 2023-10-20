--HABILITAR O CONTEXTO DO BANCO DE DADOS
USE BarDoCalango
GO

--EXIBE O NOME DO BANCO DE DADOS QUE EXISTE NO SERVIDOR
SELECT name
FROM sys.databases
GO

--CRIA A TABELA CATEGORIAS
CREATE TABLE CATEGORIAS(
	Cod_Categoria	INT PRIMARY KEY,
	Descriçâo		VARCHAR(80) NOT NULL
)
GO

--CRIA A TABELA PRODUTOS
CREATE TABLE PRODUTOS(
	Cod_Produto		INT PRIMARY KEY,
	Descricao		VARCHAR(80) NOT NULL,
	Quantidade		INT NOT NULL,
	Cod_Categoria	INT,

	FOREIGN KEY (Cod_Categoria) REFERENCES CATEGORIAS(Cod_Categoria)
)
GO


--CRIA A TABELA VENDAS
CREATE TABLE VENDAS(
	Cod_Venda		INT PRIMARY KEY,
	Data_Venda		DATE NOT NULL,
	Cod_Produto		INT,
	Quantidade		INT NOT NULL,
	Preco_Venda		DECIMAL (5,2) NOT NULL,
	Valor_Venda		AS (Quantidade*Preco_Venda),

	FOREIGN KEY (Cod_Produto) REFERENCES PRODUTOS(Cod_Produto)
)
GO


SELECT *
FROM CATEGORIAS
GO

SELECT *
FROM PRODUTOS
GO

SELECT *
FROM VENDAS
GO

--SEMPRE SALVAR OS ARQUIVOS CSV EM PADRÃO UTF-8 NO NOTEPAD++

--DROP TABLE PRODUTOS;

-- Insere os dados na tabela CATEGORIAS, utilizando os
-- dados provenientes do arquivo 'CATEGORIAS.csv'
BULK INSERT CATEGORIAS
FROM N'C:\Users\adeni\OneDrive\Files\GitHub\PAULO\BarDoCalango\categorias.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

-- Insere os dados na tabela PRODUTOS, utilizando os
-- dados provenientes do arquivo 'PRODUTOS.csv'
BULK INSERT PRODUTOS
FROM N'C:\Users\adeni\OneDrive\Files\GitHub\PAULO\BarDoCalango\produtos.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
--ROWTERMINATOR = '\n',
FIELDTERMINATOR =';',
--CODEPAGE = 'ACP'
CODEPAGE= '65001'
)
GO

delete from PRODUTOS

SET DATEFORMAT DMY
GO

-- Insere os dados na tabela VENDAS, utilizando os
-- dados provenientes do arquivo 'VENDAS.csv'
BULK INSERT VENDAS
FROM N'C:\Users\adeni\OneDrive\Files\GitHub\PAULO\BarDoCalango\vendas.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
--CODEPAGE = 'ACP'
CODEPAGE = '65001'
)
GO

--01
SELECT *
FROM CATEGORIAS
GO

--02
SELECT *
FROM PRODUTOS
GO

--03
SELECT *
FROM VENDAS
GO

--04
--OUTRA FORMA DE SE EXIBIR INFORMAÇÕES ESPECIFICAS DA TABELA
SELECT	Cod_Venda		AS	'Codigo de Venda',
		Data_Venda		AS	'Data da Venda',
		Cod_Produto		AS	'Codigo do produto',
		Quantidade		AS	'Quantidade',
		Preco_Venda		AS	'Preço de venda',
		Valor_Venda		AS	'Valor de venda'
FROM VENDAS
GO

--05
SELECT	PRODUTOS.Cod_Produto, 
		PRODUTOS.Descricao,
		PRODUTOS.Quantidade,
		CATEGORIAS.Cod_Categoria,
		CATEGORIAS.Descriçâo
FROM PRODUTOS
JOIN CATEGORIAS ON PRODUTOS.Cod_Categoria = CATEGORIAS.Cod_Categoria;