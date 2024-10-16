--EXIBE O NOME DO BANCO DE DADOS QUE EXISTE NO SERVIDOR
SELECT name
FROM sys.databases
GO

USE ProjAcoes
GO

--DROP TABLE USUARIO

--CRIA A TABELA USUARIO
CREATE TABLE USUARIO(
	ID		INT IDENTITY(1,1) PRIMARY KEY,
	Nome		VARCHAR(50),
	Endereco	VARCHAR(50),
	Numero		VARCHAR(10),
	Bairro		VARCHAR(40),
	Cidade		VARCHAR (40),
	CEP			VARCHAR(8),
	CPF			VARCHAR(11),
	Email		VARCHAR (50),
	Sexo		VARCHAR(1),
	Celular		VARCHAR(15),
	Telefone	VARCHAR(15),
	CONSTRAINT AK_CPF UNIQUE(CPF)
	)
GO

SELECT * FROM USUARIO
GO

