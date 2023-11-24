using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Data.Sql;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Xml.Linq;

namespace WindowsFormsApp1
{
    public partial class FormOpercao : Form
    {
        public FormOpercao()
        {
            InitializeComponent();

            update_list_view();
        }

        private void update_list_view()
        {
            this.ListView1.Items.Clear();
            Conexao con = new Conexao();
            Papel[] papeis = con.posicao_consolidade();
            for (int i = 0; i < papeis.Length; i++)
            {
                String[] items = { papeis[i].acao, papeis[i].qtd.ToString(), papeis[i].valor.ToString() };
                this.ListView1.Items.Add(new ListViewItem(items));
            }
        }

        private void UpdateListView()
        {

        }

        private void Label3_Click(object sender, EventArgs e)
        {

        }

        private void BtnSair_Click(object sender, EventArgs e)
        {
            // Feche o Form5
            this.Close();

            // Crie uma nova instância do Form4 e mostre-o
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }


        private void BtnAdicionar_Click(object sender, EventArgs e)
        {
            Conexao conexao = new Conexao();

            // Certifique-se de lidar com possíveis formatos de ponto ou vírgula como separador decimal
            float valor;
            if (float.TryParse(txbValor.Text.Replace(',', '.'), out valor))
            {
                Papel papel = new Papel(txbAcao.Text, int.Parse(txbQtd.Text), valor);
                MessageBox.Show(conexao.Cadastrar_Papel(papel));
                // Atualize a ListView após adicionar o item
                update_list_view();
            }
            else
            {
                MessageBox.Show("O valor inserido não é um número válido.");
            }
        }


        private void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Form5_Load(object sender, EventArgs e)
        {

        }

        private void txbAcao_TextChanged(object sender, EventArgs e)
        {

        }

        private void txbQtd_TextChanged(object sender, EventArgs e)
        {

        }

        private void txbValor_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
