using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Net.Mime.MediaTypeNames;

namespace WindowsFormsApp1
{
    public partial class FormCadastrar : Form
    {


        public FormCadastrar()
        {
            InitializeComponent();
        }

        private void Label1_Click(object sender, EventArgs e)
        {

        }

        private void Label6_Click(object sender, EventArgs e)
        {

        }

        private void Label4_Click(object sender, EventArgs e)
        {

        }

        private void Form3_Load(object sender, EventArgs e)
        {

        }

        private void Button1_Click(object sender, EventArgs e)
        {
            Conexao conexao = new Conexao();

            // Criptografar a senha
            string senha = txbSenha.Text;
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(senha));
                StringBuilder builder = new StringBuilder();
                for (int i = 0; i < bytes.Length; i++)
                {
                    builder.Append(bytes[i].ToString("x2"));
                }
                senha = builder.ToString();
            }

            Login login = new Login(txbUsuario.Text, senha);
            MessageBox.Show(conexao.Cadastrar_Usuario(login));

            Usuario usuario = new Usuario(txbNome.Text,
                txbEndereco.Text,
                txbNumero.Text,
                txbBairro.Text, txbCidade.Text,
                txbCep.Text,
                txbCpf.Text,
                txbEmail.Text,
                txbSexo.Text,
                txbCelular.Text,
                txbTelefone.Text);
            MessageBox.Show(conexao.Inserir_Usuario(usuario));

            conexao.Inserir_Usuario(usuario);
        }

        private void Label13_Click(object sender, EventArgs e)
        {

        }

        private void TextBox12_TextChanged(object sender, EventArgs e)
        {

        }

        private void TextBox13_TextChanged(object sender, EventArgs e)
        {

        }

        private void TextBox9_TextChanged(object sender, EventArgs e)
        {

        }

        private void BtnCancelar_Click(object sender, EventArgs e)
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

        private void BtnSair_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}