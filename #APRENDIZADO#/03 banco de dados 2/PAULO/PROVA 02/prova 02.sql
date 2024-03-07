--3. Utilizando o Microsoft SQL Server, execute o c�digo SQL a seguir para criar o banco de dados
--LojaAULA12, dentro do diret�rio E:\LojaAULA12. Caso necess�rio, utilize outra letra para
--representar o seu diret�rio. Observe que est� sendo utilizado o recurso de FILEGROUPS, para
--a cria��o do banco de dados em um diret�rio espec�fico.


--------------------------------------------------------------
-- Aula12_Exercicios.sql
-- Exerc�cios da Aula 12
--------------------------------------------------------------

-- Habilita o banco de dado MASTER
USE master
GO

USE LojaAULA12
GO

SELECT name
FROM sys.databases
GO

SET DATEFORMAT DMY
GO


--------------------------------------------------------------
-- Cria��o do banco de dados LojaAULA12
--------------------------------------------------------------

-- Cria��o do banco de dados LojaAULA12
-- Repare que esse banco ser� criado em E:\LojaAULA12
CREATE DATABASE LojaAULA12
	ON PRIMARY (
		NAME = 'Arquivo_Principal',
		FILENAME = 'C:\Paulo\Prova 2\LojaAULA12\Arquivo_Principal.mdf',
		SIZE = 5 MB,
		FILEGROWTH = 10%
),
FILEGROUP FG1 (
	NAME = 'Arquivo_Dados',
	FILENAME = 'C:\Paulo\Prova 2\LojaAULA12\Arquivo_Dados.ndf',
	SIZE = 3 MB,
	FILEGROWTH = 10%
)
LOG ON (
	NAME = 'Arquivo_Log',
	FILENAME = 'C:\Paulo\Prova 2\LojaAULA12\Arquivo_Log.ldf',
	SIZE = 1 MB,
	FILEGROWTH = 10%
)
GO

-- Exibe o conte�do do diret�rio E:\LojaAULA12
EXECUTE xp_dirtree 'C:\Paulo\Prova 2\LojaAULA12', 10, 1
GO

--4. Ap�s criar o banco de dados LojaAULA12, habilite seu contexto e crie as tabelas
--correspondentes ao DER descrito nos exerc�cios 1 e 2. Verifique se as tabelas foram criadas.

USE LojaAULA12
GO


--CRIA A TABELA CLIENTE
CREATE TABLE CLIENTES (
    Codigo_Cliente		INT PRIMARY KEY,

    Nome_Cliente		VARCHAR(50),
    DDD_Cliente			CHAR (3),
	Telefone_Cliente	CHAR(9),
	Saldo_Cliente		DECIMAL(10,2)
)
GO

--CRIA A TABELA FORNECEDORES
CREATE TABLE FORNECEDORES (
	Codigo_Fornecedor	INT PRIMARY KEY,

	Nome_Fornecedor		VARCHAR(35),
	Contato_Fornecedor	VARCHAR(15),
	DDD_Fornecedor		CHAR(3),
	Telefone_Fornecedor	CHAR(9),
	Estado_Fornecedor	CHAR(2)
)
GO


--CRIA A TABELA FATURA
CREATE TABLE FATURAS (
	Numero_fatura		INT PRIMARY KEY,

	Codigo_Cliente		INT	NOT NULL FOREIGN KEY REFERENCES CLIENTES(Codigo_Cliente),

	Data_Fatura			DATE,
	Subtotal_Fatura		DECIMAL(10,2),
	Imposto_Fatura		DECIMAL(10,2),
	Total_Fatura		DECIMAL(10,2)
)
GO


--CRIA A TABELA PRODUTOS
CREATE TABLE PRODUTOS (
	Codigo_Produto				VARCHAR(10) PRIMARY KEY,
			
	Descricao_Produto			VARCHAR(35),
	Data_Estocagem_Produto		DATE,
	Unidade_Disponivel_Produto	INT,
	Valor_UnitarioProduto		DECIMAL(9,2),
	Taxa_Desconto_Produto		DECIMAL(5,2),
	
	Codigo_Fornecedor			INT	NOT NULL FOREIGN KEY REFERENCES FORNECEDORES(Codigo_Fornecedor)
)
GO


--CRIA A TABELA LINHAS
CREATE TABLE LINHAS (
	Numero_Fatura				INT	NOT NULL FOREIGN KEY REFERENCES FATURAS(Numero_Fatura),

    Numero_Linha				INT PRIMARY KEY,

	Codigo_Produto				VARCHAR(10) FOREIGN KEY REFERENCES PRODUTOS(Codigo_Produto),

	Quantidade_Produto_Linha	INT,
	Valor_linha					DECIMAL(9,2),
	Total_Linha					DECIMAL(9,2)
)
GO


SELECT * FROM CLIENTES
GO

SELECT * FROM FORNECEDORES
GO

SELECT * FROM FATURAS
GO

SELECT * FROM PRODUTOS
GO

SELECT * FROM LINHAS
GO



--5. Altere a estrutura da tabela CLIENTES, inserindo um novo campo do tipo DATE, denominado
--de Data_Nascimento, para armazenar os valores referentes � data de nascimento de cada
--cliente.

--ADICIONA A COLUNA Data_Nascimento
ALTER TABLE CLIENTES
	ADD Data_Nascimento	DATE
GO

SELECT * FROM CLIENTES
GO

--6. Utilize os dados contidos no material fornecido pelo professor e fa�a o importe em massa para
--popular cada uma das tabelas do banco de dados LojaAULA12. Em seguida, liste o conte�do de
--cada uma delas.

BULK INSERT CLIENTES 
FROM N'C:\Paulo\Prova 2\Dados\clientes.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

SELECT * FROM CLIENTES
GO


BULK INSERT FORNECEDORES 
FROM N'C:\Paulo\Prova 2\Dados\fornecedores.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

SELECT * FROM FORNECEDORES
GO



BULK INSERT FATURAS 
FROM N'C:\Paulo\Prova 2\Dados\faturas.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

SELECT * FROM FATURAS
GO


BULK INSERT PRODUTOS 
FROM N'C:\Paulo\Prova 2\Dados\produtos.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

SELECT * FROM PRODUTOS
GO


BULK INSERT LINHAS 
FROM N'C:\Paulo\Prova 2\Dados\linhas.csv'
WITH (
FIRSTROW = 2,
DATAFILETYPE = 'char',
FIELDTERMINATOR =';',
CODEPAGE = 'ACP'
)
GO

--7. Liste os dados de todos os clientes que n�o forneceram a data de nascimento. Exiba somente
--as informa��es dos clientes cujo DDD seja diferente de 011 e seu saldo seja superior a 10 mil
--reais. Ordene o resultado primeiramente pelo nome do cliente, em ordem alfab�tica, e depois
--pelos maiores saldos.

SELECT *
FROM CLIENTES
WHERE Data_Nascimento IS NULL AND DDD_Cliente != '011' AND Saldo_Cliente > 10000
ORDER BY Nome_Cliente, Saldo_Cliente DESC;
GO


--8. Liste o total de clientes por cada DDD. Utilize aliases para nomear corretamente as colunas
--retornadas pela consulta.

SELECT DDD_Cliente AS 'DDD', COUNT(*) AS 'Total de Clientes'
FROM CLIENTES
GROUP BY DDD_Cliente;
GO

--9. Liste os dados de todos os fornecedores do estado de S�o Paulo. Ordene o resultado de
--acordo com o nome do fornecedor.

SELECT *
FROM FORNECEDORES
WHERE Estado_Fornecedor = 'SP'
ORDER BY Nome_Fornecedor;
GO

--10. Liste o total de fornecedores de cada regi�o. Utilize aliases para nomear corretamente as
--colunas retornadas pela consulta.

SELECT Estado_Fornecedor AS 'Regi�o', COUNT(*) AS 'Total de Fornecedores'
FROM FORNECEDORES
GROUP BY Estado_Fornecedor;
GO

--11. Liste os dados de todos os produtos cuja quantidade de unidades dispon�veis seja superior
--a 40. Exiba somente os dados dos produtos cujo c�digo comece com a sequ�ncia 'STL'.

SELECT *
FROM PRODUTOS
WHERE Unidade_Disponivel_Produto > 40 AND Codigo_Produto LIKE 'STL%'
GO

--12. Liste as informa��es de todas as faturas onde o total esteja entre 10 e 30 mil reais. Exiba
--somente as linhas onde o imposto da fatura esteja entre 20% e 30%.

SELECT *
FROM FATURAS
WHERE Total_Fatura BETWEEN 10000 AND 30000
AND Imposto_Fatura BETWEEN 0.20 AND 0.30;


--13. Liste as informa��es dos clientes que nasceram a partir de 1990. Exiba somente o nome e a
--data de nascimento, juntamente com a concatena��o dos campos DDD e telefone, no formato
--'(ddd) telefone'.

SELECT Nome_Cliente, Data_Nascimento, CONCAT('(', DDD_Cliente, ') ', Telefone_Cliente) AS 'Telefone'
FROM CLIENTES
WHERE Data_Nascimento >= '1990-01-01';
GO

--14. Liste as informa��es dos clientes que nasceram a partir de 1990. Exiba somente o nome e a
--data de nascimento, juntamente com a concatena��o dos campos DDD e telefone, no formato
--'(ddd) xxxx-xxxx'.

SELECT Nome_Cliente, Data_Nascimento, CONCAT('(', DDD_Cliente, ') ', SUBSTRING(Telefone_Cliente, 1, 4), '-', SUBSTRING(Telefone_Cliente, 5, 4)) AS 'Telefone'
FROM CLIENTES
WHERE Data_Nascimento >= '1990-01-01';
GO

--15. Liste o c�digo, descri��o, valor unit�rio e taxa de desconto dos produtos. Acrescente uma
--coluna no seu relat�rio, para exibir o valor unit�rio do produto ap�s a aplica��o da taxa de
--desconto. Utilize aliases para nomear corretamente as colunas retornadas pela consulta.

SELECT 
    Codigo_Produto AS 'C�digo', 
    Descricao_Produto AS 'Descri��o', 
    Valor_UnitarioProduto AS 'Valor Unit�rio', 
    Taxa_Desconto_Produto AS 'Taxa de Desconto', 
    Valor_UnitarioProduto * (1 - Taxa_Desconto_Produto) AS 'Valor com Desconto'
FROM PRODUTOS;
GO

--16. Execute a consulta anterior, exibindo somente duas casas decimais para os valores da coluna
--com o valor unit�rio do produto ap�s a aplica��o da taxa de desconto.

SELECT 
    Codigo_Produto AS 'C�digo', 
    Descricao_Produto AS 'Descri��o', 
    Valor_UnitarioProduto AS 'Valor Unit�rio', 
    Taxa_Desconto_Produto AS 'Taxa de Desconto', 
    ROUND(Valor_UnitarioProduto * (1 - Taxa_Desconto_Produto), 2) AS 'Valor com Desconto'
FROM PRODUTOS;
GO

--17. Realize a jun��o cruzada entre os dados das tabelas de clientes, fornecedores e produtos.
--Quantas linhas foram retornadas pela consulta?

SELECT *
FROM CLIENTES, FORNECEDORES, PRODUTOS;
GO

--18. Liste o c�digo e nome dos clientes, juntamente com o n�mero da fatura de cada um deles e
--o seu total a pagar. Utilize aliases para as tabelas e para nomear as colunas do relat�rio. Exiba
--as informa��es somente dos clientes que possuem alguma fatura. Ordene o resultado pelo
--c�digo do cliente, seguido pelo total da sua fatura.

SELECT 
    C.Codigo_Cliente AS 'C�digo do Cliente', 
    C.Nome_Cliente AS 'Nome do Cliente', 
    F.Numero_fatura AS 'N�mero da Fatura', 
    F.Total_Fatura AS 'Total a Pagar'
FROM CLIENTES AS C
JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
ORDER BY C.Codigo_Cliente, F.Total_Fatura;
GO

--19. Liste o c�digo, nome e telefone dos fornecedores, juntamente com o produto que eles
--fornecem. Utilize aliases para as tabelas e para nomear as colunas do relat�rio. Ordene o
--resultado pelo c�digo do fornecedor, seguido pelo seu nome e depois pela descri��o do produto.

SELECT 
    F.Codigo_Fornecedor AS 'C�digo do Fornecedor', 
    F.Nome_Fornecedor AS 'Nome do Fornecedor', 
    CONCAT('(', F.DDD_Fornecedor, ') ', F.Telefone_Fornecedor) AS 'Telefone', 
    P.Descricao_Produto AS 'Produto Fornecido'
FROM FORNECEDORES AS F
JOIN PRODUTOS AS P ON F.Codigo_Fornecedor = P.Codigo_Fornecedor
ORDER BY F.Codigo_Fornecedor, F.Nome_Fornecedor, P.Descricao_Produto;
GO

--20. Liste o c�digo e nome dos clientes, junto com o n�mero e o total de suas faturas. Exiba as
--informa��es somente dos clientes que n�o possuem nenhuma fatura. Utilize aliases para as
--tabelas e para nomear as colunas do relat�rio. Ordene o resultado pelo c�digo do cliente.

SELECT 
    C.Codigo_Cliente AS 'C�digo do Cliente', 
    C.Nome_Cliente AS 'Nome do Cliente'
FROM CLIENTES AS C
LEFT JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
WHERE F.Numero_fatura IS NULL
ORDER BY C.Codigo_Cliente;
GO

--21. Liste o c�digo e nome dos clientes, junto com o n�mero e o total de suas faturas. Exiba as
--informa��es de todos os clientes, inclusive aqueles que n�o possuem nenhuma fatura. Utilize
--aliases para as tabelas e para nomear as colunas do relat�rio. Ordene o resultado pelo c�digo
--do cliente depois pelo total da fatura.

SELECT 
    C.Codigo_Cliente AS 'C�digo do Cliente', 
    C.Nome_Cliente AS 'Nome do Cliente', 
    F.Numero_fatura AS 'N�mero da Fatura', 
    F.Total_Fatura AS 'Total da Fatura'
FROM CLIENTES AS C
LEFT JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
ORDER BY C.Codigo_Cliente, F.Total_Fatura;
GO

--22. Execute a consulta anterior, por�m exibindo a informa��o 'Nada consta', para os clientes que
--n�o possuem nenhuma fatura.

SELECT 
    C.Codigo_Cliente AS 'C�digo do Cliente', 
    C.Nome_Cliente AS 'Nome do Cliente', 
    COALESCE(CONVERT(VARCHAR(50), F.Numero_fatura), 'Nada consta') AS 'N�mero da Fatura', 
    COALESCE(CONVERT(VARCHAR(50), F.Total_Fatura), 'Nada consta') AS 'Total da Fatura'
FROM CLIENTES AS C
LEFT JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
ORDER BY C.Codigo_Cliente, F.Total_Fatura;
GO

--23. Liste o c�digo e descri��o de todos os produtos que ningu�m comprou. Para verificar isso,
--acrescente no relat�rio as colunas referentes ao n�mero e total da linha, presentes na tabela
--LINHAS. Utilize aliases para as tabelas e para nomear as colunas do relat�rio. Ordene o
--resultado pelo nome do produto.

SELECT 
    P.Codigo_Produto AS 'C�digo do Produto', 
    P.Descricao_Produto AS 'Descri��o do Produto', 
    L.Numero_Linha AS 'N�mero da Linha', 
    L.Total_Linha AS 'Total da Linha'
FROM PRODUTOS AS P
LEFT JOIN LINHAS AS L ON P.Codigo_Produto = L.Codigo_Produto
WHERE L.Numero_Linha IS NULL
ORDER BY P.Descricao_Produto;
GO

--24. Escreva uma consulta para exibir a quantidade de clientes que compraram produtos.

SELECT COUNT(DISTINCT C.Codigo_Cliente) AS 'Quantidade de Clientes'
FROM CLIENTES AS C
JOIN LINHAS AS L ON C.Codigo_Cliente = L.Numero_Linha;
GO

--25. Escreva uma consulta para exibir a quantidade de clientes que n�o compraram produtos.

SELECT COUNT(*) AS 'Quantidade de Clientes'
FROM CLIENTES AS C
LEFT JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
WHERE F.Numero_fatura IS NULL;
GO

--26. Liste o c�digo, nome e telefone do cliente, o n�mero e a data da sua fatura, o n�mero de
--cada linha na fatura, a descri��o do produto e de seu fornecedor, o valor unit�rio do produto, a
--sua taxa de desconto, a quantidade do produto em cada linha que descreve os itens da fatura, o
--valor de cada linha, o total de cada linha, o subtotal da fatura, o imposto da fatura e o total da
--fatura. Utilize aliases para as tabelas e para nomear as colunas do relat�rio. Ordene o resultado
--pelo nome do cliente, data da fatura, n�mero da linha, descri��o do produto e nome do seu
--fornecedor.

SELECT 
    C.Codigo_Cliente AS 'C�digo do Cliente', 
    C.Nome_Cliente AS 'Nome do Cliente', 
    CONCAT('(', C.DDD_Cliente, ') ', C.Telefone_Cliente) AS 'Telefone',
    F.Numero_fatura AS 'N�mero da Fatura', 
    F.Data_Fatura AS 'Data da Fatura',
    L.Numero_Linha AS 'N�mero da Linha',
    P.Descricao_Produto AS 'Descri��o do Produto',
    Fo.Nome_Fornecedor AS 'Nome do Fornecedor',
    P.Valor_UnitarioProduto AS 'Valor Unit�rio',
    P.Taxa_Desconto_Produto AS 'Taxa de Desconto',
    L.Quantidade_Produto_Linha AS 'Quantidade do Produto',
    L.Valor_linha AS 'Valor da Linha',
    L.Total_Linha AS 'Total da Linha',
    F.Subtotal_Fatura AS 'Subtotal da Fatura',
    F.Imposto_Fatura AS 'Imposto da Fatura',
    F.Total_Fatura AS 'Total da Fatura'
FROM CLIENTES AS C
JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
JOIN LINHAS AS L ON F.Numero_fatura = L.Numero_Fatura
JOIN PRODUTOS AS P ON L.Codigo_Produto = P.Codigo_Produto
JOIN FORNECEDORES AS Fo ON P.Codigo_Fornecedor = Fo.Codigo_Fornecedor
ORDER BY C.Nome_Cliente, F.Data_Fatura, L.Numero_Linha, P.Descricao_Produto, Fo.Nome_Fornecedor;
GO

--27. Escreva uma consulta para exibir todas as faturas do cliente de c�digo 1. A consulta deve
--exibir o nome do cliente, o n�mero de sua fatura e o total da fatura. Utilize aliases para as tabelas
--e para nomear as colunas do relat�rio.

SELECT 
    C.Nome_Cliente AS 'Nome do Cliente', 
    F.Numero_fatura AS 'N�mero da Fatura', 
    F.Total_Fatura AS 'Total da Fatura'
FROM CLIENTES AS C
JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
WHERE C.Codigo_Cliente = 1;
GO

--28. Escreva uma consulta para exibir o total geral de todas as faturas que o cliente de c�digo 1
--tem para pagar. Utilize aliases para as tabelas e para nomear as colunas do relat�rio.

SELECT
    C.Codigo_Cliente AS 'C�digo do Cliente',
    C.Nome_Cliente AS 'Nome do Cliente',
    SUM(F.Total_Fatura) AS 'Total Geral a Pagar'
FROM CLIENTES AS C
JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
WHERE C.Codigo_Cliente = 1
GROUP BY C.Codigo_Cliente, C.Nome_Cliente;

--29. Escreva uma consulta para exibir todas as faturas do cliente de c�digo 1. A consulta deve
--exibir o nome do cliente, o n�mero de sua fatura, a quantidade de linhas em cada fatura e o total
--da fatura. Utilize aliases para as tabelas e para nomear as colunas do relat�rio.

SELECT 
    C.Nome_Cliente AS 'Nome do Cliente', 
    F.Numero_fatura AS 'N�mero da Fatura', 
    COUNT(L.Numero_Linha) AS 'Quantidade de Linhas',
    F.Total_Fatura AS 'Total da Fatura'
FROM CLIENTES AS C
JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
JOIN LINHAS AS L ON F.Numero_fatura = L.Numero_Fatura
WHERE C.Codigo_Cliente = 1
GROUP BY C.Nome_Cliente, F.Numero_fatura, F.Total_Fatura;
GO

--30. Escreva uma consulta para exibir todas as faturas do cliente de c�digo 1. A consulta deve
--exibir o nome do cliente, o n�mero de sua fatura, a quantidade de linhas em cada fatura, o
--produto correspondente a cada linha, o seu valor unit�rio, a sua taxa de desconto, o seu valor
--com a aplica��o da taxa de desconto e o total da fatura. Utilize aliases para as tabelas e para
--nomear as colunas do relat�rio.

SELECT 
    C.Nome_Cliente AS 'Nome do Cliente',
    F.Numero_fatura AS 'N�mero da Fatura',
    COUNT(L.Numero_Linha) AS 'Quantidade de Linhas',
    P.Descricao_Produto AS 'Produto',
    P.Valor_UnitarioProduto AS 'Valor Unit�rio',
    P.Taxa_Desconto_Produto AS 'Taxa de Desconto',
    (P.Valor_UnitarioProduto - (P.Valor_UnitarioProduto * P.Taxa_Desconto_Produto)) AS 'Valor com Desconto',
    F.Total_Fatura AS 'Total da Fatura'
FROM CLIENTES AS C
JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
JOIN LINHAS AS L ON F.Numero_fatura = L.Numero_Fatura
JOIN PRODUTOS AS P ON L.Codigo_Produto = P.Codigo_Produto
WHERE C.Codigo_Cliente = 1
GROUP BY F.Numero_fatura, P.Descricao_Produto, P.Valor_UnitarioProduto, P.Taxa_Desconto_Produto, F.Total_Fatura
ORDER BY F.Numero_fatura;
GO

--31. Escreva uma consulta para exibir o c�digo e nome de todos os clientes, o n�mero de todas
--as suas faturas e o total de cada uma delas. Utilize aliases para as tabelas e para nomear as
--colunas do relat�rio. Ordene o resultado pelo c�digo do cliente.

SELECT 
    C.Codigo_Cliente AS 'C�digo do Cliente', 
    C.Nome_Cliente AS 'Nome do Cliente', 
    F.Numero_fatura AS 'N�mero da Fatura', 
    F.Total_Fatura AS 'Total da Fatura'
FROM CLIENTES AS C
LEFT JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
ORDER BY C.Codigo_Cliente;
GO

--32. Escreva uma consulta para exibir o c�digo e nome de todos os clientes, o n�mero total de
--produtos que eles compraram, juntamente com os valores da menor e da maior fatura. Exiba os
--valores das faturas no formato R$ xx,xx. Observe que deve ser utilizado uma v�rgula e n�o um
--ponto, para representar a parte decimal. Utilize aliases para as tabelas e para nomear as colunas
--do relat�rio. Ordene o resultado pelo c�digo do cliente.

SELECT
    c.Codigo_Cliente,
    c.Nome_Cliente,
    COALESCE(SUM(l.Quantidade_Produto_Linha), 0) AS Total_Produtos_Comprados,
    FORMAT(MIN(f.Total_Fatura), 'C', 'pt-BR') AS Menor_Fatura,
    FORMAT(MAX(f.Total_Fatura), 'C', 'pt-BR') AS Maior_Fatura
FROM
    CLIENTES c
LEFT JOIN
    FATURAS f ON c.Codigo_Cliente = f.Codigo_Cliente
LEFT JOIN
    LINHAS l ON f.Numero_Fatura = l.Numero_Fatura
GROUP BY
    c.Codigo_Cliente, c.Nome_Cliente
ORDER BY
    c.Codigo_Cliente;

--33. Escreva uma consulta para classificar os clientes, pela quantidade total de produtos que eles
--compraram. O relat�rio deve exibir o c�digo e nome do cliente, a quantidade total de produtos
--que ele comprou e sua classifica��o final. A consulta tamb�m deve exibir as informa��es para
--os clientes que n�o compraram nenhum produto e, nesse caso, ao inv�s de NULL, a consulta
--deve exibir o valor zero. As quantidades iguais de produtos compradas pelos clientes devem
--possuir a mesma classifica��o. Utilize aliases para as tabelas e para nomear as colunas do
--relat�rio. Ordene o resultado pela quantidade de produtos comprados pelos clientes, de maneira
--decrescente.

SELECT 
    C.Codigo_Cliente AS 'C�digo do Cliente',
    C.Nome_Cliente AS 'Nome do Cliente',
    COALESCE(SUM(L.Quantidade_Produto_Linha), 0) AS 'Quantidade Total de Produtos Comprados',
    RANK() OVER (
        ORDER BY SUM(L.Quantidade_Produto_Linha) DESC
    ) AS 'Classifica��o'
FROM CLIENTES AS C
LEFT JOIN FATURAS AS F ON C.Codigo_Cliente = F.Codigo_Cliente
LEFT JOIN LINHAS AS L ON F.Numero_fatura = L.Numero_Fatura
GROUP BY C.Codigo_Cliente, C.Nome_Cliente
ORDER BY 'Quantidade Total de Produtos Comprados' DESC;
GO


--34. Escreva uma consulta para classificar os produtos vendidos por cada fornecedor. O relat�rio
--deve exibir o c�digo e nome do fornecedor, o c�digo e a descri��o do produto que ele vende, a
--quantidade total de cada produto que ele vendeu e sua classifica��o final, de acordo com o total
--vendido de cada produto. A consulta tamb�m deve exibir as informa��es para os produtos que
--ningu�m comprou e, nesse caso, ao inv�s de NULL, a consulta deve exibir o valor zero. As
--quantidades iguais de produtos vendidas por cada fornecedor devem possuir a mesma
--classifica��o. Particione o resultado de acordo com o nome de cada fornecedor. Utilize aliases
--para as tabelas e para nomear as colunas do relat�rio. Ordene o resultado de maneira alfab�tica,
--pelo nome do fornecedor do produto, seguido pela quantidade total de produtos vendidos,
--ordenados de maneira decrescente.

SELECT 
    Fo.Codigo_Fornecedor AS 'C�digo do Fornecedor',
    Fo.Nome_Fornecedor AS 'Nome do Fornecedor',
    P.Codigo_Produto AS 'C�digo do Produto',
    P.Descricao_Produto AS 'Descri��o do Produto',
    COALESCE(SUM(L.Quantidade_Produto_Linha), 0) AS 'Quantidade Total Vendida',
    RANK() OVER (
        PARTITION BY Fo.Nome_Fornecedor 
        ORDER BY SUM(L.Quantidade_Produto_Linha) DESC
    ) AS 'Classifica��o'
FROM FORNECEDORES AS Fo
LEFT JOIN PRODUTOS AS P ON Fo.Codigo_Fornecedor = P.Codigo_Fornecedor
LEFT JOIN LINHAS AS L ON P.Codigo_Produto = L.Codigo_Produto
GROUP BY Fo.Codigo_Fornecedor, Fo.Nome_Fornecedor, P.Codigo_Produto, P.Descricao_Produto
ORDER BY Fo.Nome_Fornecedor, 'Quantidade Total Vendida' DESC;
GO