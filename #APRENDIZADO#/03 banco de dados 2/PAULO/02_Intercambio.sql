--Cria o banco intercambio

USE intercambio
GO

--Exibe o nome da tabelas que existe no
--banco de dados de uso
SELECT	TABLE_NAME AS 'Nome da Tabela'
FROM INFORMATION_SCHEMA.TABLES
WHERE	TABLE_TYPE='BASE TABLE' AND
		TABLE_CATALOG='INTERCAMBIO'
GO

--UNION ALL -> Exibe as linhas duplicadas
SELECT	Cod_Aluno AS 'Codigo do Aluno',
		Nome_Aluno AS 'Nome do Aluno',
		Sexo
FROM Alunos
		UNION ALL
SELECT	Cod_Aluno AS 'Codigo do Aluno',
		Nome_Aluno AS 'Nome do Aluno',
		Sexo
FROM AlunosCOPIA
ORDER BY Cod_Aluno, Nome_Aluno
GO

--UNION -> Não Exibe as linhas duplicadas
SELECT	Cod_Aluno AS 'Codigo do Aluno',
		Nome_Aluno AS 'Nome do Aluno',
		Sexo
FROM Alunos
		UNION
SELECT	Cod_Aluno AS 'Codigo do Aluno',
		Nome_Aluno AS 'Nome do Aluno',
		Sexo
FROM AlunosCOPIA
ORDER BY Cod_Aluno, Nome_Aluno
GO

--INTERSECT -> Retorna as lihas que existem nos dois conjuntos
SELECT	Cod_Aluno AS 'Codigo do Aluno',
		Nome_Aluno AS 'Nome do Aluno',
		Sexo
FROM Alunos
		INTERSECT
SELECT	Cod_Aluno AS 'Codigo do Aluno',
		Nome_Aluno AS 'Nome do Aluno',
		Sexo
FROM AlunosCOPIA
GO

--EXCEPT (MINUS) -> Retorna as linhas que existem 
--no primeiro menos o segundo
SELECT	Cod_Aluno AS 'Codigo do Aluno',
		Nome_Aluno AS 'Nome do Aluno',
		Sexo
FROM Alunos
		EXCEPT
SELECT	Cod_Aluno AS 'Codigo do Aluno',
		Nome_Aluno AS 'Nome do Aluno',
		Sexo
FROM AlunosCOPIA
GO

--Seleciona somente os alunos cujo nome aparece nas duas
--tabelas . Versão com INTERSECT
SELECT Nome_Aluno AS 'Nome do Aluno'
FROM Alunos	
	INTERSECT
SELECT Nome_Aluno AS 'Nome do Aluno'
FROM AlunosCOPIA
GO

--Seleciona somente os alunos cujo nome aparece nas duas
--tabelas . Versão com uma subconsulta IN
SELECT Nome_Aluno AS 'Nome do Aluno'
FROM Alunos	
WHERE Nome_Aluno IN
	(SELECT Nome_Aluno FROM AlunosCOPIA)
GO

--Seleciona somente os alunos cujo nome aparece nas duas
--tabelas . Versão com uma subconsulta NOT IN
SELECT Nome_Aluno AS 'Nome do Aluno'
FROM Alunos	
WHERE Nome_Aluno NOT IN
	(SELECT Nome_Aluno FROM AlunosCOPIA)
GO

--Exibe iforações sobre od alunos e as viagens que eles realizaram
SELECT Viagens.Cod_Viagem	AS 'Codigo da Viagem',
		Alunos.Nome_Aluno	AS 'Nome',
		Alunos.Telefone,
		Alunos.Sexo,
		(SELECT Nome_Pais FROM Paises WHERE Cod_Pais=Alunos.Pais_Origem)	AS 'Origem',
		(SELECT Nome_Pais FROM Paises WHERE Cod_Pais=Viagens.Pais_Destino)	AS 'Destino',
		Viagens.Data_Saida		AS 'Data da Saida',
		Viagens.Data_Retorno	AS 'Data de Retorno',
		Viagens.Valor			AS 'Preço da viagem R$'
FROM Alunos INNER JOIN Viagens
	ON Alunos.Cod_Viagem = Viagens.Cod_Viagem
GO

--Exibe os dados dos paises utilizdos como
--destino nas viahens dos alunos cadastrados
--cujo codigo seja 'USA'
SELECT	Cod_Pais	AS	'Codigo',
		Nome_Pais	AS	'Pais de Destino',
		Idioma_pais AS	'Idioma'
FROM Paises
WHERE Cod_Pais = (SELECT DISTINCT Pais_Destino FROM Viagens WHERE Pais_Destino = 'USA')
GO

--Exibe os dados dos paises utilizdos como
--destino nas viahens dos alunos cadastrados
SELECT	Cod_Pais	AS	'Codigo',
		Nome_Pais	AS	'Pais de Destino',
		Idioma_pais AS	'Idioma'
FROM Paises
WHERE Cod_Pais IN (SELECT Pais_Destino FROM Viagens)
GO

SELECT	P.Cod_Pais		AS	'Código',	
		P.Nome_pais		AS	'Pais de Destino',
		COUNT (Cod_Pais) AS 'Total de Viagens'
FROM Paises P INNER JOIN Viagens V
		ON P.Cod_Pais = V.Pais_Destino
GROUP BY P.Cod_Pais, P.Nome_pais
HAVING COUNT (P.Cod_Pais) >= (SELECT COUNT (Pais_Destino) FROM Viagens WHERE Pais_Destino = 'MEX')
GO

--exibe os dados dos paises utilizados como destino nas viagens dos alunos
--cadastrados, desde que esses áises sejam os Estados Unidos, Mexico ou Brasil
SELECT	Cod_Pais	AS 'Codigo',
		Nome_pais	AS 'Pais de Destino',
		Idioma_pais	AS 'Idioma'
FROM Paises
WHERE Cod_Pais = ANY (SELECT Pais_Destino FROM Viagens WHERE Pais_Destino IN ('USA', 'MEX', 'BRA'))
GO


--exibe os dados dos alunos cujo codigo seja maior do que
--todos os valores da lista de parametros retornada por
--um construtor de valor de tabela
SELECT	Cod_Aluno	AS 'Codigo',
		Nome_Aluno	AS 'Nome do Aluno',
		Endereco	AS 'Endereco'
FROM Alunos
WHERE Cod_Aluno > ALL (SELECT * FROM (VALUES (1), (3), (10)) AS Codigos(a))
GO

SELECT '3,1415'			AS 'PI',
		PI()			AS 'PI',
		ABS(-3.1415)		AS 'ABS',
		CEILING(3.1415)	AS 'CEILING',
		FLOOR(3.1415)	AS	'FLOOR',
		EXP(1.0)		AS	'EXP',
		POWER(2, 3.0)	AS	'POWER',
		RAND(5)			AS	'RAND',
		ROUND(PI(),2)	AS	'ROUND',
		SQRT(100)		AS	'SQRT',
		SIGN(-1)		AS	'SIGN',
		SQUARE(3)		AS	'SQUARE'
GO

--EXIBE INFORMAÇÕES SOBRE O VALOR DAS VIAJENS DOS ALUNOS
SELECT	V.Cod_Viagem	AS	'CODIGO DA VIAJEM',
		A.Nome_Aluno	AS	'NOME DO ALUNO',
		V.Valor			AS	'PREÇO DA VIAGEM',
		V.Valor*0.05	AS	'DESCONTO DE 5%',
		V.Valor*0.95	AS	'TOTAL A PAGAR',
		ROUND (V.VaLor*0.95,1)	AS	'TOTAL A PAGAR (ROUND)'
FROM ViaGens V INNER JOIN ALUNOS A
	ON V.Cod_Viagem = A.Cod_Viagem
GO

SELECT	SYSDATETIME()			AS	'SYSDATETIME',
		SYSDATETIMEOFFSET()	AS	'SYSDATETIMEOFFSET',
		SYSUTCDATETIME()	AS	'SYSUTCDATETIME',
		CURRENT_TIMESTAMP	AS	'CURRENT_TIMETAMP',
		GETDATE()			AS	'GETDATE',
		GETUTCDATE()		AS	'GETUTCDATE'
GO

--EXEMPLO DE FUNÇÕES QUE OBTEM A PARTE DE UMA DATA
SELECT	Cod_Aluno	AS	'CODIGO',
		Data_Nasc	AS	'DATA DE NASCIMENTO',
		DAY(Data_Nasc)	AS 'DIA DO NASCIMENTO',
		MONTH(Data_Nasc)	AS	'MES DO NASCIMENTO',
		YEAR(Data_Nasc)	AS	'ANO DO NASCIMENTO',
		DATEPART(WEEK, Data_Nasc)	AS 'SEMANA DO NASCIMENTO'
FROM ALUNOS
GO

--DECLARAÇÃO DE VARIAVEL EM T-SQL COMEÇA COM @
DECLARE	@dia	AS	INT,
		@mes	AS	CHAR(20),
		@ano	AS	INT,
		@data1	AS	DATE,
		@data2	AS	DATETIME

--TRIBUINDO VALORES
SET @dia = DAY(GETDATE())
SET @mes = MONTH (GETDATE())
SET @ano = YEAR (GETDATE())

--CRIA UMA NOVA DATA
SET @data1 = DATEFROMPARTS (@ano, @mes,@dia)
SET @data2 = DATETIMEFROMPARTS (@ano, @mes, @dia, 0, 0, 0, 0)

SELECT	@dia	AS	'DIA',
		@mes	AS	'MES',
		@ano	AS	'ANO',
		@data1	AS	'DATA 1',
		@data2	AS	'DATA 2'
GO

--DECLARA DUAS DATAS
DECLARE @data1	AS DATE,
		@data2	AS DATE

--ALTERA O FORMATO DE ENTRADA DAS DATAS
SET DATEFORMAT DMY

--ATRIBUI ALGUNS VALORES
SET @data1 = '02/02/2017',
SET @data2 =	GETDATE()

--UTILIZA DATEDIFF PARA CALCULAR A DIFERENCA ENTRE DATAS
SELECT	@data1	AS 'DATA INICIAL',
		@data2	AS 'DATA DE HOJE',
		DATEDIFF(DAY, @data1, @data2) AS 'QTD. DIAS',
		DATEDIFF(MONTH, @data1, @data2)	AS	'QTD. MESES',
		DATEDIFF(HOUR, @data1, @data2)	AS	'QTD. HORAS'
GO

--modificacao de data e valores da hora
SELECT	GETDATE ()	AS 'DATA ATUAL',
		DATEADD (MONTH, 5, GETDATE())	AS 'PROXIMOS 5 MESES',
		EOMONTH (GETDATE(), 5)	AS 'FILA DO MES (DAQUI 5 MESE)',
		SWITCHOFFSET(GETDATE(), '+10:00')	AS 'ALTERAÇÃODE FUSO-HORARIO (+10 HORAS0'
GO

--EXIBE A CONFIGURACAO ATUAL IDIOMA  DO 
--PRIMEIRO DIA DA SEMANA
SELECT	@@LANGUAGE	AS 'IDIOMA UTILIZADO',
		@@DATEFIRST	AS 'PRIMEIRO DIA DA SEMANA'
GO

--DEMONSTRA A UTILIZAÇÃO DE SELECT...CASE
SELECT @@LANGUAGE	AS 'IDIOMA UTILIZADO',
	CASE	
		WHEN @@DATEFIRST = 1 THEN 'SEGUNDA-FEIRA'
		WHEN @@DATEFIRST = 2 THEN 'TERCA-FEIRA'
		WHEN @@DATEFIRST = 3 THEN 'QUARTA-FEIRA'
		WHEN @@DATEFIRST = 4 THEN 'QUINTA-FEIRA'
		WHEN @@DATEFIRST = 5 THEN 'SEXTA-FEIRA'
		WHEN @@DATEFIRST = 6 THEN 'SABADO'
		WHEN @@DATEFIRST = 7 THEN 'DOMINGO'
	END AS 'PRIMEIRO DIA DA SEMANA'
GO

--RETORNA INFORMAÇÕE SOBRE TODOS
--OS IDIOMA DISPONIVEIS NO SERVIDOR
SELECT * FROM SYS.syslanguages
GO


--RETORNA INFORMAÇÕES SOBRE ALGUNS IDIOMAS
SELECT	langid		AS 'ID DO IDIOMA',
		dateformat	AS 'FORMATO DE DATA',
		datefirst	AS 'Primeiro dia da semana',
		name 		AS 'nome do idioma',
		alias		AS 'nome alternativo do idioma',
		months		AS 'nome dos mese',
		shortmonths	AS 'abreviatura dos mese',
		days		AS 'nome do dias'
FROM SYS.syslanguages
WHERE alias IN ('english', 'brazilian', 'german', 'japanese', 'russian')
GO
	
--RETORNA INFORMAÇÕES SOBRE ALGUNS IDIOMAS
EXEC	SP_HELPLANGUAGE [Brazilian]
GO

EXEC	SP_HELPLANGUAGE [Japanese]
GO

EXEC	SP_HELPLANGUAGE [English]
GO

-- declara uma variavel para armazenar a data atual
DECLARE @data DATETIME

--ATRIBUI O VALOR DA DATA ATUAL
SET @data = GETDATE()

--EXIBE INFORMAÇÕES SOBRE A DATA ATUAL
SELECT	@data					AS 'DATA ATUAL',
		DATEPART (DAY, @data)	AS 'DIA  DO MES',
		DATENAME (DW, @data)	AS 'DIA DA SEMANA',
		DATEPART (MONTH, @data)	AS 'MES',
		DATENAME (MONTH, @data)	AS 'NOME DO MES',
		DATEPART (YEAR, @data)	AS 'ANO'
GO

-- declara uma variavel para armazenar a data atual
DECLARE @data DATETIME

--ATRIBUI O VALOR DA DATA ATUAL
SET @data = GETDATE()

--OUTRA MANEIRA DE EXIBIR INFORMAÇÕES SOBRE A DATA ATUAL
SELECT	@data					AS 'DATA ATUAL',
		DATENAME (DW, @data)	AS 'DIA  DA SEMANA',
		DATENAME (WK, @data)	AS 'SEMANA DO ANO',
		DATEPART (M, @data)		AS 'NOME DO MES',
		DATENAME (D, @data)		AS 'DIA DO MES',
		DATENAME (DY, @data)	AS 'DIA DO ANO'
GO

--ALTERA O IDIOMA PARA O PORTGUES DO BRASIL
SET LANGUAGE Brazilian
GO

--DECLARACAO UMA VARIAVEL PARA ARMAZENAR A DATA ATUAL
DECLARE @data DATETIME

--ATRIBUIR O VALOR DA DATA ATUAL
SET @data = GETDATE()

--EXIBE O DIOMA, DIA DA SEMANA E NOME DO MES
SELECT	@@LANGUAGE	AS 'IDIOMA',
		DATENAME (DW, @data)	AS	'DIA DA SEMANA',
		DATENAME (M, @data)		AS	'NOME DO MES'
GO

--ALTERAR O FORMATO DE DATA E HORA ->DMY
SET DATEFORMAT DMY
GO

--UTILIZA ISDATE E UM IF-ELSEPARA VALIDAR UMA DATA
IF ISDATE ('20/01/2015 00:10:50.000') = 1
	PRINT 'DATA VÁLIDA!'
ELSE
	PRINT 'DATA INVÁLIDA'
GO

--ALTERAR O FORMATO DE DATA E HORA -> MDY
SET DATEFORMAT MDY
GO

--UTILIZA ISDATE E UM IF-ELSEPARA VALIDAR UMA DATA
IF ISDATE ('20/01/2015 00:10:50.000') = 1
	PRINT 'DATA VÁLIDA!'
ELSE
	PRINT 'DATA INVÁLIDA'
GO

--DEMONSTRA A UTILIZAÇÃO DE ALGUMAS FUNÇÕES QUE MANIPULAM O 
--CODIGO ASCII E O CODIGO UNICODE
SELECT	ASCII('IFSP')	AS	'ASCII - IFSP',
		UNICODE ('IFSP')	AS 'UNICODE - IFSP',
		CHAR(73)		AS	'CHAR - 73',
		NCHAR(73)		AS	'NCHAR - 73',
		ASCII(N'БРАЗИЛИЯ')	AS 'ASCII - БРАЗИЛИЯ',
		UNICODE(N'БРАЗИЛИЯ')	AS	'UNICODE -БРАЗИЛИЯ',
		CHAR(1041)	AS	'CHAR - 1041',
		NCHAR(1041)	AS	'NCHAR - 1041',
		CHARINDEX('IFSP', 'CAMPUS DO IFSP') AS	'CHARIDEX'
GO

--SPACE  E LEN ESTA NA LISTA

--DEMONSTRA A UTILIZAÇÃO DO SPACE, QUOTENAME, STR E LEN
SELECT 'PAULO' + 'GIOVANI'	AS	'SPACE 1',
		'PAULO' + ' ' + 'GIONAVE'	AS 'SPACE 2',
		'PAULO' + SPACE(10) + 'GIOVANI'	AS 'SPACE 3',
		QUOTENAME('PAULO GIOVANI', '{')	AS 'QUOTENAME 1',
		QUOTENAME('PAULO GIOVANI', '"')	AS 'QUOTENAME 2',
		QUOTENAME('PAULO GIOVANI', '[')	AS 'QUOTENAME 3',
		STR (100)	AS 'STR1',
		STR (100.0)	AS 'STR2',
		STR (100.45, 6, 2)	AS 'STR3',
		LEN ('PAULO GIOVANI')	AS	'LEN 1'
GO

--DEMONSTRA A UTILIZAÇÃO DE PATINDEX
SELECT	PATINDEX ('MP', 'CAMPUS CAMPOS DO JORDÃO')	AS	'PATINDEX 1',
		PATINDEX ('%MP%', 'CAMPUS CAMPOS DO JORDÃO')	AS	'PATINDEX2'
GO

--DEMONSTRACAO A UTILIZACAO DE SOUNDEX E DIFERENCE
SELECT	SOUNDEX('PAULO')	AS	'SOUNDEX - PAULO',
		SOUNDEX('PAUL')		AS	'SOUNDEX - PAUL',
		SOUNDEX('CRIS')		AS	'SOUNDEX - CRIS',
		DIFFERENCE('PAULO', 'PAUL')	AS	'DIFF 1',
		DIFFERENCE('PAULO', 'CRIS')	AS	'DIFF 2'
GO

--EXIBE A DATA ATUAL, FORMATADA EM VARIOS IDIOMAS
DECLARE @d DATETIME = GETDATE()

SELECT	FORMAT (@d, 'D', 'en-US')	AS	'INGLES AMERICANO',
		FORMAT (@d, 'D', 'en-gb')	AS	'INGLES BRITANICO',
		FORMAT (@d, 'D', 'de-de')	AS	'ALEMÃO',
		FORMAT (@d, 'D', 'zh-cn')	AS	'CHINES SIMPLIFICADO',
		FORMAT (@d, 'D', 'pt_br')	AS	'PORTUGUES BRASILEIRO'
GO

--EXIBE O NOME DO ALUNO E A DATA DE NASCIMENTO
SELECT	Nome_Aluno	AS	'ALUNO',
		Data_Nasc	AS	'DATA DE NASCIMENTO',
		FORMAT(Data_Nasc, 'D', 'PT-BR')	AS	'DATA DE NASCIMENTO'
FROM Alunos
GO
