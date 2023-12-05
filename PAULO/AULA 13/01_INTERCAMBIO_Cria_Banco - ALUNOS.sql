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


SELECT	'3.1405'	AS	'PI',
	PI()		AS	'PI',
	ABS(-3.1415)	AS	'ABS',
	CEILING(3.1415)	AS	'CEILING',
	FLOOR(3.1415)	AS	'FLOOR',
	EXP(1.0)	AS	'EXP',
	POWER(2, 3.0)	AS	'POWER',
	RAND(5)		AS	'RAND',
	ROUND(PI(), 2)	AS 	'ROUND',
	SQRT(100)	AS	'SQRT',
	SIGN(-1)	AS	'SIGN',
	SQUARE(3)	AS	'SQUARE'
GO

-- Exibe INFORMAÇÕES SOBRE O VALOR DAS VIAGENS DOS ALUNOS
SELECT V.Cod_Viagem		AS 'Código da Viagem',
       A.Nome_Aluno		AS 'Nome do Aluno',
       V.Valor			AS 'Preçô da Viagem',
       V.Valor * 0.05	AS 'Desconto de 5%',
	   V.Valor * 0.05	AS 'Total a Paga',
	   ROUND(V.Valor * 0.05, 1) AS 'Total a Pagar (ROUND)'
FROM Viagens V INNER JOIN ALUNOS A
	ON V.Cod_Viagem = A.Cod_Viagem
GO

--exemplo de funções com precisão superior e inferior
SELECT	SYSDATETIME()		AS	'SYSDATETIME',
		SYSDATETIMEOFFSET()	AS	'SYSDATETIMEOFFSET',
		SYSUTCDATETIME()	AS	'SYSUTCDATETIME',
		CURRENT_TIMESTAMP	AS	'CURRENT_TIMESTAMP',
		GETDATE()			AS	'GETDATE',
		GETUTCDATE()		AS	'GETUTCDATE	'
GO

--exemplo de funções que obtem a parte de uma data
SELECT	Cod_Aluno	AS	'Código',
		Data_Nasc	AS	'Data de Nascimento',
		DAY(Data_Nasc)	AS	'Dia do Nascimento',
		MONTH(Data_Nasc)	AS	'Mês de Nascimento',
		YEAR(Data_Nasc)		AS	'Ano do Nascimento',
		DATEPART(WEEK, Data_Nasc)	AS	'Semana do Nascimento',
		DATEPART(WEEKDAY, Data_Nasc)	AS	'Dia DA Semana do Nascimento'
FROM ALUNOS
GO

--DECLARAÇÃO DE VARIAVEIS EM T-SQL
DECLARE	@dia	AS	INT,	
		@mes	AS CHAR(20),	
		@ano	AS INT,
		@data1	AS DATE,
		@data2	AS DATETIME

--ATRIBUINDO VALORES
SET @dia = DAY(GETDATE())
SET @mes = MONTH(GETDATE())
SET @ano = YEAR(GETDATE())

--CRIAR UMA NOVA DATA
SET @data1 = DATEFROMPARTS (@ano, @mes, @dia)
SET @data2 = DATETIMEFROMPARTS (@ano, @mes, @dia, 0, 0, 0, 0)

SELECT	@dia	AS	'Dia',
		@mes	AS	'Mês',
		@ano	AS	'Ano',
		@data1	AS	'Data 1',
		@data2	AS	'Data 2'
GO

--DECLARA DUA DATAS
DECLARE @data1	AS	DATE,
		@data2	AS	DATE

--ALTERA O FORMATO DE ENTRADA DAS DATAS
SET DATEFORMAT DMY

--ATRIBUI ALGUNS  VALORES
SET @data1 = '02/02/2017'
SET @data2 = GETDATE()

SELECT	@data1	AS	'Data Inicial',
		@data2	AS	'Data de Hoje',
		DATEDIFF(DAY, @data1, @data2)	AS	'QTD DIAS',
		DATEDIFF(MONTH, @data1, @data2)	AS	'QTD MESES',
		DATEDIFF(HOUR, @data1, @data2)	AS	'QTD HORAS'
GO

--modificação da data e valores da hora
SELECT	GETDATE()	AS	'Data Atual',
		DATEADD(MONTH, 5, GETDATE())	AS	'Próximos 5 mese',
		EOMONTH(GETDATE(), 5)	AS	'Final do mês (daqui 5 mese)',
		SWITCHOFFSET(GETDATE(), '+10:00')	AS	'Alteração de fuso-horario (+10horas)'
GO

--EXIBE A CONFIGURAÇÃO ATUAL DO IDIOMA E DO PRIMEIRO DIA DA SEMANA
SELECT	@@LANGUAGE	AS	'Idioma Utilizado',
		@@DATEFIRST	AS	'Primeiro dia da Semana'
GO

--DEMONSTRA A UTILIZAÇÃO DE SELECT .....CASE
SELECT	@@LANGUAGE	AS	'Idioma Utilizado',
	CASE
		WHEN @@DATEFIRST = 1 THEN	'Segunda-Feira'
		WHEN @@DATEFIRST = 2 THEN	'Terça-Feira'
		WHEN @@DATEFIRST = 3 THEN	'Quarta-Feira'
		WHEN @@DATEFIRST = 4 THEN	'Quinta-Feira'
		WHEN @@DATEFIRST = 5 THEN	'Sexta-Feira'
		WHEN @@DATEFIRST = 6 THEN	'Sabado'
		WHEN @@DATEFIRST = 7 THEN	'Domingo'
	END AS 'Primeiro dia da semana'
GO

--retornar informações sobre todos os idiomas disponiveis no servidor
SELECT * FROM SYS.syslanguages
GO

--RETORNA INFORMAÇÕES SOBRE ALGUNS IDIOMAS
SELECT	langid	AS	'ID do Idioma',
		dateformat	AS 'Formato de data',
		datefirst	AS	'Primeiro dia da semana',
		name		AS	'Nome do idioma',
		alias		AS	'Nome alternstivo do idioma',
		months		AS	'Nome dos meses',
		shortmonths AS	'Abreviatura dos meses',
		days		AS	'Nome dos dias'
FROM SYS.syslanguages
WHERE alias IN ('English', 'Brazilian', 'German', 'Japanese', 'Russian')
GO

--retorna informações sobre alguns idiomas
EXEC sp_helplanguage [Brazilian]
GO
EXEC sp_helplanguage [Japanese]
GO
EXEC sp_helplanguage [English]
GO

--DECLARA UMA VARIAVEL PARA ARMAZENAR A DATA ATUAL
DECLARE @data DATETIME

--ATRIBUI O VALOR DA DARA ATUAL1
SET @data = GETDATE()

--EXIBE INFORMAÇÕES SOBRE A DATA ATUAL
SELECT	@data					AS	'Data atual',
		DATEPART(DAY, @data)	AS	'Dia do mês',
		DATENAME(DW, @data)		AS	'Dia da semana',
		DATEPART(MONTH, @data)	AS	'Mês',
		DATENAME(MONTH, @data)	AS	'Nome do mês',
		DATEPART(YEAR, @data)	AS	'Ano'
GO

--DECLARA UMA VARIAVEL PARA ARMAZENAR A DATA ATUAL
DECLARE @data DATETIME

--ATRIBUI O VALOR DA DARA ATUAL1
SET @data = GETDATE()

--OUTRA MANEIRA DE EXIBE INFORMAÇÕES SOBRE A DATA ATUAL
SELECT	@data					AS	'Data atual',
		DATENAME(DW, @data)		AS	'Dia da semana',
		DATENAME(WK, @data)		AS	'Semana do ano',
		DATENAME(M, @data)		AS	'Nome do Mês',
		DATENAME(D, @data)		AS	'Dia do mes',
		DATENAME(DY, @data)		AS	'Dia do Ano'
GO