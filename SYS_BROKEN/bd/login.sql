--EXIBE O NOME DO BANCO DE DADOS QUE EXISTE NO SERVIDOR
SELECT name
FROM sys.databases
GO

USE ProjAcoes
GO

DROP TABLE LOGIN

CREATE TABLE LOGIN(
	ID			INT IDENTITY(1,1) PRIMARY KEY,
	UsuarioID	INT FOREIGN KEY REFERENCES USUARIO(ID),
	Usuario		VARCHAR(16),
	Senha		VARCHAR(64),
	TipoUsuario	VARCHAR(16),
	Foto		VARCHAR(MAX)
)
GO

SELECT * FROM USUARIO
GO


SELECT ID FROM USUARIO WHERE Nome = 'administrador';


---------------------------------------------------------------------------
-- Insere um novo usuário do tipo 'Admin' na tabela LOGIN
INSERT INTO LOGIN (Usuario, Senha, TipoUsuario)
VALUES ('admin', 'admin', 'admin');
---------------------------------------------------------------------------
INSERT INTO LOGIN (Usuario, Senha, TipoUsuario)
VALUES ('admin', CONVERT(NVARCHAR(64), HASHBYTES('SHA2_256', 'admin'), 2), 'admin');

INSERT INTO LOGIN (ID, UsuarioID, Usuario, Senha, TipoUsuario)
VALUES ('1', 'UsuarioID_aqui', 'admin', CONVERT(NVARCHAR(64), HASHBYTES('SHA2_256', 'admin'), 2), 'admin');

INSERT INTO LOGIN (UsuarioID, Usuario, Senha, TipoUsuario)
VALUES (1, 'admin', CONVERT(NVARCHAR(64), HASHBYTES('SHA2_256', 'admin'), 2), 'admin');



---------------------------------------------------------------------------


SELECT * FROM LOGIN
GO

ALTER TABLE LOGIN
ALTER COLUMN Senha VARCHAR(256)

ALTER TABLE LOGIN
ALTER COLUMN Foto VARCHAR(MAX);

SELECT UsuarioID FROM LOGIN WHERE UsuarioID = (SELECT ID FROM USUARIO WHERE Email = 'adenilson.ff@outlook.com')


UPDATE LOGIN
SET UsuarioID = (SELECT ID FROM USUARIO WHERE Email = 'adenilson.ff@outlook.com')
WHERE Usuario = 'ade'
