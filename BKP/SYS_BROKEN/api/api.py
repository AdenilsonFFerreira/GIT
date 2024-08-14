import requests

# Sua chave de API da Alpha Vantage
api_key = '5N97PQ11HSS38K53'
# Símbolo da ação que deseja consultar
symbol = 'IBM'
# Função da API para preços diários
function = 'TIME_SERIES_DAILY'

# URL da API
url = f'https://www.alphavantage.co/query?function={function}&symbol={symbol}&apikey={api_key}'

# Fazendo a requisição para a API
response = requests.get(url)
# Convertendo a resposta para JSON
data = response.json()

# Imprimindo os dados
print(data)
