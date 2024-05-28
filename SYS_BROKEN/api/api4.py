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

using System;
using System.IO;
using System.Linq;
using System.Windows.Forms;

public class MainForm : Form
{
    private ListView listView;
    private Button loadButton;

    public MainForm()
    {
        // Configurar o ListView
        listView = new ListView
        {
            View = View.Details,
            FullRowSelect = true,
            GridLines = true
        };
        listView.Columns.Add("Símbolo", 100);
        listView.Columns.Add("Última Atualização", 150);
        listView.Columns.Add("Preço de Abertura", 100);
        listView.Dock = DockStyle.Top;

        // Botão para carregar os dados
        loadButton = new Button
        {
            Text = "Carregar Dados",
            Dock = DockStyle.Bottom
        };
        loadButton.Click += LoadButton_Click;

        // Adicionar controles ao formulário
        Controls.Add(listView);
        Controls.Add(loadButton);
    }

    private void LoadButton_Click(object sender, EventArgs e)
    {
        listView.Items.Clear();

        string[] lines = File.ReadAllLines("acoes_resultados.txt");
        foreach (string line in lines)
        {
            var parts = line.Split(',');
            var listViewItem = new ListViewItem(parts);
            listView.Items.Add(listViewItem);
        }
    }

    [STAThread]
    public static void Main()
    {
        Application.EnableVisualStyles();
        Application.Run(new MainForm());
    }
}

