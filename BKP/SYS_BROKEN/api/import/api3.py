import pandas as pd
import requests

# Sua chave de API da Alpha Vantage
api_key = '5N97PQ11HSS38K53'

# Função da API para preços diários
function = 'TIME_SERIES_DAILY'

# Caminho para o arquivo CSV
csv_file = 'C:\\SysBroken\\api\\papel.csv'

try:
    # Ler o arquivo CSV
    df = pd.read_csv(csv_file)
    print("Dados carregados com sucesso do arquivo CSV.")
except Exception as e:
    print(f"Erro ao ler o arquivo CSV: {e}")
    exit()

# Verificar se a coluna 'Acao' existe no DataFrame
if 'Acao' not in df.columns:
    print("A coluna 'Acao' não foi encontrada no arquivo CSV.")
    exit()

# Adicionar colunas para armazenar o preço de abertura e a data da última atualização
df['Última Atualização'] = ''
df['Preço de Abertura'] = ''

# Iterar sobre cada ação no DataFrame
for index, row in df.iterrows():
    action = row['Acao']
    # URL da API
    url = f'https://www.alphavantage.co/query?function={function}&symbol={action}&apikey={api_key}'

    # Fazendo a requisição para a API
    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
    except requests.exceptions.RequestException as e:
        print(f"Erro ao fazer a requisição para a ação {action}: {e}")
        continue

    # Verificando se a resposta contém a chave 'Meta Data'
    if 'Meta Data' in data:
        try:
            # Extraindo a data mais recente
            last_refreshed = data['Meta Data']['3. Last Refreshed']
            # Obtendo o preço de abertura da data mais recente
            opening_price = data['Time Series (Daily)'][last_refreshed]['1. open']
            # Atualizando o DataFrame com os valores obtidos
            df.at[index, 'Última Atualização'] = last_refreshed
            df.at[index, 'Preço de Abertura'] = opening_price
        except KeyError as e:
            print(f"Erro ao processar dados para a ação {action}: {e}")
    else:
        print(f"Erro ao buscar dados para a ação {action}: {data.get('Note', data)}")

# Salvar o DataFrame atualizado de volta para o arquivo CSV
try:
    df.to_csv('acoes_atualizadas.csv', index=False)
    print("Dados atualizados e salvos no arquivo 'acoes_atualizadas.csv'")
except Exception as e:
    print(f"Erro ao salvar o arquivo CSV: {e}")
