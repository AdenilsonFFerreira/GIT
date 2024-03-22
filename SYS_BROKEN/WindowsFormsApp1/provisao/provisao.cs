using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Globalization;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace WindowsFormsApp1.provisao
{
    public partial class provisao : Form
    {
        public provisao()
        {
            InitializeComponent();
            /*update_list_view();*/
        }

        /*private void update_list_view()
        {
            this.listView1.Items.Clear();
            Conexao con = new Conexao();
            Provisao[] provisao = con.posicao_consolidade();
            for (int i = 0; i < provisao.Length; i++)
            {
                String[] items = { provisao[i].acao, provisao[i].div_valor.ToString(), provisao[i].data_com.ToString(), provisao[i].data_pag.ToString() };
                this.listView1.Items.Add(new ListViewItem(items));
            }
        }*/

        private void PreencherListView()
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string selectQuery = "SELECT * FROM PROVISAO";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(selectQuery, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                listView1.Items.Clear();

                while (reader.Read())
                {
                    ListViewItem item = new ListViewItem(reader["Acao"].ToString());
                    item.SubItems.Add(reader["Div_Valor"].ToString());
                    item.SubItems.Add(reader["Data_com"].ToString());
                    item.SubItems.Add(reader["Data_Pag"].ToString());

                    listView1.Items.Add(item);
                }
            }
        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void provisao_Load(object sender, EventArgs e)
        {

        }

        private void label8_Click(object sender, EventArgs e)
        {

        }

        private void textBox4_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void label9_Click(object sender, EventArgs e)
        {

        }

        private void btnAdicionar_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "INSERT INTO PROVISAO (Acao, Div_Valor, Data_Com, Data_Pag) VALUES (@acao, @div_valor, @data_com, @data_pag)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@acao", txbAcao.Text);
                command.Parameters.AddWithValue("@div_valor", txbDiv_Valor.Text);

                // Converte as datas de string para DateTime
                DateTime dataCom;
                DateTime dataPag;
                bool isValidDataCom = DateTime.TryParseExact(txbData_Com.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dataCom);
                bool isValidDataPag = DateTime.TryParseExact(txbData_Pag.Text, "dd/MM/yyyy", CultureInfo.InvariantCulture, DateTimeStyles.None, out dataPag);

                if (isValidDataCom && isValidDataPag)
                {
                    command.Parameters.AddWithValue("@data_com", dataCom);
                    command.Parameters.AddWithValue("@data_pag", dataPag);

                    try
                    {
                        connection.Open();
                        command.ExecuteNonQuery();
                        MessageBox.Show("CADASTRO Realizado com Sucesso!");
                        txbAcao.Text = "";
                        txbDiv_Valor.Text = "";
                        txbData_Com.Text = "";
                        txbData_Pag.Text = "";
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Erro ao inserir os dados: " + ex.Message);
                    }
                }
                else
                {
                    MessageBox.Show("Formato de data inválido. Por favor, insira a data no formato dd/MM/yyyy.");
                }
            }
            PreencherListView();
        }

    }
}
