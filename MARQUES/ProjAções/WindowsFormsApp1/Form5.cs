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

namespace WindowsFormsApp1
{
    public partial class Form5 : Form
    {
        public Form5()
        {
            InitializeComponent();
        }
        private void UpdateListView()
        {
            Conexao conn = new Conexao();
            SqlCommand sqlCom = new SqlCommand();

            sqlCom.Connection = conn.ReturnConnection();
            sqlCom.CommandText = "SELECT * FROM PAPEL";

            try
            {
                SqlDataReader dr = sqlCom.ExecuteReader();

                //Enquanto for possível continuar a leitura das linhas que foram retornadas na consulta, execute.
                while (dr.Read())
                {
                    string acao = (string)dr["Acao"];
                    int qtd = (int)dr["Quantidade"];
                    decimal valor = (decimal)(dr["Valor"]);

                    ListViewItem lv = new ListViewItem();
                    lv.SubItems.Add(acao);
                    lv.SubItems.Add(qtd.ToString());
                    lv.SubItems.Add(valor.ToString());
                    listView1.Items.Add(lv);

                }
                dr.Close();
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
            }
            finally
            {
                conn.CloseConnection();
            }
        }

        private void Label3_Click(object sender, EventArgs e)
        {

        }

        private void BtnSair_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void BtnAdicionar_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True");
            string sql = "INSERT INTO PAPEL(ID, Acao, Quantidade, Valor) VALUES (@id, @acao, @quantidade, @valor)";
            Random numeroID = new Random();
            numeroID.Next();

            try
            {
                SqlCommand c = new SqlCommand(sql, conn);
                c.Parameters.Add(new SqlParameter("@id", numeroID.Next()));
                c.Parameters.Add(new SqlParameter("@acao", this.txbAcao.Text));
                c.Parameters.Add(new SqlParameter("@quantidade", this.txbQtd.Text));
                c.Parameters.Add(new SqlParameter("@valor", this.txbValor.Text));

                conn.Open();

                c.ExecuteNonQuery();   

                conn.Close();
                MessageBox.Show("Enviado com sucesso!");
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Ocorreu o erro: " + ex);
            }
            catch (Exception ex)
            {
                MessageBox.Show("Ocorreu um erro: " + ex);
            }
            finally
            {
                conn.Close();
            }
        }

        private void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void Form5_Load(object sender, EventArgs e)
        {
            UpdateListView();
        }

        private void txbAcao_TextChanged(object sender, EventArgs e)
        {

        }

        private void txbQtd_TextChanged(object sender, EventArgs e)
        {

        }

        private void txbValor_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
