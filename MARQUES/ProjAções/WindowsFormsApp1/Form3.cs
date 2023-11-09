using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace WindowsFormsApp1
{
    public partial class Form3 : Form
    {
        

        public Form3()
        {
            InitializeComponent();
        }

        private void Label1_Click(object sender, EventArgs e)
        {

        }

        private void label6_Click(object sender, EventArgs e)
        {

        }

        private void Label4_Click(object sender, EventArgs e)
        {

        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            Conexao conexao = new Conexao();
            Login login = new Login(txbUsuario.Text, txbSenha.Text);
            MessageBox.Show(conexao.cadastrar_usuario(login));

            Usuario usuario = new Usuario(txbNome.Text, txbEndereco.Text, int.Parse(txbNumero.Text), txbBairro.Text, txbCidade.Text, int.Parse(txbCEP.Text), int.Parse(txbCPF.Text), txbEmail.Text, txbSexo.Text, int.Parse(txbCelular.Text), int.Parse(txbTelefone.Text));
            MessageBox.Show(conexao.inserir_usuario(usuario));
              
            conexao.inserir_usuario(usuario);
            
        }

        private void label13_Click(object sender, EventArgs e) 
        {

        }

        private void textBox12_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox13_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox9_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            try
            {
                this.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine(ex.ToString());
            }
        }

        private void btnSair_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }