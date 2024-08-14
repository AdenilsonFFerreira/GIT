using System;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace WindowsFormsApp1.patrimonio
{
    public partial class patrimonio : Form
    {

        public patrimonio()
        {
            InitializeComponent();
            this.Load += new EventHandler(patrimonio_Load);
            AtualizarTotalNoLabel();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }

        private void patrimonio_Load(object sender, EventArgs e)
        {
            PreencherListView();
        }

        private void btnAdicionar_Click(object sender, EventArgs e)
        {

        }

        private void listView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void PreencherListView()
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string selectQuery = "SELECT * FROM PATRIMONIO";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(selectQuery, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                listView1.Items.Clear();

                while (reader.Read())
                {
                    decimal valor = decimal.Parse(reader["Valor"].ToString());
                    if (valor == 0)
                        continue; // Se o valor for 0, não adicione ao ListView

                    ListViewItem item = new ListViewItem(reader["Corretora"].ToString());
                    item.SubItems.Add("R$ " + valor.ToString("N2"));

                    listView1.Items.Add(item);
                }
            }
        }



        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }


        private void btnAdicionar_Click_1(object sender, EventArgs e)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "UPDATE PATRIMONIO SET Valor = Valor + @Valor WHERE Corretora = @Corretora";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Corretora", textBox1.Text);
                command.Parameters.AddWithValue("@Valor", textBox2.Text);

                try
                {
                    connection.Open();
                    int rowsAffected = command.ExecuteNonQuery();
                    if (rowsAffected == 0)
                    {
                        query = "INSERT INTO PATRIMONIO (Corretora, Valor) VALUES (@Corretora, @Valor)";
                        command = new SqlCommand(query, connection);
                        command.Parameters.AddWithValue("@Corretora", textBox1.Text);
                        command.Parameters.AddWithValue("@Valor", textBox2.Text);
                        command.ExecuteNonQuery();
                    }
                    MessageBox.Show("VALOR ATUALIZADO COM SUCESSO.");
                    textBox1.Text = "";
                    textBox2.Text = "";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao atualizar os dados: " + ex.Message);
                }
            }
            PreencherListView();
            AtualizarTotalNoLabel();

        }

        private void btnExcluir_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "UPDATE PATRIMONIO SET Valor = Valor - @Valor WHERE Corretora = @Corretora";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Corretora", textBox1.Text);
                command.Parameters.AddWithValue("@Valor", textBox2.Text);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    MessageBox.Show("VALOR ATUALIZADO COM SUCESSO.");
                    textBox1.Text = "";
                    textBox2.Text = "";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao atualizar os dados: " + ex.Message);
                }
            }
            PreencherListView();
            AtualizarTotalNoLabel();
        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void AtualizarTotalNoLabel()
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "SELECT SUM(Valor) as Total FROM PATRIMONIO";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);

                try
                {
                    connection.Open();
                    object result = command.ExecuteScalar();
                    if (result != DBNull.Value)
                    {
                        decimal total = (decimal)result;
                        this.label6.Text = "Total: R$ " + total.ToString("N2");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao calcular o total: " + ex.Message);
                }
            }
        }



    }
}
