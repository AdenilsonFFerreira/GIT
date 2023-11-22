CREATE TABLE PROFESSORES(
	ID			INT PRIMARY KEY,
	Nome		VARCHAR(100),
	Apelido		VARCHAR(50),
	Sexo		CHAR(1),
	Origem		VARCHAR(50),
	Admissao	DATE,
	Salario		DECIMAL(10,2),
	Resumo		VARCHAR(200)
)
GO


SELECT *
FROM PROFESSORES
GO

--INSERE DADOS N TABELA DE FUNCIONARIOS
INSERT INTO PROFESSORES VALUES (1, 'katherine Anne Pryde', 'Lince Negra', 'F', 'Ilinois', '01/01/1980', 15000.00, 'Ministra aulas de Ciências da Computação e faz parte da equipe senior')
GO


INSERT INTO FUNCIONARIOS VALUES
	(1, 'katherine Anne Pryde', 'Lince Negra', 'F', 'Ilinois', '01/01/1980', 15000.00, 'Ministra aulas de Ciências da Computação e faz parte da equipe senior'),
	(6, 'Pedro Silva', 'M', '15/11/2015', 1050.00),
	(7, 'Monica Silva', 'F', '12/10/2014', 3000.00),
	(8, 'Tiago Lima', 'M', '10/05/2016', 1350.00)
GO