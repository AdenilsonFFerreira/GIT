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
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using System.Globalization;

namespace WindowsFormsApp1
{
    public partial class FormOperacao : Form
    {
        public FormOperacao()
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
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "INSERT INTO PAPEL (Acao, Quantidade, Valor, Data_Compra) VALUES (@Acao, @Quantidade, @Valor, GETDATE())";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Acao", txbAcao.Text);
                command.Parameters.AddWithValue("@Quantidade", txbQtd.Text);
                command.Parameters.AddWithValue("@Valor", txbValor.Text);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    MessageBox.Show("Dados inseridos com sucesso!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao inserir os dados: " + ex.Message);
                }
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
            /*try
            {
                string n;
                double v;
                n = txbValor.Text.Replace("R$ ", "").Replace(",", "").Replace(".", "");

                n = n.PadLeft(3, '0');
                if (n.Length > 3 & n.Substring(0, 1) == "0")
                    n = n.Substring(1, n.Length - 1);
                v = Convert.ToDouble(n) / 100.0;
                txbValor.Text = "R$ " + string.Format("{0:N}", v);
                txbValor.SelectionStart = txbValor.Text.Length;
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message, "AVISO DE ERRO", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }*/
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
