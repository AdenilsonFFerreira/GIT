﻿using System;
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

        public bool ValidaCPF(string cpf)
        {
            int[] multiplicador1 = new int[] { 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            int[] multiplicador2 = new int[] { 11, 10, 9, 8, 7, 6, 5, 4, 3, 2 };
            string tempCpf;
            string digito;
            int soma;
            int resto;

            cpf = cpf.Trim();
            cpf = cpf.Replace(".", "").Replace("-", "");

            if (cpf.Length != 11)
                return false;

            tempCpf = cpf.Substring(0, 9);
            soma = 0;

            for (int i = 0; i < 9; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador1[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = resto.ToString();
            tempCpf = tempCpf + digito;
            soma = 0;

            for (int i = 0; i < 10; i++)
                soma += int.Parse(tempCpf[i].ToString()) * multiplicador2[i];

            resto = soma % 11;
            if (resto < 2)
                resto = 0;
            else
                resto = 11 - resto;

            digito = digito + resto.ToString();

            return cpf.EndsWith(digito);
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
            if (!ValidaCPF(txbCpf.Text))
            {
                MessageBox.Show("CPF inválido!");
                txbCpf.Focus();
                return;
            }
            // Verificação se o CPF já existe no banco de dados
            string cpf = txbCpf.Text;
            SqlConnection conn = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM USUARIO WHERE CPF = @CPF", conn);
            cmd.Parameters.AddWithValue("@CPF", cpf);
            conn.Open();
            int count = (int)cmd.ExecuteScalar();
            conn.Close();

            if (count > 0)
            {
                MessageBox.Show("CPF já existe!");
                txbCpf.Focus();
                return;
            }

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

        private void txbCpf_TextChanged(object sender, EventArgs e)
        {
            
        }
    }
}