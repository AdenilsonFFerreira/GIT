--ADENILSON FERNANDES FERREIRA
-- CJ3014959
-- Devolver as questões: 7, 10, 12, 18 e 27.
-------------------------------------------------------------------------------------------------


--7. Liste os dados de todos os clientes que não forneceram a data de nascimento. Exiba somente
--as informações dos clientes cujo DDD seja diferente de 011 e seu saldo seja superior a 10 mil
--reais. Ordene o resultado primeiramente pelo nome do cliente, em ordem alfabética, e depois
--pelos maiores saldos.

SELECT *
FROM CLIENTES
WHERE Data_Nascimento IS NULL AND DDD_Cliente != '011' AND Saldo_Cliente > 10000
ORDER BY Nome_Cliente, Saldo_Cliente DESC;
GO


--10. Liste o total de fornecedores de cada região. Utilize aliases para nomear corretamente as
--colunas retornadas pela consulta.

SELECT Estado_Fornecedor AS 'Região', COUNT(*) AS 'Total de Fornecedores'
FROM FORNECEDORES
GROUP BY Estado_Fornecedor;
GO


--12. Liste as informações de todas as faturas onde o total esteja entre 10 e 30 mil reais. Exiba
--somente as linhas onde o imposto da fatura esteja entre 20% e 30%.

SELECT *
FROM FATURAS
WHERE Total_Fatura BETWEEN 10000 AND 30000
AND Imposto_Fatura BETWEEN 0.20 AND 0.30;


--18. Liste o código e nome dos clientes, juntamente com o número da fatura de cada um deles e
--o seu total a pagar. Utilize aliases para as tabelas e para nomear as colunas do relatório. Exiba
--as informações somente dos clientes que possuem alguma fatura. Ordene o resultado pelo
--código do cliente, seguido pelo total da sua fatura.

SELECT 
    C.Codigo_Cliente AS 'Código do Cliente', 
    C.Nome_Cliente AS 'Nome do Cliente', 
    F.Numero_fatura AS 'Número da Fatura', 
    F.Total_Fatura AS 'Total a Pagar'
FROM CLIENTES AS C
JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
ORDER BY C.Codigo_Cliente, F.Total_Fatura;
GO


--27. Escreva uma consulta para exibir todas as faturas do cliente de código 1. A consulta deve
--exibir o nome do cliente, o número de sua fatura e o total da fatura. Utilize aliases para as tabelas
--e para nomear as colunas do relatório.

SELECT 
    C.Nome_Cliente AS 'Nome do Cliente', 
    F.Numero_fatura AS 'Número da Fatura', 
    F.Total_Fatura AS 'Total da Fatura'
FROM CLIENTES AS C
JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
WHERE C.Codigo_Cliente = 1;
GO