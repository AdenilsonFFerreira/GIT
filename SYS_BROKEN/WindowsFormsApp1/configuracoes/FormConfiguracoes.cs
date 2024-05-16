using System;
using System.Windows.Forms;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Text;
using System.Linq;


namespace WindowsFormsApp1
{
    public partial class FormConfiguracoes : Form
    {
        public FormConfiguracoes()
        {
            InitializeComponent();
        }

        private void BackupDatabase()
        {
            try
            {
                string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=master;Integrated Security=True";
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();

                    using (SqlCommand command = new SqlCommand())
                    {
                        command.Connection = conn;
                        command.CommandText = String.Format("BACKUP DATABASE {0} TO DISK='{1}'", "ProjAcoes", "C:\\teste\\backup.bak");

                        command.ExecuteNonQuery();
                    }
                }

                MessageBox.Show("Backup realizado com sucesso!");
            }
            catch (Exception ex)
            {
                // Aqui você pode escrever o código para lidar com a exceção
                // Por exemplo, você pode mostrar uma mensagem de erro
                MessageBox.Show("Ocorreu um erro ao realizar o backup: " + ex.Message);
            }
        }


        public void ExportDataToCsv(string connectionString, string tableName, string filePath)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();

                using (SqlCommand command = new SqlCommand($"SELECT * FROM {tableName}", conn))
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    var dataTable = new DataTable();
                    dataTable.Load(reader);

                    StringBuilder sb = new StringBuilder();

                    string[] columnNames = dataTable.Columns.Cast<DataColumn>().
                                                      Select(column => column.ColumnName).
                                                      ToArray();
                    sb.AppendLine(string.Join(",", columnNames));

                    foreach (DataRow row in dataTable.Rows)
                    {
                        string[] fields = row.ItemArray.Select(field => field.ToString()).
                                                        ToArray();
                        sb.AppendLine(string.Join(",", fields));
                    }

                    File.WriteAllText(filePath, sb.ToString());
                }
            }
        }


        private void btnVoltar_Click(object sender, EventArgs e)
        {
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }

        private void btnAlerta_Click(object sender, EventArgs e)
        {

        }

        private void btnBackup_Click(object sender, EventArgs e)
        {
            BackupDatabase();
            ExportDataToCsv("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True", "PAPEL", "C:\\teste\\papel.csv");
            ExportDataToCsv("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True", "PROVISAO", "C:\\teste\\provisao.csv");

        }



        private void btnRestore_Click(object sender, EventArgs e)
        {
            
        }
    }
}
