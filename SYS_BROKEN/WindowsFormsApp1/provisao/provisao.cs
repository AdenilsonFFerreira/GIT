using System;
using System.Data.SqlClient;
using System.Globalization;
using System.Windows.Forms;
using System.Windows.Input;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace WindowsFormsApp1.provisao
{
    public partial class provisao : Form
    {
        public provisao()
        {
            InitializeComponent();

            try
            {
                AtualizarTotalDividendosAposCompra(); // Primeiro atualize os totais
                AtualizarQuantidadeDividendos();
                PreencherListView(); // Depois preencha a ListView
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocorreu um erro: " + ex.Message);
            }
        }


        public int ObterQuantidadeTotalPorAcao(string acao)
        {
            int quantidadeTotal = 0;
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "SELECT SUM(Quantidade) AS QuantidadeTotal FROM PAPEL WHERE Acao = @Acao GROUP BY Acao";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Acao", acao);
                connection.Open();
                quantidadeTotal = Convert.ToInt32(command.ExecuteScalar());
            }

            return quantidadeTotal;
        }

        public void AtualizarQuantidadeDividendos()
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = @"UPDATE DIVIDENDOS SET QTD = (SELECT SUM(Quantidade) FROM PAPEL WHERE PAPEL.Acao = DIVIDENDOS.DivAcao)
                            WHERE EXISTS (SELECT 1 FROM PAPEL WHERE PAPEL.Acao = DIVIDENDOS.DivAcao);";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        private void AtualizarTotalDividendos()
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "UPDATE DIVIDENDOS SET TotalDiv = ValorDiv * QTD";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }

        private void AtualizarTotalDividendosAposCompra()
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = @"UPDATE DIVIDENDOS SET TotalDiv = ValorDiv * (SELECT SUM(Quantidade) FROM PAPEL WHERE PAPEL.Acao = DIVIDENDOS.DivAcao)
                            WHERE DivAcao IN (SELECT Acao FROM PAPEL);";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();
                command.ExecuteNonQuery();
            }
        }


        private void PreencherListView()
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string selectQuery = "SELECT * FROM DIVIDENDOS";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(selectQuery, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                listView1.Items.Clear();

                while (reader.Read())
                {
                    decimal valorDiv = decimal.Parse(reader["ValorDiv"].ToString());
                    if (valorDiv == 0)
                        continue; // Se o valor do dividendo for 0, não adicione ao ListView

                    ListViewItem item = new ListViewItem(reader["DivAcao"].ToString());
                    item.SubItems.Add("R$ " + valorDiv.ToString("N2"));

                    // Formatação das datas para exibir apenas a data, sem a hora
                    item.SubItems.Add(Convert.ToDateTime(reader["DataCom"]).ToString("dd/MM/yyyy"));
                    item.SubItems.Add(Convert.ToDateTime(reader["DataPag"]).ToString("dd/MM/yyyy"));

                    item.SubItems.Add(reader["QTD"].ToString());

                    // Verifica se o campo TotalDiv é NULL ou vazio antes de converter
                    if (reader["TotalDiv"] != DBNull.Value && !string.IsNullOrEmpty(reader["TotalDiv"].ToString()))
                    {
                        item.SubItems.Add("R$ " + decimal.Parse(reader["TotalDiv"].ToString()).ToString("N2"));
                    }
                    else
                    {
                        item.SubItems.Add("R$ 0,00"); // Adiciona um valor padrão ou mantém vazio
                    }

                    listView1.Items.Add(item);
                }
            }
        }




        /*private void AtualizarTotal()
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
        }*/


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
            // Insere os dados na tabela DIVIDENDOS
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "INSERT INTO DIVIDENDOS (DivAcao, ValorDiv, DataCom, DataPag) VALUES (@DivAcao, @ValorDiv, @DataCom, @DataPag)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@DivAcao", txbAcao.Text);
                command.Parameters.AddWithValue("@ValorDiv", decimal.Parse(txbDiv_Valor.Text));
                command.Parameters.AddWithValue("@DataCom", DateTime.Parse(txbData_Com.Text));
                command.Parameters.AddWithValue("@DataPag", DateTime.Parse(txbData_Pag.Text));

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    MessageBox.Show("Dividendo adicionado com sucesso.");

                    // Limpa os campos após a inserção
                    txbAcao.Text = "";
                    txbDiv_Valor.Text = "";
                    txbData_Com.Text = "";
                    txbData_Pag.Text = "";

                    // Atualiza a quantidade total de ações na tabela DIVIDENDOS
                    AtualizarQuantidadeDividendos();
                    AtualizarTotalDividendos(); // Chama o método para atualizar o total do dividendo
                    PreencherListView(); // Atualiza a ListView com os dados mais recentes
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao adicionar os dados: " + ex.Message);
                }
            }
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

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "DELETE FROM DIVIDENDOS WHERE DivAcao = @DivAcao";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@DivAcao", txbAcao.Text); // Substitua textBoxAcao pelo nome do seu TextBox que contém o nome da ação

                try
                {
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Ação excluída com sucesso.");
                        txbAcao.Text = ""; // Limpa o campo após a exclusão
                    }
                    else
                    {
                        MessageBox.Show("Ação não encontrada ou já excluída.");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao excluir a ação: " + ex.Message);
                }
            }
            PreencherListView(); // Atualiza a ListView após a exclusão
        }

    }
}
