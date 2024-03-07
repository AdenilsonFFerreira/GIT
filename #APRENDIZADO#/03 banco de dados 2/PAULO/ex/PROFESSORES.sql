CREATE TABLE PROFESSORES(
	ID		INT PRIMARY KEY,
	Nome	VARCHAR(100),
	Apelido	VARCHAR(50),
	Sexo	CHAR(1),
	Origem	VARCHAR(50),
	Admissao	DATE,
	Salario		DECIMAL(10,2),
	Resumo	VARCHAR(200)
)
GO


SELECT *
FROM PROFESSORES
GO


INSERT INTO PROFESSORES VALUES
	(1, 'Katherine Anne Pryde', 'Lince Negra', 'F', 'ILinois', '01/01/1980', 15000.00, 'Ninistra Aula de Ciência da Computação e faz parte da equipe sênior'),
	(2, 'Kurt Wagner', 'Noturno', 'M', 'Baviera', '01/05/1975', 17000.50, 'Ministra aula de Teatro'),
	(3, 'Emma Grace Frost', 'Rainha Branca', 'F', 'Boston', '01/01/1980', 28500.99, 'Diretora do instituto Xavier, ministra aulas de Etica'),
	(4, 'Henry Philip McCoy', 'Fera', 'M', 'Ilinois', '01/09/1963', 21000.00, 'Ministra aulas de Ciência e Matemática e faz parte da equipe sênior, além de supervisionar os curriculos acadêmicos'),
	(5, 'Scott Summers', 'Ciclope', 'M', 'Alasca', '01/09/1963', 30000.00, 'Diretor do Instituto Xavier, ministra aulas de Liderança e Táticas de Batalha'),
	(6, 'James Howlett', 'Wolverine', 'M', 'Alberta', '01/11/1974', 29000.00, 'Ministra aulas de combate')
GO

--consulta 01
--exibir todos os dados da tabela professores
SELECT *
FROM PROFESSORES
GO

--consulta 02
--exibir o ID, Nome, Sexo e salarios dos professores
--para o id, utilize o alias 'Codigo do professor'
-- para salario, utilize o alias 'Salario'
SELECT	ID AS 'CóDigo do Professor',
		Nome,
		Sexo,
		Salario AS 'Salario'
FROM PROFESSORES
GO

--consulta 03
--exibir id, nome, apelido, origem e resumo dos professores
--para o id utilize o alias 'Codigo do Professor'
SELECT	ID AS 'Codigo do Professor',
		Nome,
		Apelido,
		Origem,
		Resumo
FROM PROFESSORES
GO

--consulta 04
--exibir todos os dados da tabela professores
--listar somente os 3 primeiros registros
SELECT TOP 3 *
FROM PROFESSORES

GO

--CONSULTA 05
--EXIBRI O ID, NOME, SEXO E SALARIO DOS PROFESSORES
--PARA ID UTILIZE O ALIAS CODIGO DO PROFESSOR
--PARA SALARIO UTILIZE O ALIAS SALARIO
--LISTAR SOMENTE OS 3 PRIMEIROS REGISTROS
SELECT	TOP 3
		ID		AS 'Codigo do Professor',
		Nome,
		Sexo,
		Salario	AS 'Salário'
FROM PROFESSORES
GO

--consulta 06
--exibir todas as informações dos professores do sexo feminino
SELECT * FROM PROFESSORES
WHERE Sexo = 'F' 		
GO

--CONSULTA 07
-- EXIBIR TODAS AS INFORMAÇÕES DO PROFESSORE DO SEXO MASCULINO
SELECT * FROM PROFESSORES
WHERE Sexo = 'M' 		
GO

--CONSULTA 08
--EXIBIOR TODAS AS INFORMAÇÕES DOS PROFESSORES DO SEXO MASCULINO
--CUJO SALARIO SEJA MAIOR DO QUE 2000
SELECT * FROM PROFESSORES
WHERE Sexo = 'M' AND
	Salario >20000
GO

--consulta 09
--exibir os dados dos professores cujo salario esteja entre 10000 e 20000 utilizando os operadores >= and <=
SELECT * FROM PROFESSORES
WHERE Salario >=10000 AND Salario <=20222 
GO

--colsulta 10
--exibir os dados dos professores cujo salario esteja entre 10000 e 20000 utilizando o operador between
SELECT * FROM PROFESSORES
WHERE Salario BETWEEN	10000 AND 20000 
GO

--CONSULTA 11
--VERIFICAR SE EXISTE ALGUM PROFESSOR QUE NASCEU NO BRASIL UTILIZANDO O OPERADOR EXIST
IF EXISTS (SELECT * FROM PROFESSORES WHERE Origem = 'Brasil')
	PRINT 'Ha professor que nasceu no Brasil'
	ELSE
	PRINT 'Nenhum professor nasceu no Brasil'
GO

--consulta 12
--exibir o id, nome, apelido, origem e resumo dos professores
--para id utilizze o alias 'Código do Professor'
--selecionar apenas os professores cujo nome comece com a letra K
SELECT	ID		AS 'Codigo do Professor',
		Nome,
		Apelido,
		Origem,
		Resumo
FROM PROFESSORES
WHERE Nome LIKE 'K%'
GO

--CONSULTA 13
--EXIBIR OS DADOS DOS PROFESSORES CUJO NOME CONTENHAM "SUMMERS'
--UTILIZAR A FUNÇÃO UPPER() PARA CONVERTER O NOME PARA LETRAS MAIUSCULAS
SELECT * FROM PROFESSORES
WHERE UPPER (Nome) LIKE '%SUMMERS%'
GO

--CONSULTA 14
--EXIBIR OS DADOS DOS PROFESSORES CUJO NOME CONTENH SUMMER OU PRYDE
--UTILIZAR A FUNÇÃO UPPER() PARA CONVERTER O NOME PARA LETRAS MAIUSCULAS
SELECT * FROM PROFESSORES
WHERE UPPER(Nome) LIKE '%SUMMERS%' OR UPPER(Nome) LIKE '%PRYDE%';
GO

--CONSULTA 15
--EXIBIR OS DADOS DOS PROFESSORES CUJO A ORIGEM SEJA iLINOIS
--UTILIZAR O OPERADOR DE COMPARAÇÃO


--CONSULTA 16
--EXIBIR OS DADOS DOS PROFESSORES CUJO A ORIGEM SEJA iLINOIS
--UTILIZAR O OPERADOR LIKE
SELECT * FROM PROFESSORES
WHERE UPPER (Origem) LIKE '%ILINOIS%'
GO

--CONSULTA 17
--EXIBIR OS DADOS DOS PROFESSORES QUE TAMBEM SÃO DIRETORES
SELECT * FROM PROFESSORES
WHERE UPPER (Resumo) LIKE '%DIRETOR%'
GO

--CONSULTA 18
--SELECIONAR TODOS OS PROFESSORES CUJO ID SEJA 1, 2 OU 5
--UTILIZAR UM OPERADOR LOGICO
SELECT * FROM PROFESSORES
WHERE	ID = 1 OR
		ID = 2 OR
		ID = 5
GO

--CONSULTA 19
--SELECIONAR TODOS OS PROFESSORES CUJO ID SEJA 1, 2 OU 5
--UTILIZANDO O OPERADOR in
--SELECIONA TODOS OS FUNCIONARIOS CUJO ID SEJA 1, 2 OU 5
--VERSAO UTILIZANDO IN
SELECT * FROM PROFESSORES
WHERE ID IN (1,2,5)
GO

--CONSULTA 20
--SELEIONAR TODOS OS PROFESSORES CUJO A ORIGEM SEJA iLINOIS, ALASCA OU ALBERTA
--SELECIONA TODOS OS FUNCIONARIOS CUJO ID SEJA 1, 2 OU 5
--VERSAO UTILIZANDO IN
SELECT * FROM PROFESSORES
WHERE Origem IN ('Ilinois', 'Alasca', 'Alberta')
GO

--consulta 21
--exibir informações de todos os professores
--ordenar o resultado pelo nome em ordem alfabetica(a-z)
SELECT * FROM PROFESSORES
ORDER BY Nome ASC
GO

--consulta 22
--exibir informações de todos os professores
--ordenar o resultado pelo nome em ordem alfabetica (Z-A)
SELECT * FROM PROFESSORES
ORDER BY Nome DESC
GO

--CONSULTA 23
--EXIBIR ID, NOME, APELIDO, DATA DE ADIMISSÃO, SALARIO E RESUMO DOS PROFESSORE
--ORDENAR O RESULTADO DE ACORDO COM QUEM RECEBE OS MAIORES SALARIOS
--PARA ID UTILIZE O ALIAS 'cÓDIGO DE ADMISSÃO'
-- PARA SALARIO UTILIZE O ALIAS 'SALARIO
SELECT	ID			AS 'Código do Admissão',
		Nome,
		Apelido,
		Admissao,
		Salario		AS '´Salário',
		Resumo
FROM PROFESSORES
ORDER BY Salario ASC
GO

--CONSULTA 24
--EXIBIR ID, NOME, APELIDO, ORIGEM, DATA DE ADMISSÃO, SALARIO E RESUMO DOS PROFESSORES
--ORDENAR O RESULTADO PELO NOME (A-Z), SEGUINDO PELO APELIDO
--PARA ID UTILIZE O ALIAS 'cÓDIGO DO PROFESSOR'
--PARA A ADMISSÃO UTILIZE O ALIAS 'DATA DE ADMISSÃO'
-- PARA SALARIO UTILIZE O ALIAS 'SALARIO
SELECT	ID			AS 'Código do Professor',
		Nome,
		Apelido,
		Origem,
		Admissao	AS 'Data de Admissâo',
		Salario		AS '´Salário',
		Resumo
FROM PROFESSORES
ORDER BY Apelido ASC
GO
