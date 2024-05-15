using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Windows.Forms;

namespace WindowsFormsApp1.provisao
{
    public partial class provisao : Form
    {
        public provisao()
        {
            InitializeComponent();
            PreencherListView();
            /*update_list_view();*/

        }



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
                    item.SubItems.Add(reader["Data_Com"].ToString());
                    item.SubItems.Add(reader["Data_Pag"].ToString());
                    item.SubItems.Add(reader["Total"].ToString());

                    listView1.Items.Add(item);
                }
            }
        }

        private void AtualizarTotal()
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "UPDATE PROVISAO SET Total = (SELECT SUM(Quantidade) FROM PAPEL WHERE PAPEL.Acao = PROVISAO.Acao) * Div_Valor";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao atualizar os dados: " + ex.Message);
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
                        AtualizarTotal();  // Chama o método para atualizar a coluna 'Total'
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

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btnComparar_Click(object sender, EventArgs e)
        {

        }
    }
}
