--EXIBE O NOME DO BANCO DE DADOS QUE EXISTE NO SERVIDOR
SELECT name
FROM sys.databases
GO

USE ProjAcoes
GO


CREATE TABLE PATRIMONIO(
	ID			INT IDENTITY(1,1) PRIMARY KEY,
	LoginID		INT FOREIGN KEY REFERENCES LOGIN(ID),
	Corretora	VARCHAR(64),
	Valor		DECIMAL(10, 2)
)
GO

DROP TABLE PATRIMONIO

SELECT * FROM PATRIMONIO
GO
