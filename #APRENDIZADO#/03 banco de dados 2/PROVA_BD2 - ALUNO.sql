-- ----------------------------------------------------------------------------- 
-- 
-- Prova de Banco de Dados II
--
-- Instruções:
--
-- 1. Leia atentamente as instruções dentro desse arquivo;
-- 2. Para cada questão, execute as instruções de acordo com os comentários;
-- 3. Ao terminar, salve o arquivo como: BD2-P1-NomeAluno.sql (Ex.: BD2-P1-PauloGiovani.sql)
-- 4. Envie o arquivo para o professor, utilizando o Google Classroom.
--
-- -----------------------------------------------------------------------------


-- -----------------------------------------------------------------------------
-- QUESTÃO 1: Crie o banco de dados PROVA_BD2 e habilite seu contexto.
-- -----------------------------------------------------------------------------



-- Após criar o banco de dados, execute o código abaixo para criar as tabelas: 
-- CLIENTES, PRODUTOS e COMPRAS.



-- Cria a tabela CLIENTES
CREATE TABLE CLIENTES (
    Cod_Cliente  INT PRIMARY KEY,
    Nome_Cliente CHAR(20),
    Sexo         CHAR(1)
);



-- Cria a tabela PRODUTOS
CREATE TABLE PRODUTOS (
    Cod_Produto INT PRIMARY KEY,
    Descricao   CHAR(50),
    Valor       DECIMAL(7, 2)
);



-- Cria a tabela COMPRAS
CREATE TABLE COMPRAS (
    Cod_Compra  INT PRIMARY KEY,
    Cod_Cliente INT,
    Cod_Produto INT,
    Data_Compra DATE,
    Quantidade  INT,
    FOREIGN KEY (Cod_Cliente) REFERENCES CLIENTES(Cod_Cliente),
    FOREIGN KEY (Cod_Produto) REFERENCES PRODUTOS(Cod_Produto)
);



-- -----------------------------------------------------------------------------
-- QUESTÃO 2: Insira os seguintes dados em suas respectivas tabelas
-- -----------------------------------------------------------------------------



-- Tabela CLIENTES

/*

1, Alisson Mineiro, M
2, Padre Elton, M
3, Helton Tiozão, M
4, Marquinho, M
5, Karen Argentina, F
6, Tia Suzana, F
7, Walter Paraíba, M

*/



-- Tabela PRODUTOS

/*

1, Pinga 51, 14.50
2, Queijo Minas, 26.55
3, Rapadura Gourmet, 69.80
4, Pequi em Conserva, 46.90
5, Geleia de Mocotó, 29.60
6, Extrato de Propólis, 31.40
7, Jiló em Conserva, 36.99
8, Vinho Dom Bosco, 14.25
9, Tereré Menta, 9.25
10, Pirulito Push Pop, 7.45
11, Chapaghetti, 18.45
12, Rapadura Diet, 80.00
13, Biscolata Nirvana, 6.45
14, Guaraná Jesus, 12.45
15, Mandiopã, 10.45

*/



-- Tabela COMPRAS

/*

1, 1, 1, 01/10/2022, 10
2, 1, 2, 01/10/2022, 20
3, 2, 2, 02/10/2022, 15
4, 2, 8, 02/10/2022, 10
5, 3, 2, 02/10/2022, 50
6, 4, 10, 01/10/2022, 2
7, 4, 15, 01/10/2022, 2
8, 4, 13, 01/10/2022, 4
9, 5, 9, 03/10/2022, 5
10, 6, 6, 03/10/2022, 2
11, 6, 12, 03/10/2022, 2
12, 7, 3, 01/10/2022, 10
13, 7, 4, 01/10/2022, 10
14, 7, 5, 01/10/2022, 15
15, 7, 7, 02/10/2022, 10
16, 7, 14, 03/10/2022, 12

*/



-- -----------------------------------------------------------------------------
-- QUESTÃO 3: Escreva uma consulta para exibir os dados de todos os clientes
-- do sexo feminino. Utilize aliases para nomear as colunas.
-- -----------------------------------------------------------------------------





-- -----------------------------------------------------------------------------
-- QUESTÃO 4: Escreva uma consulta para exibir os dados de todos os clientes
-- cujo nome comece com a letra P ou W. Utilize aliases para nomear as colunas.
-- -----------------------------------------------------------------------------





-- -----------------------------------------------------------------------------
-- QUESTÃO 5: Escreva uma consulta para exibir os dados de todos os produtos, 
-- ordenando o resultado a partir do produto mais caro. Utilize aliases para 
-- nomear as colunas.
-- -----------------------------------------------------------------------------





-- -----------------------------------------------------------------------------
-- QUESTÃO 6: Escreva uma consulta para exibir todos os dados das compras cuja 
-- quantidade do produto comprado seja maior do que 10 ou o código do produto 
-- seja 1, 5 ou 10. Utilize aliases para nomear as colunas.
-- -----------------------------------------------------------------------------





-- -----------------------------------------------------------------------------
-- QUESTÃO 7: Escreva uma consulta para exibir o nome do cliente, o nome do 
-- produto que ele comprou, a quantidade comprada e a data da compra, ordenando 
-- o resultado pelo nome do cliente. Utilize aliases para nomear as colunas.
-- -----------------------------------------------------------------------------





-- -----------------------------------------------------------------------------
-- QUESTÃO 8: Escreva uma consulta para exibir o nome do cliente, o produto que 
-- ele comprou, a quantidade do produto e o valor total que o cliente deverá 
-- pagar naquele produto. Ordene o resultado primeiramente pelo nome do cliente
-- e depois pelo nome do produto. Utilize aliases para nomear as colunas.
-- -----------------------------------------------------------------------------





-- -----------------------------------------------------------------------------
-- QUESTÃO 9: Escreva uma consulta para exibir o código e o nome do produto que
-- nenhum cliente comprou. Utilize aliases para nomear as colunas.
-- -----------------------------------------------------------------------------





-- -----------------------------------------------------------------------------
-- QUESTÃO 10: Escreva uma consulta para exibir o nome do cliente, a quantidade
-- total de produtos que ele comprou e o valor total que ele deverá pagar pelos
-- produtos. Utilize aliases para nomear as colunas.
-- -----------------------------------------------------------------------------





