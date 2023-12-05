using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    internal class Pesquisa
    {
        public void BuscarPapel(string papel)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "SELECT * FROM PAPEL WHERE Acao = @Acao";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@Acao", papel);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    // Criar um novo arquivo de texto para armazenar os resultados
                    using (StreamWriter file = new StreamWriter(@"C:\caminho\para\seu\arquivo.txt"))
                    {
                        while (reader.Read())
                        {
                            file.WriteLine("ID: " + reader["ID"]);
                            file.WriteLine("Ação: " + reader["Acao"]);
                            file.WriteLine("Quantidade: " + reader["Quantidade"]);
                            file.WriteLine("Valor: " + reader["Valor"]);
                            file.WriteLine();
                        }
                    }

                    MessageBox.Show("Dados buscados com sucesso!");
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao buscar os dados: " + ex.Message);
                }
            }
        }

    }
}
