SELECT name
FROM sys.tables
GO

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

SELECT *
	FROM Paises
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

SELECT *
	FROM Viagens
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

SELECT * 
	FROM Alunos
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

SELECT * 
	FROM Paises
GO


-- Insere 244 registros na tabela PAISES
BULK INSERT PAISES 
FROM N'C:\Users\adeni\OneDrive\Files\GitHub\PAULO\AULA 13\dados\paises.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO



-- Exibe os valores da tabela PAISES
SELECT Cod_Pais     AS 'Código do País',
       Nome_Pais    AS 'Nome',
       Idioma_Pais  AS 'Idioma Principal'
FROM Paises
GO



-- Altera o formato de entrada da Data e Hora
SET DATEFORMAT YMD
GO

SELECT * 
	FROM Viagens
GO

-- Insere 30 registros na tabela VIAGENS
BULK INSERT VIAGENS 
FROM N'C:\Users\adeni\OneDrive\Files\GitHub\PAULO\AULA 13\dados\viagens.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO



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

SELECT * 
	FROM Alunos
GO

-- Insere 50 registros na tabela ALUNOS
BULK INSERT ALUNOS 
FROM N'C:\Users\adeni\OneDrive\Files\GitHub\PAULO\AULA 13\dados\alunos.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO



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

SELECT * 
	FROM AlunosCOPIA
GO

-- Insere 20 registros na tabela ALUNOSCOPIA
BULK INSERT AlunosCOPIA
FROM N'C:\Users\adeni\OneDrive\Files\GitHub\PAULO\AULA 13\dados\alunos_copia.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO



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

--exibe o nome da tabelas que existem no banco de dados em uso
SELECT TABLE_NAME AS 'Nome da Tabela'
FROM INFORMATION_SCHEMA.TABLES
WHERE	TABLE_TYPE = 'BASE TABLE' AND
		TABLE_CATALOG = 'INTERCAMBIO'
GO

--UNION ALL = EXIBE AS LINHAS DUPLICADAS
SELECT	Cod_Aluno	AS 'Código do Aluno',
		Nome_Aluno	AS	'Nome do Aluno',
		Sexo
FROM Alunos
	UNION ALL
SELECT	Cod_Aluno	AS	'Código do Aluno',
		Nome_Aluno	AS	'Nome do Aluno',
		Sexo
FROM AlunosCOPIA
ORDER BY Cod_Aluno, Nome_Aluno
GO

--UNION = EXIBE AS LINHAS DUPLICADAS
SELECT	Cod_Aluno	AS 'Código do Aluno',
		Nome_Aluno	AS	'Nome do Aluno',
		Sexo
FROM Alunos
	UNION 
SELECT	Cod_Aluno	AS	'Código do Aluno',
		Nome_Aluno	AS	'Nome do Aluno',
		Sexo
FROM AlunosCOPIA
ORDER BY Cod_Aluno, Nome_Aluno
GO

--INTERSECT - RETORNA AS LINHAS QUE EXISTEM NOS DOIS CONJUNTOS
SELECT	Cod_Aluno	AS 'Código do Aluno',
		Nome_Aluno	AS	'Nome do Aluno',
		Sexo
FROM Alunos
	INTERSECT
SELECT	Cod_Aluno	AS	'Código do Aluno',
		Nome_Aluno	AS	'Nome do Aluno',
		Sexo
FROM AlunosCOPIA
ORDER BY Cod_Aluno, Nome_Aluno
GO

--EXCEPT = RETORNA AS LINHSA QUE ESXISTEM NOS DOIS CONJUNTOS
SELECT	Cod_Aluno	AS 'Código do Aluno',
		Nome_Aluno	AS	'Nome do Aluno',
		Sexo
FROM Alunos
	EXCEPT
SELECT	Cod_Aluno	AS	'Código do Aluno',
		Nome_Aluno	AS	'Nome do Aluno',
		Sexo
FROM AlunosCOPIA
ORDER BY Cod_Aluno, Nome_Aluno
GO

--seleciona somente os alunos cujo nome aparece nas duas tabelas 
SELECT Nome_Aluno	AS	'Nome do Aluno'
FROM Alunos
	INTERSECT
SELECT Nome_Aluno	AS 'Nome do Aluno'
FROM AlunosCOPIA
GO

--seleciona somente os alunos cujo nome aparece nas duas tabelas 
SELECT Nome_Aluno	AS	'Nome do Aluno'
FROM Alunos
WHERE Nome_Aluno IN
	(SELECT Nome_Aluno	FROM	AlunosCOPIA)
GO

--EXIBE INFORMAÇÕES SOBRE OS ALUNOS E AS VIAJENS QUE ELES REALIZARAM
SELECT	Viagens.Cod_Viagem	AS	'Código da Viagem',
		Alunos.Nome_Aluno	AS	'Nome',
		Alunos.Telefone,
		Alunos.Sexo,
		(SELECT Nome_pais FROM Paises WHERE Cod_Pais = Alunos.Pais_Origem)		AS 'Origem',
		(SELECT Nome_pais FROM Paises WHERE	Cod_Pais = Viagens.Pais_Destino)	AS	'Destino',
		Viagens.Data_Saida	AS	'Data de saida',
		Viagens.Data_Retorno	AS	'Data de retorno',
		Viagens.Valor		AS	'Preço da viagem R$'
FROM Alunos INNER JOIN Viagens
		ON Alunos.Cod_Viagem = Viagens.Cod_Viagem
GO

--exibir os dados dos paise utilizados coo destino nas viajens dos alunos
--cadastrados cujo codigo seja USA
SELECT	Cod_Pais	AS	'Codigo',
		Nome_Pais	AS	'Pais de Destino',
		Idioma_pais	AS	'Idioma'
FROM Paises
WHERE Cod_Pais = (SELECT DISTINCT Pais_Destino
	FROM Viagens	WHERE Pais_Destino = 'usa')
GO

--EXIBE OS DADOS DOS PAISES UTILIZADOS COMO DESTINO NAS VIAJENS DOS ALUNOS CADASTRADOS
SELECT	Cod_Pais	AS	'Codigo',
		Nome_Pais	AS	'Pais de Destino',
		Idioma_pais	AS	'Idioma'
FROM Paises
WHERE Cod_Pais IN
	(SELECT Pais_Destino FROM Viagens)
GO

--EXIBE O CODIGO NOME OU QUANIDADE DE VIAJENS CADASTRADAS PARA O PAIS DE DESTINO
--EXIBE SOMENTE AS INFORMAÇÕES PARA OS PAISES CUJO QUANTIDADE DE VIAJENS SEJA MAIOR OUIGUAL
--A QUANTIDADE DE VIAJENS REALIZADAS PARA O MEXICO
SELECT	Cod_Pais	AS	'Codigo',
		P.Nome_Pais	AS	'Pais de Destino',
		COUNT (Cod_Pais)	AS	'Total de Viajens'
FROM Paises P INNER JOIN Viagens V
	ON P.Cod_Pais = V.Pais_Destino
GROUP BY P.Cod_Pais, P.Nome_Pais
HAVING COUNT (P.Cod_Pais)>= (SELECT COUNT (Pais_Destino)
	FROM Viagens	
	WHERE Pais_Destino = 'MEX')
GO

--EXIBE OS DADOS DOS PAISES UTILIZADOS COMO DESTINO NAS VIAJENS DOS ALUNOS CADASTRADOS DESDE QUE
--ESSES PAISES SEJAM OS ESTADOS UNIDOS MEXICO OU BRASIL
SELECT	Cod_Pais	AS	'Codigo',
		Nome_Pais	AS	'Pais de Destino',
		Idioma_pais	AS	'Idioma'
FROM Paises
WHERE Cod_Pais = ANY (SELECT Pais_Destino FROM Viagens WHERE Pais_Destino IN ('USA', 'MEX', 'BRA'))
GO

--EXIBE OD DADOS DOS ALUNOS CUJO CODIGO SEJA MAIO DO QUE TODOS OS VALORES FA LISTA
--DE PARAMETROS RETORNADA POR UM CONSTRUTOR DE VALOR DE TABELA
SELECT	Cod_Aluno	AS	'Codigo',
		Nome_Aluno	AS	'Pais de Destino',
		Endereco	AS	'Endereço'
FROM Alunos
WHERE Cod_Aluno > ALL (SELECT * FROM (VALUES (1), (3), (10)) AS Codigo (a))
GO

