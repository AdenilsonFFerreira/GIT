-- Exibe o nome das tabelas que
-- existem no banco de dados em uso
SELECT name
FROM sys.tables
GO

USE Aula09
GO

-- Cria a tabela DEPENDENTES
CREATE TABLE DEPENDENTES (
Cod_Dependente INT PRIMARY KEY,
Nome_Dependente VARCHAR(35),
Sexo_Dependente CHAR(1),
Data_Nascimento DATE,
Cod_Funcionario INT FOREIGN KEY REFERENCES
FUNCIONARIOS (ID)
)
GO

-- Exibe informa��es sobre as restri��es da
-- tabela FUNCIONARIOS
EXEC sp_helpconstraint FUNCIONARIOS
GO

-- Exibe informa��es sobre as restri��es da
-- tabela DEPENDENTES
EXEC sp_helpconstraint DEPENDENTES
GO

-- Altera o formato de data do SQL Server
SET DATEFORMAT DMY
GO

-- Insere os dados na tabela DEPENDENTES, utilizando os
-- dados provenientes do arquivo 'dependentes.csv'
BULK INSERT DEPENDENTES
FROM N'C:\Users\adeni\OneDrive\Files\GitHub\PAULO\dependentes.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

--separado por virgula vers�o mais antiga
SELECT *
FROM DEPENDENTES, FUNCIONARIOS
GO


--com cross join vers�o mais nova
SELECT *
FROM DEPENDENTES CROSS JOIN FUNCIONARIOS
GO

SELECT *
FROM FUNCIONARIOS
GO

--RELAIZA A JUN��O CRUZADA ENTRE OS DADOS DAS TABELAS FUNCIONARIO E DEPENDENTE
--UTLIZA EM ALIAS PARA NOMEAR CADA TABELA
SELECT	F.ID		AS	'Codido do Funcionario',
		F.Nome		AS	'Nome do Funcionario',
		D.Nome_Dependente	AS 'Nome do Dependente',
		D.Data_Nascimento	AS	'Data de Nascimento'
FROM FUNCIONARIOS F CROSS JOIN DEPENDENTES D
GO

--join on
--RELAIZA A JUN��O CRUZADA ENTRE OS DADOS DAS TABELAS FUNCIONARIO E DEPENDENTE
--UTLIZA EM ALIAS PARA NOMEAR CADA TABELA
SELECT	F.ID		AS	'Codido do Funcionario',
		F.Nome		AS	'Nome do Funcionario',
		F.Salario 	AS 'Salario',
		D.Nome_Dependente	AS 'Dependente',
		D.Cod_Funcionario	AS	'Codigo do Responsavel'
FROM FUNCIONARIOS F JOIN DEPENDENTES D
	ON F.ID = D.Cod_Funcionario
GO

--INNER JOIN
--RELAIZA A JUN��O CRUZADA ENTRE OS DADOS DAS TABELAS FUNCIONARIO E DEPENDENTE
--UTLIZA EM ALIAS PARA NOMEAR CADA TABELA
SELECT	F.ID		AS	'Codido do Funcionario',
		F.Nome		AS	'Nome do Funcionario',
		F.Salario 	AS 'Salario',
		D.Nome_Dependente	AS 'Dependente',
		D.Data_Nascimento	AS	'Data de Nascimento',
		D.Cod_Funcionario	AS	'Codigo do Responsavel'
FROM FUNCIONARIOS F INNER JOIN DEPENDENTES D
	ON F.ID = D.Cod_Funcionario
	WHERE YEAR (D.Data_Nascimento) >= 2000
ORDER BY F.Nome, D.Nome_Dependente
GO

-- Insere mais cinco novos funcion�rios
INSERT INTO FUNCIONARIOS VALUES
(11, 'Ana Cl�udia', 'F', '12/09/2011', 4900.00, '3663-9090'),
(12, 'Andr� Lima', 'M', '05/11/2009', 2050.00, '3664-8989'),
(13, 'Marcos Souza', 'M', '02/10/2009', 3800.00, NULL),
(14, 'Mariana Gomes', 'F', '10/11/2010', 1750.50, NULL),
(15, 'C�nthia Faria', 'F', '10/07/2016', 1750.50, '3662-1212')
GO

--left join
-- Exibe as informa��es de todos os funcion�rios,
-- inclusive daqueles que n�o possuem nenhum dependente
SELECT	F.ID		AS 'ID',
		F.Nome		AS 'Funcion�rio',
		F.Admissao	AS 'Admiss�o',
		F.Salario	AS 'Sal�rio',
		D.Nome_Dependente AS 'Dependente',
		D.Data_Nascimento AS 'Data de Nascimento'
FROM FUNCIONARIOS F LEFT JOIN DEPENDENTES D
ON F.ID = D.Cod_Funcionario
GO

--left join
-- Exibe as informa��es de todos os funcion�rios
-- que n�o possuem nenhum dependente.
SELECT	F.ID		AS 'ID',
		F.Nome		AS 'Funcion�rio',
		F.Admissao	AS 'Admiss�o',
		F.Salario	AS 'Sal�rio',
		D.Nome_Dependente AS 'Dependente',
		D.Data_Nascimento AS 'Data de Nascimento'
FROM FUNCIONARIOS F LEFT JOIN DEPENDENTES D
ON F.ID = D.Cod_Funcionario
WHERE D.Nome_Dependente IS NULL
GO

--right join
-- Exibe as informa��es de todos os funcion�rios
-- e de seus dependentes, utilizando um RIGHT JOIN.
SELECT F.ID AS 'ID',
F.Nome AS 'Funcion�rio',
F.Admissao AS 'Admiss�o',
F.Salario AS 'Sal�rio',
D.Nome_Dependente AS 'Dependente',
D.Data_Nascimento AS 'Data de Nascimento'
FROM DEPENDENTES D RIGHT JOIN FUNCIONARIOS F
ON F.ID = D.Cod_Funcionario
GO

--Cl�usula FULL JOIN
-- Exibe as informa��es de todos os funcion�rios
-- e de seus dependentes, utilizando um FULL JOIN.
SELECT F.ID AS 'ID',
F.Nome AS 'Funcion�rio',
F.Admissao AS 'Admiss�o',
F.Salario AS 'Sal�rio',
D.Nome_Dependente AS 'Dependente',
D.Data_Nascimento AS 'Data de Nascimento'
FROM FUNCIONARIOS F FULL JOIN DEPENDENTES D
ON F.ID = D.Cod_Funcionario
GO

-- Total de dependentes de cada funcion�rio
-- Exibe o total de dependentes de cada
-- funcion�rio.
SELECT	F.ID		AS 'ID',
		F.Nome		AS 'Funcion�rio',
		COUNT(F.ID) AS 'Total de Dependentes'
FROM FUNCIONARIOS F INNER JOIN DEPENDENTES D
ON F.ID = D.Cod_Funcionario
GROUP BY F.ID, F.Nome
GO

--logica incorreta 
-- Exibe o total de dependentes de cada
-- funcion�rio.
SELECT	F.ID		AS 'ID',
		F.Nome		AS 'Funcion�rio',
		COUNT(F.ID) AS 'Total de Dependentes'
FROM FUNCIONARIOS F JOIN DEPENDENTES D
ON F.ID = D.Cod_Funcionario
GROUP BY F.ID, F.Nome
GO


--LOGIVA CORRETA 
-- Exibe o total de dependentes de cada
-- funcion�rio.
SELECT	F.ID		AS 'ID',
		F.Nome		AS 'Funcion�rio',
		COUNT(D.Cod_Dependente) AS 'Total de Dependentes'
FROM FUNCIONARIOS F JOIN DEPENDENTES D
ON F.ID = D.Cod_Funcionario
GROUP BY F.ID, F.Nome
GO


