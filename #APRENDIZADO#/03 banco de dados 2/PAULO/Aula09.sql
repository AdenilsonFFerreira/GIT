--APAGA BANCO DE DADOS Aula09
DROP DATABASE Aula09
GO

--CRIAR O BANCO DE DADOS Aula09
CREATE DATABASE Aula09
GO

--HABILITAR O CONTEXTO DO BANCO DE DADOS
USE Aula09
GO

--EXIBE O NOME DO BANCO DE DADOS QUE EXISTE NO SERVIDOR
SELECT name
FROM sys.databases
GO

--CRIA A TABELA FUNCIONARIOS
CREATE TABLE FUNCIONARIOS(
	ID		INT PRIMARY KEY,
	Nome	VARCHAR(25),
	Sexo	CHAR(1),
	Admissao	DATE,
	Salario		DECIMAL(10,2)
)
GO

--ALTERA O FORMATO DA DATA NO SQL SERVER
SET DATEFORMAT DMY
GO

--INSERE DADOS NA TABELA FUNCIONARIOS
INSERT INTO FUNCIONARIOS(
	ID,
	Nome,
	Sexo,
	Admissao,
	Salario)
VALUES (1, 'Maria da Silva', 'F', '10/01/2018', 2500.00)
GO

SELECT *
FROM FUNCIONARIOS
GO

SELECT ID, Nome
FROM FUNCIONARIOS
GO

--INSERE DADOS N TABELA DE FUNCIONARIOS
INSERT INTO FUNCIONARIOS VALUES (2, 'Pedro Pereira', 'M', '25/05/2015', 999.00)
GO

--INSERE DOIS NOVOS REGISTROS - SINTAXE 1
INSERT INTO FUNCIONARIOS VALUES (3, 'Maria Cristina', 'F', '10/09/2015', 1200.00)
INSERT INTO FUNCIONARIOS VALUES (4, 'Antonio Carlos', 'M', '15/05/2015', 990.00)

--INSERE QUATRO NOVOS REGISTROS - SINTAXE 2
INSERT INTO FUNCIONARIOS VALUES
	(5, 'Marcelo Augusto', 'M', '09/12/2017', 1900.00),
	(6, 'Pedro Silva', 'M', '15/11/2015', 1050.00),
	(7, 'Monica Silva', 'F', '12/10/2014', 3000.00),
	(8, 'Tiago Lima', 'M', '10/05/2016', 1350.00)
GO

--EXIBE ALGUMAS INFORMA��ES DOS FUNCIONARIO
--UTILIZANDO ALIASES PARA ALGUMAS COLUNAS
SELECT ID AS 'C�Digo do Funcion�rio',
		Nome,
		Sexo,
		Salario AS 'Sal�rios'
FROM FUNCIONARIOS
GO

--EXIBE TODOS OS DADOS DA TABELA FUNCIONARIOS
SELECT * FROM FUNCIONARIOS
GO

--TENTAR INSERIR NOVOS REGISTROS CUJO A CHAVE PRIMARIA POSSUI O MESMO VALOR
--DE OUTRO REGISTRO JA CADASTRADO DENTRO DA TABELA FUNCIONARIOS
/*
INSERT INTO FUNCIONARIOS VALUES
	(8, 'Mateus Pereira', 'M', '25/03/2017', 2990.00)
GO
*/

SELECT TOP 3 
	ID,
	Nome AS 'XYZ'
GO

--EXIBE AS INFORMACOES DE TODOS OS FUNCIONARIOS CUJO
--SALARIO � MAIOR DO QUE 1000 REAIS
SELECT * FROM FUNCIONARIOS
WHERE Sexo = 'M' AND
		Salario > 1000
GO

--EXIBE OS DADOS DOS FUNCIONARIOS SEXO SEJA DIFERENTE DE 'M'
--VERSAO UTILIZANDO O OPERADOR !=
SELECT * FROM FUNCIONARIOS
WHERE Sexo != 'M'
GO

--EXIBE OS DADOS DOS FUNCIONARIOS CUJO SALARIO ESTEJA ENTRE 1000 E 2000 REAIS
--UTILIZA OS OPERADORES >=, AND E <=
SELECT * FROM FUNCIONARIOS
WHERE	Salario >= 1000 AND
		Salario <= 2000
GO

--EXIBE OS DADOS DOS FUNCIONARIOS CUJO SALARIO ESTEJA ENTRE 1000 E 2000 REAIS
--UTILIZA OS OPERADORES BETWEEN
SELECT * FROM FUNCIONARIOS
WHERE	Salario BETWEEN 1000 AND 2000
GO

--VERIFICA SE EXISTE ALGUM FUNCIONARIO CUJO SALARIO SEJA MAIOR DQUE 1000 REAIS
-- E EXIBE UMA MENSAGEM PERSONALIZADA
IF EXISTS (SELECT * FROM FUNCIONARIOS WHERE Salario > 10000)
	PRINT 'Alguem ganha mais que 10.0000 reais...'
	ELSE
	PRINT 'N�o licalizamos ninguem...'
GO

--SELECIONA TODOS OS FUNCIONARIOS CUJO NOME COMECE COM A LETRA M
SELECT * FROM FUNCIONARIOS
WHERE Nome LIKE 'M%'
GO

--SELECIONA TODOS OS FUNCIONARIOS CUJO NOME CONTENHA 'SILVA'
--UTILIZA A FUNCAO UPPER(), PARA CONVERTER O NOME PARA MAIUSCULA
SELECT * FROM FUNCIONARIOS
WHERE UPPER(Nome) LIKE '%SILVA%'
GO

--SELECIONA TODOS OS FUNCIONARIOS CUJO ID SEJA 1, 2 OU 5
--VERSAO UTILIZANDO OR
SELECT *FROM FUNCIONARIOS
WHERE	ID = 1 OR
		ID = 2 OR
		ID = 5
GO

--SELECIONA TODOS OS FUNCIONARIOS CUJO ID SEJA 1, 2 OU 5
--VERSAO UTILIZANDO IN
SELECT * FROM FUNCIONARIOS
WHERE ID IN (1,2,5)
GO

--UTILIZA UMA SUBCONSULTA PARA RETORNAR OS VALORES DE CLAUSULA IN
SELECT * FROM FUNCIONARIOS
WHERE Salario IN
	(SELECT Salario FROM FUNCIONARIOS
	WHERE Salario < 1000.00)
GO

--VERIFICAR SE ALGUM FUNCIONARIO POSSUI O SOBRENOME 'PEREIRA'
IF EXISTS (SELECT Nome FROM FUNCIONARIOS
	WHERE Nome LIKE '%Pereira%')
PRINT 'Algume chama Pereira...'
GO

--SELECIONAR  TODOS OS FUNCIONARIOS ORDENANDO O RESULTADO 
--EM ORDEM ALFABETICA (A-Z)
SELECT * FROM FUNCIONARIOS
ORDER BY Nome --(LOGO APOS ASC OU DESC PARA ORDENAR NA PREFERENCIA)
GO

--INSERE DOIS NOVOS FUNCIONARIOS
INSERT INTO FUNCIONARIOS VALUES
	(9, 'Maria Cristina', 'F', '21/09/2012', 1700.00),
	(10, 'Maria Cristina', 'F', '10/10/2017', 1400.00)
GO

--SELECIONAR TODOS OS FUNCIONARIOS ORDENANDO O RESULTADO PEIMEIRO PELO NOME
--EM ORDEM ALFABETICA (A-z) E DEPOIS PELOS DADOS DE QUEM TEM O MAIOR SALARIO
--EXIBE OS DADOS SOMENTE DO FUNCIONARIOS CUJO SALARIO SEJA MAIOR QUE 3000 REAIS
SELECT * FROM FUNCIONARIOS
WHERE Salario < 3000
ORDER BY	Nome,
			Salario DESC
GO

--CRIACAO DE UMA TABELA PARA TESTES
CREATE TABLE TESTE (
	ID	INT	NOT NULL,
	Nome	CHAR(10))
GO

--VERIFICA A ESTRUTURA DA TABELA
EXEC sp_columns TESTE
GO

--ALTERA O TIPO DE DADOS DA COLUNA Nome. NESTE CASO
--AUMENTA O TAMANHO DO CAMPO
ALTER TABLE TESTE
	ALTER COLUMN Nome CHAR(50)
GO

--ADICIONA A COLUNA SEXO
ALTER TABLE TESTE
	ADD Sexo CHAR (1) NULL
GO

SELECT *
FROM TESTE
GO

--ADICONA AS COLUNAS Dt_Nascimento E Peso
ALTER TABLE TESTE
	ADD Dt_Nascimento	DATE,
		Peso			DECIMAL(5,2)
GO

--REMOVE A COLUNA Dt_Nascimento
ALTER TABLE TESTE
	DROP COLUMN Dt_Nascimento
GO

--ADICONA UMA RESTRICAO DO TIPO UNICA NA COLUNA SEXO
ALTER TABLE TESTE
	ADD UNIQUE (Sexo)
GO

--ADICONA UMA RESTRICAO NOMEADA DO TIPO CHAVE PRIMARIA NA COLUNA ID
ALTER TABLE TESTE
	ADD CONSTRAINT pk_id PRIMARY
KEY (ID)
GO

--EXIBE INFORMACOES SOBRE AS RESTRICOES QUE EXISTEM NA TABELA
EXEC sp_helpconstraint TESTE
GO

--REMOVER UMA RESTRICAO NOMEADA
ALTER TABLE TESTE
	DROP CONSTRAINT pk_id
GO

--OUTRA FIRMA DE SE EXIBIR INFORMA�OES SOBRE AS COLUNAS DA TABELA
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TESTE'
GO

--OUTRA FORMA DE SE EXIBIR INFORMA��ES ESPECIFICAS DA TABELA
SELECT	TABLE_CATALOG	AS	'Banco de Ddaos',
		TABLE_NAME		AS	'Tabela',
		ORDINAL_POSITION	AS	'Posicao',
		COLUMN_NAME		AS	'Coluna',
		DATA_TYPE		AS	'Tioo de Dados',
		COLLATION_NAME	AS	'Idioma da Coluna',
		IS_NULLABLE		AS	'Aceita Nulo'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'TESTE'
GO

--UTILIZANDO O COMANDO SP_HELP
EXEC sp_help 'TESTE'
GO

--EXCLUIR A TABELA TESTE
DROP TABLE TESTE
GO

--TENTAR SELECIONAR OS DADOS 

--ADICONA O CAMPOS TEFEFONE NA TABELA FUNCIONARIO
ALTER TABLE FUNCIONARIOS
ADD Telefone CHAR(10)
GO

--EXIBE TODOS OS DADOS DA TABELA
SELECT * FROM FUNCIONARIOS
GO

--EXIBE INFORMA�OES DA ESTRUTURA DA TABELA FUNCIONARIOS
SELECT	TABLE_CATALOG	AS	'Banco de Ddaos',
		TABLE_NAME		AS	'Tabela',
		ORDINAL_POSITION	AS	'Posicao',
		COLUMN_NAME		AS	'Coluna',
		DATA_TYPE		AS	'Tioo de Dados',
		COLLATION_NAME	AS	'Idioma da Coluna',
		IS_NULLABLE		AS	'Aceita Nulo'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FUNCIONARIOS'
GO

--ATUALIZA O TELEFONE DA FUNCIONARIA 'MARAI DA SILVA' CUJO CODIGO EH 1
UPDATE FUNCIONARIOS
	SET Telefone = '3668-0010'
GO

SELECT *
FROM FUNCIONARIOS
GO

--ATUALIZA O TELEFONE DA FUNCIONARIA 'MARIA DA SILVA' CUJO CODIGO EH1
--CORRIGE OS VALORES DE VOLTA PARA NULL
UPDATE FUNCIONARIOS
	SET Telefone = NULL
GO

--ATUALIZA O TELEFONE DA FUNCIONARIA 'MARIA DA SILVA' CUJO CODIGO EH 1
UPDATE FUNCIONARIOS
	SET Telefone = '3668-0010'
	WHERE ID = 1
GO

--ATUALIZA O TELEFONE DE ALGUNS FUNCIONARIOS
UPDATE FUNCIONARIOS SET Telefone = '3668-1550' WHERE ID = 2
UPDATE FUNCIONARIOS SET Telefone = '3664-5000' WHERE ID = 4
UPDATE FUNCIONARIOS SET Telefone = '3664-2001' WHERE ID = 5
UPDATE FUNCIONARIOS SET Telefone = '3663-9000' WHERE ID = 7
UPDATE FUNCIONARIOS SET Telefone = '3663-7000' WHERE ID = 9
UPDATE FUNCIONARIOS SET Telefone = '3662-1515' WHERE ID = 10
GO

--EXIBE TODOS OS DADOS DA TABELA FUNCIONARIOS
SELECT * FROM FUNCIONARIOS
GO

--CONCEDE AUMENTO DE 10% PARA OS FUNCIONARIO QUE
-- FORAM ADMITIDOS ANTES DE 2016
UPDATE FUNCIONARIOS
	SET Salario = Salario * 1.10
	WHERE YEAR (Admissao) <2016
GO

--CRIA TABELA TEMPORARIA PART_A
CREATE TABLE #PART_A(
	ID_Part		INT NOT NULL UNIQUE,
	Nome_Part	VARCHAR(25),
	Tel_Part	CHAR(10)
	PRIMARY KEY (ID_Part)
)
GO

--INSERE ALGUNS VALORES NA TABELA TEMPORARIA
--DENTRO DA MESMA SESS�O
INSERT INTO #PART_A VALUES
	(1, 'MarcelO Augusto', '3668-4545'),
	(2, 'Maria Cristina', '3663-0909')
GO

-- LISTA OS VALORES DENTRO DA TABELA TEMPORARIA
SELECT * FROM #PART_A
GO

--CRIA TABELA TEMPORARIA GLOBAL (ACESSA EM QUALQUER SESS�O)
CREATE TABLE ##PART_B(
	ID_Part		INT NOT NULL UNIQUE,
	Nome_Part	VARCHAR(25),
	Tel_Part	CHAR(10)
	PRIMARY KEY (ID_Part)
)
GO

--INSERE ALGUNS VALORES NA TABELA TEMPORARIA
--DENTRO DA MESMA SESS�O
INSERT INTO ##PART_B VALUES
	(1, 'MarcelO Augusto', '3668-4545'),
	(2, 'Maria Cristina', '3663-0909')
GO


-- LISTA OS VALORES DENTRO DA TABELA TEMPORARIA
SELECT * FROM ##PART_B
GO

--COPIA ALGUNS VALORES DA TABELA FUNCIONARIO PARA DENTRO 
--DA TABELA #PART_A
INSERT INTO #PART_A
	SELECT	ID,
			Nome,
			Telefone
	FROM FUNCIONARIOS
	WHERE ID >2
GO

--CRIA UMA NOVA TABELA UTILIZANDO COMO BASE OS DADOS E A ESTRUTURA DA TABELA
--FUNCIONARIOS, SERA CRIADO A TABELA FUNCIONARIOS_2
SELECT *
	INTO FUNCIONARIOS_2
FROM FUNCIONARIOS
GO

-- LISTA TABELA FUNCIONARIO_2
SELECT * FROM FUNCIONARIOS_2
GO

--EXIBE INFORMA�OES DA ESTRUTURA DA TABELA FUNCIONARIOS_2
SELECT	TABLE_CATALOG	AS	'Banco de Ddaos',
		TABLE_NAME		AS	'Tabela',
		ORDINAL_POSITION	AS	'Posicao',
		COLUMN_NAME		AS	'Coluna',
		DATA_TYPE		AS	'Tioo de Dados',
		COLLATION_NAME	AS	'Idioma da Coluna',
		IS_NULLABLE		AS	'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FUNCIONARIOS_2'
GO

--exibe informa��es sobra as resti��es da tabelas FUNCIONARIOS E FUNCIONARIOS_2
SELECT	OBJECT_NAME (object_id)			AS 'Nome da Restri��o',
		SCHEMA_NAME (schema_id)			AS 'Nome do Esquema',
		OBJECT_NAME (parent_object_id)	AS 'Nome da Tabela',
		type_desc						AS 'Tipo de Restri��o'
FROM SYS.OBJECTS
WHERE type_desc LIKE '%CONSTRAINT' AND
		OBJECT_NAME (parent_object_id) IN ('FUNCIONARIOS', 'FUNCIONARIOS_2')
GO

--ADICIONA UMA RESTRICAO NOMEADA DO TIPO CHAVE PRIMARIA NA COLUA
--ID DA TABELA FUNCIONARIOS_2
ALTER TABLE FUNCIONARIOS_2
	ADD CONSTRAINT pk_id PRIMARY KEY (ID)
GO

--UTILIZA O COMANDO DELETE PARA REMOVER ALGUMAS LINHAS DA TABELA FUNCIONARIOS_2
SELECT * FROM FUNCIONARIOS_2
GO

DELETE FROM FUNCIONARIOS_2
WHERE Salario < 1500
GO

SELECT * FROM FUNCIONARIOS_2
GO

--UTILIZA O CAOMANDO TRUNCATE PARA REMOVER TODOS OS REGISTROS DA TABELA FUNCIONARIO_2
SELECT * FROM FUNCIONARIOS_2
GO

TRUNCATE TABLE FUNCIONARIOS_2
GO

SELECT * FROM FUNCIONARIOS_2
GO

-- REMOVENDO A TABELA FUNCIONARIOS_2
DROP TABLE FUNCIONARIOS_2
GO

--EXIBE UMA LISTAGEM COM O NOME DAS TABELAS EXISTENTE NO BANCO DE DADOS EM USO NO MOMENTO
SELECT name AS 'Nome da Tabela'
FROM sys.tables
GO





