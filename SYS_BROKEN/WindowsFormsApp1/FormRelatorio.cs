using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Drawing.Printing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.ToolBar;

namespace WindowsFormsApp1
{
    public partial class FormRelatorio : Form
    {
        public FormRelatorio()
        {
            InitializeComponent();
        }

        private void FormRelatorio_Load(object sender, EventArgs e)
        {
            btnImpriTxt.Enabled = false;
            btnImpriCsv.Enabled = false;
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnFechar_Click(object sender, EventArgs e)
        {            
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnPesquisar_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "SELECT * FROM PAPEL WHERE Acao LIKE @Acao";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Acao", "%" + txbPapel.Text + "%");

                    try
                    {
                        connection.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        if (dt.Rows.Count == 0)
                        {
                            MessageBox.Show("          Voçê não possui essa AÇÂO em sua carteira.\n\n                 Por favor verificar sua CARTEIRA!");
                        }
                        else
                        {
                            dataGridView1.DataSource = dt;
                            dataGridView1.Columns["Data_Compra"].HeaderText = "Data da Compra";
                            dataGridView1.Columns["ID"].Visible = false; // OCULTA COLUNA ID PARA IMPRESSÃO
                            btnImpriTxt.Enabled = true;
                            btnImpriCsv.Enabled = true;
                        }
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }         
        }

        private void BuscarPapel(string text)
        {
            throw new NotImplementedException();
        }


        //BOTÃO IMPRIMIR .CSV
        private void btnImpriCsv_Click_1(object sender, EventArgs e)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "SELECT * FROM PAPEL WHERE Acao LIKE @Acao";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Acao", "%" + txbPapel.Text + "%");

                    try
                    {
                        connection.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        string csv = ExportToCSVFile(dt);

                        SaveFileDialog saveFileDialog1 = new SaveFileDialog();
                        saveFileDialog1.Filter = "CSV File|*.csv";
                        saveFileDialog1.Title = "Salvar um arquivo CSV";
                        if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                        {
                            using (StreamWriter sw = new StreamWriter(saveFileDialog1.FileName, false, Encoding.Default))
                            {
                                sw.Write(csv);
                            }
                        }

                        MessageBox.Show("Arquivo Salvo com Sucesso!");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
        }

        private string ExportToCSVFile(DataTable dtTable)
        {
            var sbldr = new StringBuilder();

            foreach (DataColumn c in dtTable.Columns)
            {
                sbldr.Append(c.ColumnName + ";");
            }

            sbldr.AppendLine();

            foreach (DataRow row in dtTable.Rows)
            {
                foreach (DataColumn column in dtTable.Columns)
                {
                    sbldr.Append(row[column].ToString() + ";");
                }
                sbldr.AppendLine();
            }

            return sbldr.ToString();
        }
        //Final da função botão imprimir .CSV


        //BOTÃO IMPRIMIR .TXT
        private void btnImpriTxt_Click(object sender, EventArgs e)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string query = "SELECT * FROM PAPEL WHERE Acao LIKE @Acao";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@Acao", "%" + txbPapel.Text + "%");

                    try
                    {
                        connection.Open();
                        SqlDataAdapter adapter = new SqlDataAdapter(command);
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        string txt = ExportToTXTFile(dt);

                        SaveFileDialog saveFileDialog1 = new SaveFileDialog();
                        saveFileDialog1.Filter = "TXT File|*.txt";
                        saveFileDialog1.Title = "Salvar um arquivo TXT";
                        if (saveFileDialog1.ShowDialog() == DialogResult.OK)
                        {
                            using (StreamWriter sw = new StreamWriter(saveFileDialog1.FileName, false, Encoding.Default))
                            {
                                sw.Write(txt);
                            }
                        }

                        MessageBox.Show("Arquivo Salvo com Sucesso!");
                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }
            }
        }

        private string ExportToTXTFile(DataTable dtTable)
        {
            var sbldr = new StringBuilder();

            foreach (DataColumn c in dtTable.Columns)
            {
                sbldr.Append(c.ColumnName.PadRight(20));
            }

            sbldr.AppendLine();

            foreach (DataRow row in dtTable.Rows)
            {
                foreach (DataColumn column in dtTable.Columns)
                {
                    sbldr.Append(row[column].ToString().PadRight(20));
                }
                sbldr.AppendLine();
            }

            return sbldr.ToString();
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
        //FINAL DA FUNÇÃO IMPRIMIR .TXT
    }
        
}



