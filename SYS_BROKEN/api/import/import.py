import pandas as pd
import pyodbc

# Sua string de conexão
connection_string = "DRIVER={SQL Server};SERVER=SNVME\\SQLEXPRESS;DATABASE=ProjAcoes;Trusted_Connection=yes;"

# Conexão com o banco de dados SQL Server usando a string de conexão fornecida
conn = pyodbc.connect(connection_string)

# Consulta SQL para selecionar apenas a coluna Acao da tabela PAPEL
query_select_acao = 'SELECT Acao FROM PAPEL'

# Utilizando pandas para executar a consulta e armazenar o resultado em um DataFrame
df_acao = pd.read_sql(query_select_acao, conn)

# Adicionando '.sa' após cada valor na coluna 'Acao'
df_acao['Acao'] = df_acao['Acao'] + '.sa'

# Exportando a coluna Acao modificada para um arquivo CSV na pasta especificada
df_acao.to_csv(r'C:\SysBroken\api\papel.csv', index=False)

# Fechando a conexão com o banco de dados
conn.close()



'''
# Se preferir exportar para um arquivo Excel, use:
df_acao.to_excel(r'C:\SysBroken\api\papel.xlsx', index=False)

# Se preferir exportar para um arquivo Excel, use:
# df.to_excel('dados_papel.xlsx', index=False)

# Exemplo de como inserir dados na tabela PAPEL
query_insert = """
INSERT INTO PAPEL (Acao, Quantidade, Valor, Total, Data_Compra)
VALUES (?, ?, ?, ?, GETDATE())
"""

# Dados a serem inseridos
dados = ('PETR4', 100, 28.44, 2844.0)

# Executando a query de inserção
cursor = conn.cursor()
cursor.execute(query_insert, dados)
conn.commit()

# Fechando a conexão com o banco de dados
conn.close()
'''
