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

namespace WindowsFormsApp1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void BtnCancelar_Click(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void BtnOk_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexao = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"))
            {
                conexao.Open();
                string usuario = txtUsuario.Text; // Substitua 'txtUsuario' pelo nome da sua caixa de texto do usuário
                string senha = txtSenha.Text; // Substitua 'txtSenha' pelo nome da sua caixa de texto da senha

                using (SqlCommand comando = new SqlCommand("SELECT * FROM LOGIN WHERE Usuario = @usuario AND Senha = @senha", conexao))
                {
                    comando.Parameters.AddWithValue("@usuario", usuario);
                    comando.Parameters.AddWithValue("@senha", senha);

                    SqlDataReader leitor = comando.ExecuteReader();

                    if (leitor.HasRows)
                    {
                        // Usuário e senha estão corretos.
                        Form4 form4 = new Form4();
                        form4.Show();
                    }
                    else
                    {
                        // Usuário ou senha estão incorretos.
                        MessageBox.Show("Usuário ou senha incorretos."); // Mostre uma mensagem de erro ao usuário
                    }
                }
            }
        }


        private void LblRecuperar_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Form2 form2 = new Form2();
            form2.Show();
        }

        private void LblCadastro_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            Form3 form3 = new Form3();
            form3.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}