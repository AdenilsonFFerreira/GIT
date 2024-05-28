import requests

# Sua chave de API da Alpha Vantage
api_key = '5N97PQ11HSS38K53'
# Símbolo da ação que deseja consultar
symbol = 'PETR4.SA'
# Função da API para preços diários
function = 'TIME_SERIES_DAILY'

# URL da API
url = f'https://www.alphavantage.co/query?function={function}&symbol={symbol}&apikey={api_key}'

# Fazendo a requisição para a API
response = requests.get(url)
# Convertendo a resposta para JSON
data = response.json()

# Verificando se a resposta contém a chave 'Meta Data'
if 'Meta Data' in data:
    # Extraindo a data mais recente
    last_refreshed = data['Meta Data']['3. Last Refreshed']
    # Obtendo o preço de abertura da data mais recente
    opening_price = data['Time Series (Daily)'][last_refreshed]['1. open']
    # Imprimindo o valor de abertura
    print(f"Preço de abertura da ação {symbol} em {last_refreshed}: {opening_price}")
else:
    # Se a resposta não contém 'Meta Data', imprimir a mensagem de erro
    print("Erro na resposta da API:", data)
