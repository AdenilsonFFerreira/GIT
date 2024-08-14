import pandas as pd
import requests

# Sua chave de API da Alpha Vantage
api_key = '5N97PQ11HSS38K53'

# Função da API para preços diários
function = 'TIME_SERIES_DAILY'

# Caminho para o arquivo Excel
excel_file = 'acoes.xlsx'

try:
    # Listar os nomes das planilhas no arquivo Excel
    xls = pd.ExcelFile(excel_file)
    print("Planilhas disponíveis:", xls.sheet_names)
    
    # Ler o arquivo Excel (substitua 'Planilha2' pelo nome correto da sua planilha)
    df = pd.read_excel(excel_file, sheet_name='Planilha2')
except Exception as e:
    print(f"Erro ao ler o arquivo Excel: {e}")
    exit()

# Verificar se a coluna 'Símbolo' existe no DataFrame
if 'Símbolo' not in df.columns:
    print("A coluna 'Símbolo' não foi encontrada no arquivo Excel.")
    exit()

# Adicionar colunas para armazenar o preço de abertura e a data da última atualização
df['Última Atualização'] = ''
df['Preço de Abertura'] = ''

# Iterar sobre cada símbolo de ação no DataFrame
for index, row in df.iterrows():
    symbol = row['Símbolo']
    # URL da API
    url = f'https://www.alphavantage.co/query?function={function}&symbol={symbol}&apikey={api_key}'

    # Fazendo a requisição para a API
    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
    except requests.exceptions.RequestException as e:
        print(f"Erro ao fazer a requisição para a ação {symbol}: {e}")
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
            print(f"Erro ao processar dados para a ação {symbol}: {e}")
    else:
        print(f"Erro ao buscar dados para a ação {symbol}: {data.get('Note', data)}")

# Salvar o DataFrame atualizado de volta para o arquivo Excel
try:
    df.to_excel('acoes_atualizadas.xlsx', index=False)
    print("Dados atualizados e salvos no arquivo 'acoes_atualizadas.xlsx'")
except Exception as e:
    print(f"Erro ao salvar o arquivo Excel: {e}")
