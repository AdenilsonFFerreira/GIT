using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Net.Http;
using System.Windows.Forms;
using System.Web.Script.Serialization;


namespace WindowsFormsApp1
{
    public partial class FormOperacao : Form
    {

        static readonly HttpClient client = new HttpClient();

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


        private void PreencherListView()
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string selectQuery = "SELECT * FROM PAPEL";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(selectQuery, connection);
                connection.Open();
                SqlDataReader reader = command.ExecuteReader();

                ListView1.Items.Clear();

                while (reader.Read())
                {
                    ListViewItem item = new ListViewItem(reader["Acao"].ToString());
                    item.SubItems.Add(reader["Quantidade"].ToString());
                    item.SubItems.Add(reader["Valor"].ToString());
                    item.SubItems.Add(reader["Data_Compra"].ToString());

                    ListView1.Items.Add(item);
                }
            }
        }

        private void Label3_Click(object sender, EventArgs e)
        {

        }

        private void BtnSair_Click(object sender, EventArgs e)
        {
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }


        private void btnComprar_Click(object sender, EventArgs e)
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
                    MessageBox.Show("Compra Realizada com Sucesso!");
                    txbAcao.Text = "";
                    txbQtd.Text = "";
                    txbValor.Text = "";
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao inserir os dados: " + ex.Message);
                }
            }
            PreencherListView();
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

        private void btnVender_Click(object sender, EventArgs e)
        {
            {
                string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
                string selectQuery = "SELECT * FROM PAPEL WHERE Acao = @Acao ORDER BY Data_Compra";
                string updateQuery = "UPDATE PAPEL SET Quantidade = @Quantidade, Valor = @Valor WHERE Acao = @Acao AND Data_Compra = @DataCompra";
                string deleteQuery = "DELETE FROM PAPEL WHERE Acao = @Acao AND Data_Compra = @DataCompra";

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand selectCommand = new SqlCommand(selectQuery, connection);
                    selectCommand.Parameters.AddWithValue("@Acao", txbAcao.Text);

                    try
                    {
                        connection.Open();

                        // Verificar a quantidade total disponível
                        string selectTotalQuery = "SELECT SUM(Quantidade) as TotalQuantidade, SUM(Quantidade * Valor) as TotalValor FROM PAPEL WHERE Acao = @Acao";
                        SqlCommand selectTotalCommand = new SqlCommand(selectTotalQuery, connection);
                        selectTotalCommand.Parameters.AddWithValue("@Acao", txbAcao.Text);
                        SqlDataReader totalReader = selectTotalCommand.ExecuteReader();
                        totalReader.Read();
                        int totalQuantidade = totalReader.GetInt32(totalReader.GetOrdinal("TotalQuantidade"));
                        float totalValor = (float)totalReader.GetDouble(totalReader.GetOrdinal("TotalValor"));
                        float valorMedio = totalValor / totalQuantidade;
                        totalReader.Close();

                        int quantidadeVendida = int.Parse(txbQtd.Text);
                        if (quantidadeVendida > totalQuantidade)
                        {
                            MessageBox.Show("Quantidade vendida é maior do que a quantidade disponível!");
                            return;
                        }

                        // Carregar os dados em uma lista
                        SqlDataReader reader = selectCommand.ExecuteReader();
                        List<(int Quantidade, DateTime DataCompra)> dados = new List<(int Quantidade, DateTime DataCompra)>();
                        while (reader.Read())
                        {
                            int quantidade = reader.GetInt32(reader.GetOrdinal("Quantidade"));
                            DateTime dataCompra = reader.GetDateTime(reader.GetOrdinal("Data_Compra"));
                            dados.Add((quantidade, dataCompra));
                        }
                        reader.Close();

                        // Vender as ações
                        foreach (var dado in dados)
                        {
                            if (dado.Quantidade <= quantidadeVendida)
                            {
                                SqlCommand deleteCommand = new SqlCommand(deleteQuery, connection);
                                deleteCommand.Parameters.AddWithValue("@Acao", txbAcao.Text);
                                deleteCommand.Parameters.AddWithValue("@DataCompra", dado.DataCompra);
                                deleteCommand.ExecuteNonQuery();

                                quantidadeVendida -= dado.Quantidade;
                            }
                            else
                            {
                                SqlCommand updateCommand = new SqlCommand(updateQuery, connection);
                                updateCommand.Parameters.AddWithValue("@Acao", txbAcao.Text);
                                updateCommand.Parameters.AddWithValue("@Quantidade", dado.Quantidade - quantidadeVendida);
                                updateCommand.Parameters.AddWithValue("@Valor", valorMedio);
                                updateCommand.Parameters.AddWithValue("@DataCompra", dado.DataCompra);
                                updateCommand.ExecuteNonQuery();

                                quantidadeVendida = 0;
                            }

                            if (quantidadeVendida == 0)
                            {
                                break;
                            }
                        }

                        if (quantidadeVendida > 0)
                        {
                            MessageBox.Show("Quantidade vendida é maior do que a quantidade disponível!");
                        }
                        else
                        {
                            MessageBox.Show("Venda realizada com sucesso!");
                            txbAcao.Text = "";
                            txbQtd.Text = "";
                            txbValor.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show("Erro ao vender as ações: " + ex.Message);
                    }
                }
            }
            PreencherListView();
        }

        private void listView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }   
        


        private void listView3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}

