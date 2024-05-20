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
                    ListViewItem item = new ListViewItem(reader["Corretora"].ToString());                    
                    item.SubItems.Add(reader["Valor"].ToString());

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
            string query = "INSERT INTO PATRIMONIO (Corretora, Valor) VALUES (@Corretora, @Valor)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Corretora", textBox1.Text);
                command.Parameters.AddWithValue("@Valor", textBox2.Text);

                try
                {
                    connection.Open();
                    command.ExecuteNonQuery();
                    MessageBox.Show("PATRIMONIO CADASTRADO COM SUCESSO.");
                    textBox1.Text = "";
                    textBox2.Text = "";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao inserir os dados: " + ex.Message);
                }
            }
            PreencherListView();

        }
    }
}
