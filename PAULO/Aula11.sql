--HABILITA O CONTEXTO DO BANCO DE DADOS DA AULA09
USE Aula09
GO

--utiliza as funções de agregacao para retornar o total de funcionarios que existem
-- o total geral e a media do salario dentre eles o maior e o menor salario
--demonstra tambem a utlilização do desvio padrao e da variancia
SELECT	COUNT (*)		AS	'Total de Funcionarios',
		SUM(Salario)	AS	'Gasto Salarial',
		AVG(Salario)	AS	'Salario Medio',
		MAX(Salario)	AS	'Maior Salario',
		MIN(Salario)	AS	'Menor Salario',
		STDEV(Salario)	AS	'Desvio Padrao',
		VAR(Salario)	AS	'Varianca'
FROM FUNCIONARIOS
GO


SELECT	Sexo			AS	'Sexo',
		COUNT (Sexo)	AS 'TOTAL DE FUNCIONARIOS'
FROM FUNCIONARIOS
GROUP BY Sexo
GO

--EXIBE OS DADOS DE TODOS OS FUNCIONARIOS ARUPANDO PELO ANO E DARA DE ADIMISSÃO
SELECT	YEAR(Admissao)		AS	'Ano de Adimissao',
		COUNT (*)			AS 'Total de Funcionarios'
FROM FUNCIONARIOS
GROUP BY YEAR(Admissao)
GO

--EXECUTAR UM RELATORIO CONTENDO A INCIAL DOS FUNCIONARIOS O TOTAL DE FUNCIONARIOS CUJO NOME COME COM ESSA 
--INICIAL E O SALARIO TOTAL GASTO COM TODOS ESSES FUNCIONARIOS
SELECT	SUBSTRING(Nome, 1, 1)	AS	'Initial',
		COUNT(Nome)				AS	'Quantidade de Funcionarios',
		SUM(Salario)			AS	'Gasto Salarial'
FROM FUNCIONARIOS
--WHERE	SUM(Salario) > 2000
--HAVING SUM(Salario) > 2000 APOS GROUP BY
GROUP BY SUBSTRING(Nome, 1, 1)
HAVING SUM(Salario) > 2000
GO

--selecionar todos os funcionatios ordenando de acordo com o maior salario
SELECT	ID,
		Nome,
		Salario	AS	'Salario'
FROM FUNCIONARIOS
ORDER BY Salario DESC
GO

--SELECIONA TODOS OS FUNCIONARIOS ORDENANDO DE ACORDO COM O MAIOR SALARIO
--UTILIZAR ROM_NUMBER, RANK, DENSE_RANK E NTITLE PAR A CLASSIFICAR O RESULTADO
SELECT	ID
		Nome,
		Salario	AS	'Salario',
		ROW_NUMBER() OVER (ORDER BY Salario DESC)	AS	'ROW NUMBER',
		RANK () OVER (ORDER BY Salario DESC)		AS	'RANK',
		DENSE_RANK () OVER (ORDER BY Salario DESC)	AS	'DENSE RANK',
		NTILE (3) OVER (ORDER BY Salario DESC)		AS	'NTILE'
FROM FUNCIONARIOS
ORDER BY Salario	DESC
GO

--ATUALIZA O SALARIO DOS FUNCIOARIOS DE ID 5 E 8
UPDATE	FUNCIONARIOS
		SET Salario = 2500.00
		WHERE ID IN (4, 8)
GO

--seleciona todos os funcionarios ordenado de acordo com o maior salario
--partitiona o resultado de acordo com o sexo de cada funcionario
SELECT	ID
		Nome,
		Sexo,
		Salario	AS	'Salario',
		ROW_NUMBER() OVER (PARTITION BY Sexo ORDER BY Salario DESC)		AS	'ROW NUMBER',
		RANK () OVER (PARTITION BY Sexo ORDER BY Salario DESC)			AS	'RANK',
		DENSE_RANK () OVER (PARTITION BY Sexo ORDER BY Salario DESC)	AS	'DENSE RANK',
		NTILE (3) OVER (PARTITION BY Sexo ORDER BY Salario DESC)		AS	'NTILE'
FROM FUNCIONARIOS
--ORDER BY Salario	DESC
GO

--seleciona os dados dos funcionarios
SELECT	ID,
		Nome,
		Salario	AS	'Salàrio'
FROM FUNCIONARIOS
GO

--CRIA UMA VIEW SIMPLES UTILIZANDO OS DADOS DOS FUNCIONARIOS
CREATE VIEW Maiores_Salarios	AS
	SELECT	ID,
			Nome,
			Salario		AS	'Salàrio'
	FROM FUNCIONARIOS
GO

--EXEMPLO DE UTILIZAÇÃO DA VIEW MAIORES SALARIOS
SELECT * FROM Maiores_Salarios
GO

SELECT	Nome,
		Salàrio
FROM Maiores_Salarios
GO

--CRIA UMA VIEW BASEADA EM CONSULTA PARA EXIBIR UM RELATORIO CONTENDO A INICIAL DOS FUNCIONARIOS O TOTAL
-- E FUNCIONARIOS CUJO NOME COMECE COM ESSA INICIAL E O SALARIO GASTO COM ESSES FUNCIONARIOS
CREATE VIEW	INICIAIS	AS
	SELECT SUBSTRING(Nome, 1, 1)	AS	'Inicial',
			COUNT(Nome)				AS	'Quantidade de Funcionarios',
			SUM(Salario)			AS	'Gasto Salarial'
FROM FUNCIONARIOS
GROUP BY SUBSTRING(Nome, 1, 1)
GO

SELECT * FROM INICIAIS
GO

--SELECIONA ALGUNS CAMPOS DA VIEW INICIAIS
SELECT	Inicial,
		[Quantidade de Funcionarios],
		'Gasto Salarial'
FROM INICIAIS
WHERE [Quantidade de Funcionarios] >1
GO

--EXIBINDO INFORMAÇÕES SOBRE AS BIEWA
EXEC sp_helptext INICIAIS
GO

SELECT	TABLE_NAME		AS		'Nome da View',
		VIEW_DEFINITION	AS		'Definiçâo da View'
FROM INFORMATION_SCHEMA.Views
GO


