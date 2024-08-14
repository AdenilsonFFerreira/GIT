import pyodbc
import hashlib

# String de conexão
conn_str = (
    r'Driver={SQL Server};'
    r'Server=SNVME\SQLEXPRESS;'
    r'Database=ProjAcoes;'
    r'Trusted_Connection=yes;'
)

# Conectar ao banco de dados
conn = pyodbc.connect(conn_str)

# Criar um cursor
cursor = conn.cursor()

# Usuário e senha
usuario = 'admin'
senha = 'admin'

# Criptografar a senha
senha = hashlib.sha256(senha.encode()).hexdigest()

# Comando SQL para inserir o usuário
sql_command = f"""
INSERT INTO LOGIN (Usuario, Senha, TipoUsuario)
VALUES ('{usuario}', '{senha}', 'admin');
"""

# Executar o comando SQL
cursor.execute(sql_command)

# Confirmar as alterações
conn.commit()

# Fechar a conexão
conn.close()
