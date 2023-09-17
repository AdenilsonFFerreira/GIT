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
