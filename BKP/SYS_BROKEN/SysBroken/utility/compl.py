import pandas as pd
import pyodbc
import requests
import concurrent.futures

# Função para obter dados de preços de uma ação
def get_stock_data(action):
    # URL da API Alpha Vantage
    url = f'https://www.alphavantage.co/query?function=TIME_SERIES_DAILY&symbol={action}&apikey={API_KEY}'

    # Fazendo a requisição para a API
    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
    except requests.exceptions.RequestException as e:
        print(f"Erro ao fazer a requisição para a ação {action}: {e}")
        return None

    # Verificando se a resposta contém a chave 'Meta Data'
    if 'Meta Data' not in data:
        print(f"Erro ao buscar dados para a ação {action}: {data.get('Note', data)}")
        return None

    try:
        # Extraindo a data mais recente
        last_refreshed = data['Meta Data']['3. Last Refreshed']
        # Obtendo o preço de abertura da data mais recente
        opening_price = data['Time Series (Daily)'][last_refreshed]['1. open']
        # Retornando um dicionário com os dados extraídos
        return {'Última Atualização': last_refreshed, 'Preço de Abertura': opening_price}
    except KeyError as e:
        print(f"Erro ao processar dados para a ação {action}: {e}")
        return None

# Conexão com o banco de dados SQL Server
connection_string = "DRIVER={SQL Server};SERVER=SNVME\\SQLEXPRESS;DATABASE=ProjAcoes;Trusted_Connection=yes;"
conn = pyodbc.connect(connection_string)

# Consulta SQL para selecionar apenas a coluna Acao da tabela PAPEL
query_select_acao = 'SELECT Acao FROM PAPEL'

# Utilizando pandas para executar a consulta e armazenar o resultado em um DataFrame
df_acao = pd.read_sql(query_select_acao, conn)

# Adicionando '.sa' após cada valor na coluna 'Acao'
df_acao['Acao'] = df_acao['Acao'] + '.sa'

# Criando um pool de threads para paralelizar as requisições à API
with concurrent.futures.ThreadPoolExecutor(max_workers=10) as executor:
    # Atualizando o DataFrame com os dados de preços de cada ação
    for index, row in df_acao.iterrows():
        action = row['Acao']
        future = executor.submit(get_stock_data, action)
        try:
            stock_data = future.result()
            if stock_data:
                df_acao.at[index, 'Última Atualização'] = stock_data['Última Atualização']
                df_acao.at[index, 'Preço de Abertura'] = stock_data['Preço de Abertura']
        except Exception as e:
            print(f"Erro ao processar dados para a ação {action}: {e}")

# Salvar o DataFrame
