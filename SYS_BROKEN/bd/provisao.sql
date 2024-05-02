--EXIBE O NOME DO BANCO DE DADOS QUE EXISTE NO SERVIDOR
SELECT name
FROM sys.databases
GO

USE ProjAcoes
GO

DROP TABLE PROVISAO

CREATE TABLE PROVISAO (
    ID          INT IDENTITY(1,1) PRIMARY KEY,
    Acao        VARCHAR(10),
    Div_Valor   FLOAT, -- Usando FLOAT para suportar valores decimais
    Data_Com	DATE,
	Data_Pag	DATE,
	Total		FLOAT	-- Usando FLOAT para suportar valores decimais
)
GO


SELECT * FROM PROVISAO
GO

UPDATE PROVISAO
SET Total = (SELECT SUM(Quantidade) FROM PAPEL
WHERE PAPEL.Acao = PROVISAO.Acao) * Div_Valor
GO


UPDATE PROVISAO
SET Total = (
    SELECT SUM(P.Quantidade * P.Valor)
    FROM PAPEL P
    WHERE P.Acao = PROVISAO.Acao
);

SELECT
    PV.Acao,
    SUM(PV.Div_Valor * P.Quantidade) AS ValorTotal
FROM
    PROVISAO PV
JOIN
    PAPEL P ON PV.Acao = P.Acao
GROUP BY
    PV.Acao;
GO

DROP TABLE PROVISAO


