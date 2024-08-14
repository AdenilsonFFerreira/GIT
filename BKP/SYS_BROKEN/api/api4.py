import requests
#GERANDO AQRUIVO TXT

# Sua chave de API da IEX Cloud
iex_api_key = 'YOUR_IEX_CLOUD_API_KEY'

# Função para obter o preço de abertura usando a IEX Cloud API
def get_opening_price(symbol):
    url = f'https://cloud.iexapis.com/stable/stock/{symbol}/quote?token={iex_api_key}'
    try:
        response = requests.get(url)
        response.raise_for_status()
        data = response.json()
        return data['open'], data['latestUpdate']
    except requests.exceptions.RequestException as e:
        print(f"Erro ao fazer a requisição para a ação {symbol}: {e}")
        return None, None
    except KeyError as e:
        print(f"Erro ao processar dados para a ação {symbol}: {e}")
        return None, None

# Ler os símbolos das ações a partir de um arquivo TXT
with open('acoes.txt', 'r') as file:
    symbols = file.read().splitlines()

# Abrir um arquivo TXT para salvar os resultados
with open('acoes_resultados.txt', 'w') as output_file:
    for symbol in symbols:
        opening_price, last_refreshed = get_opening_price(symbol)
        if opening_price is not None:
            output_file.write(f"{symbol},{last_refreshed},{opening_price}\n")
        else:
            output_file.write(f"{symbol},Erro ao obter dados\n")

print("Dados atualizados e salvos no arquivo 'acoes_resultados.txt'")
