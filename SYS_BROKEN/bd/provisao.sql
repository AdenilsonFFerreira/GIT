--EXIBE O NOME DO BANCO DE DADOS QUE EXISTE NO SERVIDOR
SELECT name
FROM sys.databases
GO

USE ProjAcoes
GO

--DROP TABLE PAPEL

CREATE TABLE PROVISAO (
    ID          INT IDENTITY(1,1) PRIMARY KEY,
    Acao        VARCHAR(10),
    Div_Valor   FLOAT, -- Usando FLOAT para suportar valores decimais
    Data_Com	DATE,
	Data_Pag	DATE
)
GO

 
SELECT * FROM PROVISAO
GO





