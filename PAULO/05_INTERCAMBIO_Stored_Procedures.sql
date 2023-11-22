﻿--------------------------------------------------------------
-- 05_INTERCAMBIO_Stored_Procedures.sql
-- Script com consultas utilizando o banco de dados INTERCAMBIO
-- Demonstra a utilização de Stored Procedures
--------------------------------------------------------------



-- Habilita o banco de dados INTERCAMBIO
USE INTERCAMBIO
GO



-- Lista o nome das tabelas disponíveis
SELECT name 
FROM sys.tables
GO



--------------------------------------------------------------
-- Demonstra o uso do Stored Procedures simples
--------------------------------------------------------------



-- Exibe informações sobre os stored procedures do banco de dados em uso
SELECT * FROM sys.procedures
GO



-- Criando um stored procedure que exibe "Alô mundo!"
CREATE PROCEDURE AloMundo 
AS
    PRINT 'Alô Mundo!'
GO



-- Utiliza o stored procedure ALOMUNDO
EXECUTE AloMundo
GO



-- Exibe informações sobre os stored procedures do banco de dados em uso
SELECT * FROM sys.procedures
GO



-- Exibe as informações dos alunos
SELECT * FROM Alunos
GO



-- Cria um stored procedure que seleciona os dados dos alunos do sexo masculino
CREATE PROCEDURE usp_AlunosMasculinos 
AS
    SELECT Cod_Aluno   AS 'Código do Aluno',
           Nome_Aluno  AS 'Nome do Aluno',
           Data_Nasc   AS 'Data de Nascimento',
           Endereco    AS 'Endereço',
           Telefone,
           Sexo,
           Pais_Origem AS 'Nacionalidade',
           Cod_Viagem  AS 'Código da Viagem'
    FROM Alunos
    WHERE Sexo = 'M'
GO



-- Utiliza o stored procedure USP_ALUNOSMASCULINOS
EXEC usp_AlunosMasculinos
GO



-- Exibe o nome, a data de criação e a data de modificação dos stored procedures
SELECT name        AS 'Procedure',
       create_date AS 'Data de Criação',
       modify_date AS 'Data de Alteração'
FROM sys.procedures
GO



-- Modifica o stored procedure ALOMUNDO
ALTER PROCEDURE AloMundo
AS
    PRINT 'Hello World!'
GO



-- Utiliza o stored procedure ALOMUNDO
EXECUTE AloMundo
GO


--------------------------------------------------------------
-- Demonstra o uso do Stored Procedures do sistema (extended)
--------------------------------------------------------------



-- Exemplo de uso de um stored procedure do sistema
-- No caso, XP_SUBDIRS exibe o conteúdo do drive C:
EXEC XP_SUBDIRS 'C:\'
GO



-- Exemplo de uso de um stored procedure do sistema
-- No caso, XP_FILEEXIST verifica a existência de um arquivo
EXEC XP_FILEEXIST 'E:\01_INTERCAMBIO_Cria_Banco.sql'
GO



-- Exibe uma lista com todos os stored procedures do sistema
-- https://www.dirceuresende.com/blog/as-procedures-estendidas-nao-documentadas-do-sql-server/
-- EXEC master.dbo.sp_helpextendedproc
EXEC SP_HELPEXTENDEDPROC
GO



--------------------------------------------------------------
-- Stored Procedures com parâmetros de entrada
--------------------------------------------------------------



-- Cria um stored procedure que exibe uma saudação para o nome passado como parâmetro
CREATE PROCEDURE usp_saudacao
    @nome VARCHAR(200)
AS
    PRINT 'Olá, ' + @nome + '!'
GO



-- Utiliza a stored procedure USP_SAUDACAO
EXEC usp_saudacao 'Paulo'
EXEC usp_saudacao 'Cris'
GO



-- Cria um stored procedure que calcula a soma de duas variáveis passadas como parâmetro.
-- Esse stored procedure retorna um valor através da variável 'soma', em OUTPUT.
CREATE PROCEDURE usp_soma
    @valor1 INT,
    @valor2 INT,
    @soma INT OUTPUT
AS
    SET @soma = @valor1 + @valor2
GO



-- Utiliza a stored procedure USP_SOMA
DECLARE @saida INT
EXEC usp_soma 5, 3, @saida OUTPUT
PRINT @saida
GO



-- Utiliza a stored procedure USP_SOMA
DECLARE @saida INT
EXEC usp_soma 100, 50, @saida OUTPUT
PRINT @saida
GO



-- Cria um stored procedure para descobrir o código do país passado como parâmetro
CREATE PROCEDURE usp_DescobreCodigoPais
    @Pais VARCHAR(255)
AS
    SET NOCOUNT ON
    SELECT  Cod_Pais  AS 'Código', 
            Nome_pais AS 'País' 
    FROM Paises
    WHERE Nome_pais = @Pais
    SET NOCOUNT OFF
GO



-- Utiliza a stored procedure USP_DESCOBRECODIGOPAIS
EXEC usp_DescobreCodigoPais 'Brasil'
EXEC usp_DescobreCodigoPais 'Turquia'
EXEC usp_DescobreCodigoPais 'Japão'
GO



-- Cria um stored procedure que fornece informações sobre os 
-- países cujo idioma faz parte do parâmetro passado
CREATE PROCEDURE usp_InfoIdiomasPaises
    @idioma VARCHAR(50)
AS
    SET NOCOUNT ON
    SELECT * FROM Paises
    WHERE Idioma_pais LIKE ('%' + @idioma + '%')
    SET NOCOUNT OFF
GO



-- Utiliza a stored procedure USP_INFOIDIOMASPAISES
EXEC usp_InfoIdiomasPaises 'Português'
EXEC usp_InfoIdiomasPaises 'hin'
GO



-- Cria um stored procedure que aceita um trecho do nome do aluno como parâmetro de entrada.
-- Ele busca informações de todas as tabelas e exibe as informações das viagens cadastradas 
-- para esses alunos.
CREATE PROCEDURE usp_BuscaDadosAlunos
    @nomeAluno AS VARCHAR(20)
AS
    SET NOCOUNT ON
    SELECT
        Viagens.Cod_Viagem AS 'Código da Viagem',
        Alunos.Nome_Aluno  AS 'Nome',
        Alunos.Telefone,
        Alunos.Sexo,
        (SELECT Nome_pais FROM Paises WHERE Cod_Pais = Alunos.Pais_Origem)   AS 'Origem',
        (SELECT Nome_pais FROM Paises WHERE Cod_Pais = Viagens.Pais_Destino) AS 'Destino',
        Viagens.Data_Saida   AS 'Data de Saída',
        Viagens.Data_Retorno AS 'Data de Retorno',
        Viagens.Valor        AS 'Preço da Viagem R$'
    FROM Alunos INNER JOIN Viagens
        ON Alunos.Cod_Viagem = Viagens.Cod_Viagem
    WHERE Alunos.Nome_Aluno LIKE '%' + @nomealuno + '%'
    ORDER BY Alunos.Nome_Aluno, Viagens.Pais_Destino
    SET NOCOUNT OFF
GO



-- Utiliza a stored procedure SP_BUSCADADOSALUNOS
EXEC usp_BuscaDadosAlunos 'P'
GO



EXEC usp_BuscaDadosAlunos 'Ana'
GO



EXEC usp_BuscaDadosAlunos 'Ana Mara'
GO



EXEC usp_BuscaDadosAlunos 'Silva'
GO



EXEC usp_BuscaDadosAlunos 'Luís'
GO



-- Exibe informações sobre o stored procedure USP_BUSCADADOSALUNOS.
EXEC SP_HELP usp_BuscaDadosAlunos
GO



-- Exibe os comandos do stored procedure passado como parâmetro.
-- Para isso, o stored procedure não deve ter sido criado com o parâmetro WITH ENCRYPTION.
EXEC SP_HELPTEXT usp_BuscaDadosAlunos
GO



-- Mostra uma listagem dos stored procedures existentes no banco de dados atual.
EXEC SP_STORED_PROCEDURES
GO



--------------------------------------------------------------
-- Stored Procedures com estruturas de decisão e loops
--------------------------------------------------------------



-- Exemplo de uso de IF-ELSE: criação de um stored procedure que 
-- retorna o maior de dois valores passados como parâmetros.
CREATE PROCEDURE usp_AchaMaior
    @valor1 FLOAT,
    @valor2 FLOAT
AS
    DECLARE @maior FLOAT
    IF (@valor1 > @valor2)
        SET @maior = @valor1
    ELSE
        SET @maior = @valor2
    PRINT 'Maior valor entre ' + CAST(@valor1 AS VARCHAR) + 
          ' e ' + CAST(@valor2 AS VARCHAR) + 
          ' é: ' + CAST(@maior AS VARCHAR)
GO



-- Utiliza a stored procedure USP_ACHAMAIOR
EXEC usp_AchaMaior 5, 8
EXEC usp_AchaMaior 1.356, 8.6352
GO



-- Cria um stored procedure que informa a quantidade de países 
-- que possuem o idioma passado como parâmetro.
CREATE PROCEDURE usp_ContaIdiomas
    @idioma VARCHAR(50)
AS
    DECLARE @mensagemOk VARCHAR(100)
    DECLARE @mensagemErro VARCHAR(100)
    DECLARE @total INT

    SET @mensagemOK = 'Quantidade de registros encontrados para o idioma ' + @idioma + ': '
    SET @mensagemErro = 'Erro: nenhuma ocorrência foi encontrada para o idioma ' + @idioma + '!'

    SET @total = (SELECT COUNT(*) FROM Paises WHERE Idioma_pais LIKE ('%' + @idioma + '%'))

    IF (@total > 0)
        PRINT @mensagemOK + CAST(@total AS VARCHAR)
    ELSE
        PRINT @mensagemErro
GO



-- Utiliza a stored procedure USP_CONTAIDIOMAS
EXEC usp_ContaIdiomas 'Inglês'
EXEC usp_ContaIdiomas 'Japonês'
EXEC usp_ContaIdiomas 'Malgaxe'
EXEC usp_ContaIdiomas 'Americano'
GO



-- Cria um stored procedure que calcula a idade do aluno passado como parâmetro.
CREATE PROCEDURE usp_CalculaIdadeAluno
    @nome AS CHAR(20)
AS
    SET NOCOUNT ON
    DECLARE @data_nascimento DATETIME
    DECLARE @idade INT
    DECLARE @data_atual DATETIME

    SET @data_atual = (SELECT GETDATE())
    SET @data_nascimento = (SELECT Data_Nasc FROM Alunos WHERE Nome_Aluno = @nome)

    SET @idade = DATEDIFF(YEAR, @data_nascimento, @data_atual) - CASE 
                 WHEN @data_atual < DATEADD(YEAR, DATEDIFF(YEAR, @data_nascimento, @data_atual), @data_nascimento) 
                    THEN 1 
                    ELSE 0 
                 END

    SELECT @nome  AS 'Nome do Aluno',
           @idade AS 'Idade do Aluno'

    SET NOCOUNT OFF
GO



-- Utiliza a stored procedure USP_CALCULAIDADEALUNO
EXEC usp_CalculaIdadeAluno 'Maria Cristina'
EXEC usp_CalculaIdadeAluno 'Jair Lopes'
EXEC usp_CalculaIdadeAluno 'Miguel Firmino'
GO



--------------------------------------------------------------
-- Stored Procedures com parâmetros de saída
--------------------------------------------------------------



-- Cria um stored procedure que informa o valor médio das viagens
-- para o país passado como parâmetro
CREATE PROCEDURE usp_MediaViagens
    @pais VARCHAR(50),
    @media MONEY OUTPUT
AS
    SET @media = (SELECT AVG( Valor) AS 'Média dos Valores' 
                  FROM Viagens 
                  WHERE Pais_Destino = (SELECT Cod_Pais 
                                        FROM Paises 
                                        WHERE Nome_pais = @pais))
GO



-- Utiliza a stored procedure USP_MEDIAVIAGENS
DECLARE @pais VARCHAR(50) = 'Estados Unidos da América'
DECLARE @resultado MONEY
EXEC usp_MediaViagens @pais, @resultado OUTPUT
PRINT  'Custo médio das viagens realizadas para o ' + @pais + ': R$ ' + CAST(@resultado AS VARCHAR)
GO



--------------------------------------------------------------
-- Removendo Stored Procedures
--------------------------------------------------------------



-- Exclui o stored procedure USP_SAUDACAO -> DROP
DROP PROCEDURE usp_saudacao
GO



-- Tenta utilizar um Stored Procedure que não existe
EXEC usp_saudacao
GO



-- Exibe o nome, a data de criação e a data de modificação dos stored procedures
SELECT name        AS 'Procedure',
       create_date AS 'Data de Criação',
       modify_date AS 'Data de Alteração'
FROM sys.procedures
GO



-- Exibe informações sobre os Stored Procedures do banco de dados em uso
SELECT name        AS 'Stored Procedure', 
       definition  AS 'Definição', 
       type_desc   AS 'Tipo' 
FROM sys.sql_modules M INNER JOIN sys.objects O 
    ON M.object_id = O.object_id
WHERE type_desc LIKE '%procedure%'
GO



--------------------------------------------------------------
-- Exemplo de UDFs escalares
--------------------------------------------------------------



-- Lista o nome das tabelas disponíveis
SELECT name 
FROM sys.tables
GO



-- Cálculo de fatorial (SQL Server Express Edition - Augusto Manzano)
CREATE FUNCTION fatorial (@N INT) 
    RETURNS BIGINT 
AS
    BEGIN
        DECLARE @fator BIGINT, 
                @i INT
        SET @fator = 1
        SET @i = 1
        IF (@N <= 1)
            RETURN @fator
        ELSE
            WHILE (@I <= @N)
                BEGIN
                    SET @fator = @fator * @i
                    SET @i = @i + 1 
                END
        RETURN @fator
    END
GO



-- Utilização da função FATORIAL
SELECT dbo.fatorial(20) AS 'Fatorial de 20',
       dbo.fatorial(5)  AS 'Fatorial de 5'
GO



-- Outro modo de chamar a função FATORIAL
PRINT dbo.fatorial(10)
GO



-- Exibe os dados das viagens dos alunos
SELECT A.Cod_Aluno    AS 'Código do Aluno',
       A.Nome_Aluno   AS 'Nome do Aluno',
       A.Sexo,
       A.Endereco     AS 'Endereço',
       A.Pais_Origem  AS 'Origem',
       V.Pais_Destino AS 'Destino',
       V.Valor        AS 'Custo R$'
FROM Alunos A INNER JOIN Viagens V
    ON A.Cod_Viagem = V.Cod_Viagem
GO



-- Criando uma função para alinhar o campo 'Valor'
-- @texto = campo cujo valores serão alinhados
-- @tamanho = quantidade de vezes que o caractere será replicado
-- @caractere = caractere que será replicado
CREATE FUNCTION sf_alinhaCampo(@texto VARCHAR(255), @tamanho TINYINT, @caractere CHAR(1))
    RETURNS VARCHAR(255) 
AS
    BEGIN
          DECLARE @resultado VARCHAR(255)
          SET @resultado = REPLICATE(@caractere, @tamanho - LEN(@texto)) + @texto
          RETURN @resultado
    END
GO



-- Exibe os dados das viagens dos alunos, utilizando a função SF_ALINHACAMPO,
-- para formatar o resultado da consulta
SELECT dbo.sf_alinhaCampo(A.Cod_Aluno, 2, 0) AS 'Código do Aluno',
       A.Nome_Aluno   AS 'Nome do Aluno',
       A.Sexo,
       A.Endereco     AS 'Endereço',
       A.Pais_Origem  AS 'Origem',
       V.Pais_Destino AS 'Destino',
       dbo.sf_alinhaCampo(CAST(V.Valor AS VARCHAR), 10, 0) AS 'Custo R$'
FROM Alunos A INNER JOIN Viagens V
    ON A.Cod_Viagem = V.Cod_Viagem
GO



-- Cria uma função que recebe a sigla de um país e retorna seu nome
CREATE FUNCTION sf_descobreNomePais (@sigla CHAR(3))
    RETURNS VARCHAR(50) 
AS
    BEGIN
        DECLARE @resposta VARCHAR(50)
        SET @resposta = (SELECT Nome_Pais FROM Paises WHERE cod_Pais = @sigla)
        RETURN @resposta
    END
GO



-- Utiliza a função para descobrir o nome do país passado como parâmetro
SELECT dbo.sf_descobreNomePais('BRA') AS 'País'
GO



-- Exibe os dados das viagens dos alunos, utilizando a função SF_ALINHACAMPO,
-- para formatar o resultado da consulta
SELECT A.Cod_Aluno    AS 'Código do Aluno',
       A.Nome_Aluno   AS 'Nome do Aluno',
       A.Sexo,
       A.Endereco     AS 'Endereço',
       A.Pais_Origem  AS 'Código da Origem',
       dbo.sf_descobreNomePais(A.Pais_Origem)  AS 'Origem',
       V.Pais_Destino AS 'Código do Destino',
       dbo.sf_descobreNomePais(V.Pais_Destino) AS 'Destino',
       V.Valor        AS 'Custo R$'
FROM Alunos A INNER JOIN Viagens V
    ON A.Cod_Viagem = V.Cod_Viagem
GO



--------------------------------------------------------------
-- Exemplo de UDFs inline (SELECT com parâmetros...)
--------------------------------------------------------------



-- Cria uma função que recebe como parâmetro o código do país.
-- Ela retorna uma consulta com os dados das viagens para esse país. 
-- Esse tipo de função recebe o nome de UDF inline
CREATE FUNCTION sf_exibeViagensPais (@sigla CHAR(3)) 
    RETURNS TABLE
AS
    RETURN
        SELECT V.Cod_Viagem   AS 'Código da Viagem',
               P.Nome_pais + ' (' +  V.Pais_Destino + ')' AS 'Destino',
               P.Idioma_pais  AS 'Idioma',
               V.Data_Saida   AS 'Saída',
               V.Data_Retorno AS 'Retorno',
               V.Valor        AS 'Valor R$'
        FROM Paises P INNER JOIN Viagens V
            ON P.Cod_Pais = V.Pais_Destino
                WHERE V.Pais_Destino = @sigla
GO



-- Tenta utilizar a função SF_EXIBEVIAGENSPAIS
-- Essa sintaxe não funciona, pois uma UDF inline funciona 
-- como se fosse uma tabela
SELECT dbo.sf_exibeViagensPais('USA')
GO



-- Utilizando a função SF_EXIBEVIAGENSPAIS
SELECT * FROM dbo.sf_exibeViagensPais('USA')
GO



-- Utilizando a função SF_EXIBEVIAGENSPAIS
SELECT * FROM dbo.sf_exibeViagensPais('MEX')
GO



-- Utilizando a função SF_EXIBEVIAGENSPAIS
-- No caso, seleciona apenas campos específicos
SELECT [Código da Viagem],
       Destino,
       [Valor R$]
FROM dbo.sf_exibeViagensPais('MEX')
GO



--------------------------------------------------------------
-- Exemplo de UDFs que retornam tabelas -> Multi-Statement
--------------------------------------------------------------



-- Cria uma função que retorna somente os dados das viagens cuja
-- data de saída é posterior a data passada como parâmetro.
CREATE FUNCTION sf_ViagensFuturas (@data DATE)
    RETURNS @viagens_futuras TABLE (Codigo INT, 
                                    Saida DATE, 
                                    Retorno DATE, 
                                    Destino VARCHAR(50))
AS
    BEGIN
        INSERT INTO @viagens_futuras
        SELECT V.Cod_Viagem, V.Data_Saida, V.Data_Retorno, P.Nome_pais
        FROM Viagens V INNER JOIN Paises P
            ON V.Pais_Destino = P.Cod_Pais
        WHERE V.Data_Saida > @data
        RETURN
    END
GO



-- Altera o formato de data e hora -> Brasil
SET DATEFORMAT DMY
GO



-- Utilizando a função SF_VIAGENSFUTURAS
-- Retornando todas as viagens que serão realizadas a partir de janeiro de 2011.
SELECT * FROM sf_ViagensFuturas('01-01-2011')
GO



SELECT * FROM sf_ViagensFuturas('01-02-2011')
GO



-- Altera o formato de data e hora -> Inglês
SET DATEFORMAT MDY
GO



-- Exibe informações sobre as UDFs do banco de dados em uso
SELECT name        AS 'Nome da Função', 
       definition  AS 'Definição', 
       type_desc   AS 'Tipo' 
FROM sys.sql_modules M INNER JOIN sys.objects O 
    ON M.object_id = O.object_id
WHERE type_desc LIKE '%function%'
GO



--------------------------------------------------------------
-- Deletando funções
--------------------------------------------------------------



-- Exclui a função FATORIAL
DROP FUNCTION fatorial
GO



-- Tenta utilizar a função FATORIAL
SELECT dbo.fatorial(5)  AS 'Fatorial de 5'
GO