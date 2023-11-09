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
            Conexao conexao = new Conexao();
            Papel papel = new Papel(txbAcao.Text, int.Parse(txbQtd.Text), int.Parse(txbValor.Text));
            MessageBox.Show(conexao.cadastrar_papel(papel));
            //Cadastro cad = new Cadastro(txbAcao.Text, txbQtd.Text, txbValor.Text);
            //MessageBox.Show(cad.mensagem);
        }

        private void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            listView1.View = View.Details;
            listView1.Columns.Add("Ação");
            listView1.Columns.Add("Valor");
            listView1.Columns.Add("Quantidade");
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
