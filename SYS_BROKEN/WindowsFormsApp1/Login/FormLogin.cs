﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
            txtSenha.PasswordChar = '*';
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

                // Criptografar a senha
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

                using (SqlCommand comando = new SqlCommand("SELECT * FROM LOGIN WHERE Usuario = @usuario AND Senha = @senha", conexao))
                {
                    comando.Parameters.AddWithValue("@usuario", usuario);
                    comando.Parameters.AddWithValue("@senha", senha);

                    SqlDataReader leitor = comando.ExecuteReader();

                    if (leitor.HasRows)
                    {
                        // Usuário e senha estão corretos.
                        FormModoOP form4 = new FormModoOP();
                        form4.Show();
                        //como esse form é o principal (form1) não pode fechar (close)
                        //nesse caso so deixamos ele como invisivel quando é chamado o formulario
                        this.Hide();
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
            FormRecuperar form2 = new FormRecuperar();
            form2.Show();
        }

        private void LblCadastro_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FormCadastrar form3 = new FormCadastrar();
            form3.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}