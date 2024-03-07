--------------------------------------------------------------
-- 04_INTERCAMBIO_SQL_Procedural.sql
-- Script com consultas utilizando o banco de dados INTERCAMBIO
-- Demonstra a utilização de sequências e de SQL Procedural
--------------------------------------------------------------



-- Habilita o banco de dados INTERCAMBIO
USE INTERCAMBIO
GO



--------------------------------------------------------------
-- Demonstra o uso do IDENTITY
--------------------------------------------------------------



-- Cria uma tabela para testes



-- Tabela AERONAVES
CREATE TABLE AERONAVES (
    Cod_Aeronave INT IDENTITY PRIMARY KEY,
    Modelo VARCHAR(50) NOT NULL
)
GO



-- Insere algumas aeronaves
INSERT INTO AERONAVES VALUES 
    ('Boeing 707'),
    ('Boeing 737'),
    ('Boeing 747'),
    ('Embraer ERJ-145'),
    ('Vickers VC-10')
GO



-- Exibe os dados das aeronaves
SELECT * FROM AERONAVES
GO



-- Tenta inserir uma nova aeronave,
-- fornecendo o valor de um campo IDENTITY
INSERT INTO AERONAVES (Cod_Aeronave, Modelo) VALUES 
    (6, 'Airbus A300')
GO



-- Permite inserir valores explícitos na coluna 
-- de identidade de uma tabela
SET IDENTITY_INSERT AERONAVES ON 
GO



-- Tenta inserir uma nova aeronave,
-- fornecendo o valor de um campo IDENTITY
INSERT INTO AERONAVES (Cod_Aeronave, Modelo) VALUES 
    (6, 'Airbus A300')
GO



-- Exibe os dados das aeronaves
SELECT * FROM AERONAVES
GO



-- Altera o valor de IDENTITY_INSERT
SET IDENTITY_INSERT AERONAVES OFF 
GO



-- Tabela VEICULOS
-- Utiliza um IDENTITY começando em 1 e com incremento 10
CREATE TABLE VEICULOS (
    Codigo INT IDENTITY(1, 10) PRIMARY KEY,
    Modelo VARCHAR(50) NOT NULL
)
GO



-- Insere alguns veículos
INSERT INTO VEICULOS VALUES
    ('Ferrari'),
    ('Camaro'),
    ('Fusca')
GO



-- Exibe os dados
SELECT * FROM VEICULOS
GO



-- Exibe o valor do incremento utilizado na tabela
SELECT IDENT_INCR('AERONAVES') AS 'Inc. AERONAVES',
       IDENT_INCR('VEICULOS')  AS 'Inc. VEICULOS'  
GO 



-- Exibindo o último valor de IDENTITY que foi utilizado
SELECT @@IDENTITY AS 'Último IDENTITY',
       IDENT_CURRENT('VEICULOS')  AS 'IDENTITY - VEICULOS',
       IDENT_CURRENT('AERONAVES') AS 'IDENTITY - AERONAVES'
GO 



--------------------------------------------------------------
-- Demonstra o uso do SEQUENCE
--------------------------------------------------------------



-- Cria uma sequência que começa em 1, com incremento 1
CREATE SEQUENCE Incrementa1 AS INT 
    START WITH 1
    INCREMENT BY 1
GO



-- Cria uma sequência que começa em 10, com incremento 100
CREATE SEQUENCE Incrementa100 AS INT 
    START WITH 10
    INCREMENT BY 100
GO



-- Cria uma sequência que começa em 1000, com incremento -100
CREATE SEQUENCE Incrementa1000 AS INT 
    START WITH 1000
    INCREMENT BY -100
GO



-- Exibe informações sobre as sequências
SELECT name          AS 'Nome',
       create_date   AS 'Data de Criação',
       start_value   AS 'Valor Inicial',
       increment     AS 'Incremento',
       minimum_value AS 'Valor Mínimo',
       maximum_value AS 'Valor Máximo',
       current_value AS 'Valor Atual'
FROM SYS.sequences 
GO 



-- Criando uma sequência com mais parâmetros
CREATE SEQUENCE IncrementaDecimal AS DECIMAL(3,0)
    START WITH 125  
    INCREMENT BY 25  
    MINVALUE 100  
    MAXVALUE 200  
    CYCLE  
    CACHE 3  
GO



-- Exibe o primeiro valor das sequências
SELECT NEXT VALUE FOR Incrementa1       AS 'Incrementa1',
       NEXT VALUE FOR Incrementa100     AS 'Incrementa100',
       NEXT VALUE FOR Incrementa1000    AS 'Incrementa1000',
       NEXT VALUE FOR IncrementaDecimal AS 'IncrementaDecimal'
GO  



-- Cria uma tabela temporária, para ilustrar a utilização das sequências
CREATE TABLE #TestaSequencia (
    ID INT,
    Nome CHAR(20)
)
GO



-- Reiniciando o valor de uma sequência
ALTER SEQUENCE Incrementa100 RESTART WITH 10
GO



-- Utiliza a sequência INCREMENTA100 para inserir
-- valores na tabela #TestaSequencia
INSERT INTO #TestaSequencia (ID, Nome) VALUES
    (NEXT VALUE FOR Incrementa100, 'Ana'),
    (NEXT VALUE FOR Incrementa100, 'Maria'),
    (NEXT VALUE FOR Incrementa100, 'João')
GO



-- Exibe os valores
SELECT * FROM #TestaSequencia
GO



-- Recuperando o valor atual de uma sequência
SELECT current_value AS 'Valor Atual' 
FROM SYS.sequences
WHERE name = 'Incrementa100'
GO



-- Remove uma sequência
DROP SEQUENCE Incrementa100
GO



-- Tenta inserir um registro utilizando a sequência INCREMENTA100
INSERT INTO #TestaSequencia (ID, Nome) VALUES
    (NEXT VALUE FOR Incrementa100, 'José')
GO



--------------------------------------------------------------
-- Demonstra a declaração de variáveis
--------------------------------------------------------------



-- Declara uma variável
DECLARE @nome AS VARCHAR(100)

-- Atribui um valor
SET @nome = 'Carlos Pereira'

-- Utiliza a variável em uma consulta SQL
SELECT Cod_Aluno  AS 'Código',
       Nome_Aluno AS 'Nome do Aluno',
       Endereco   AS 'Endereço'
FROM Alunos
WHERE Nome_Aluno LIKE @nome
GO



-- Atribui um valor para uma variável durante a sua declaração
DECLARE @nome AS VARCHAR(100) = 'Carlos Pereira'

-- Utiliza a variável em uma consulta SQL
SELECT Cod_Aluno  AS 'Código',
       Nome_Aluno AS 'Nome do Aluno',
       Endereco   AS 'Endereço'
FROM Alunos
WHERE Nome_Aluno LIKE @nome
GO



-- Atribui um valor para uma variável utilizando um SELECT  
DECLARE @rows AS INT 
 
SET @rows = (SELECT COUNT(*) FROM Viagens)

SELECT @rows AS 'Total de Viagens'
GO 



--------------------------------------------------------------
-- Demonstra a declaração de IF-ELSE
--------------------------------------------------------------



-- Declara as variáveis
DECLARE @A AS INT = 10,
        @B AS INT = 100,
        @maior AS INT
    
-- Verifica qual é o maior valor
IF @A > @B
    SET @maior = @A
ELSE
    SET @maior = @B

-- Exibe o maior valor
PRINT 'O maior valor é: ' + CAST(@maior AS VARCHAR)
GO



-- Techo que verifica se um número é par
DECLARE @numero AS INT = 240

IF ((@numero % 2) = 0)
    PRINT 'O número ' + CAST(@numero AS VARCHAR) + ' é par!'
ELSE
    PRINT 'O número ' + CAST(@numero AS VARCHAR) + ' é ímpar!'
GO



-- Consulta para exibir se um aluno é homem ou mulher
-- Essa construção é incorreta
SELECT Cod_Aluno  AS 'Código',
       Nome_Aluno AS 'Nome do Aluno',
       Endereco   AS 'Endereço',
       Sexo,
       IF Sexo = 'F'
           SELECT 'Mulher'
       ELSE
           SELECT 'Homem'
       END AS 'Homem | Mulher'
FROM Alunos
GO



--------------------------------------------------------------
-- Demonstra a declaração de SELECT CASE-WHEN-THEN
--------------------------------------------------------------



-- Consulta para exibir se um aluno é homem ou mulher
SELECT Cod_Aluno  AS 'Código',
       Nome_Aluno AS 'Nome do Aluno',
       Endereco   AS 'Endereço',
       Sexo,
       CASE Sexo 
           WHEN 'M' THEN 'Homem'
           WHEN 'F' THEN 'Mulher'
           ELSE 'Não declarado'
       END AS 'Tipo de Sexo'
FROM Alunos
GO



--------------------------------------------------------------
-- Demonstra a utilização de WHILE
--------------------------------------------------------------



-- Exemplo de um contador básico utilizando WHILE
DECLARE @i AS INT

SET @i = 1

WHILE @i <= 10 
    BEGIN
        PRINT 'Valor de i: ' + CAST(@i AS CHAR)
        SET @i = @i + 1
    END
GO




-- Criação de tabuada com WHILE
DECLARE @quantidade AS INT = 5, 
        @total      AS INT = 1,
        @contador   AS INT,
        @limite     AS INT = 3

-- Loop que controla o total de tabuadas
WHILE @total <= @quantidade
    BEGIN
        -- Imprime um cabeçalho
        PRINT 'Tabuada do ' + CAST(@total AS VARCHAR(5))
        PRINT REPLICATE('-', 13)
                
        -- Define o valor inicial para cada tabuada
        SET @contador = 0    
        
        -- Loop que controla a criação da tabuada
        WHILE @contador <= @limite
            BEGIN
                -- Imprime a tabuada
                PRINT CAST(@total AS VARCHAR(5)) 
                      + ' X ' 
                      + CAST(@contador AS VARCHAR(5)) 
                      + ' = ' 
                      + CAST((@total * @contador) AS VARCHAR(5))
                -- Atualiza o multiplicador
                SET @contador += 1
            END

        -- Atualiza a variável que controla a quantidade de tabuadas
        SET @total += 1

        -- Imprime uma linha em branco
        PRINT ''
    END
GO



