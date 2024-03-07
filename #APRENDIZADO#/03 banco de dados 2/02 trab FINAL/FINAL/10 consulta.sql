USE ProjAcoes
GO

--CRIA A TABELA login	
CREATE TABLE LOGIN(
	ID			INT IDENTITY(1,1) PRIMARY KEY,
	UsuarioID	INT FOREIGN KEY REFERENCES USUARIO(ID),
	Usuario		VARCHAR(16),
	Senha		VARCHAR(64)
)
GO

--CRIA A TABELA USUARIO
CREATE TABLE USUARIO(
	ID		INT IDENTITY(1,1) PRIMARY KEY,
	Nome		VARCHAR(50),
	Endereco	VARCHAR(50),
	Numero		VARCHAR(10),
	Bairro		VARCHAR(40),
	Cidade		VARCHAR (40),
	CEP		VARCHAR(8),
	CPF		VARCHAR(11),
	Email		VARCHAR (50),
	Sexo		VARCHAR(1),
	Celular		VARCHAR(15),
	Telefone	VARCHAR(15),
	CONSTRAINT AK_CPF UNIQUE(CPF)
	)
GO

--INSERE DADOS NA TABELA PAPEL
INSERT INTO PAPEL(
	ID,
	Acao,
	Quantidade,
	Valor)
VALUES (1,'TAEE11', 75, 35.22)
GO

SELECT * FROM LOGIN
GO

SELECT * FROM USUARIO
GO

SELECT * FROM PAPEL
GO

------------------------------------------------------------------------------


--01 Selecionar todos os usuários:
SELECT * FROM USUARIO;


--02 Selecionar todos os logins:
SELECT * FROM LOGIN;


--03 Selecionar um usuário específico pelo ID:
SELECT * FROM USUARIO WHERE ID = 1; -- substitua 1 pelo ID desejado

--04 Selecionar o login de um usuário específico pelo ID do usuário:
SELECT * FROM LOGIN WHERE UsuarioID = 1; -- substitua 1 pelo ID desejado

--05 Consultar todos os dados da tabela PAPEL:
SELECT * FROM PAPEL;
GO

--06 Consultar ações específicas (por exemplo, ‘TAEE11’):
SELECT * FROM PAPEL WHERE Acao = 'TAEE11';
GO

--07 Atualizar o valor de uma ação específica:
UPDATE PAPEL SET Valor = 36.00 WHERE Acao = 'TAEE11';
GO

--08 Deletar uma ação específica:
DELETE FROM PAPEL WHERE Acao = 'TAEE11';
GO

--09 Consultar ações com valor acima de um certo limite (por exemplo, 30.00):
SELECT * FROM PAPEL WHERE Valor > 30.00;
GO

--10 Esta consulta irá retornar a média dos valores das ações na tabela PAPEL:
SELECT AVG(Valor) as 'Valor Médio' FROM PAPEL;
GO