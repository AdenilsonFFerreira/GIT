using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;
using WindowsFormsApp1.modoop;
using OfficeOpenXml;
using System.Diagnostics;
using System.Threading.Tasks;

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

        private async void BtnOk_Click(object sender, EventArgs e)
        {
            using (SqlConnection conexao = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"))
            {
                conexao.Open();
                string usuario = txtUsuario.Text;
                string senha = txtSenha.Text;

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
                        // Executar o script Python em uma tarefa separada
                        Task.Run(() => ExecutePythonScript());

                        FormModoOP form4 = new FormModoOP();
                        form4.Show();
                        FormAlertas formAlertas = new FormAlertas();
                        formAlertas.Show();

                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Usuário ou senha incorretos.");
                    }
                }
            }
        }

        private void ExecutePythonScript()
        {
            // Caminho para o script Python que você deseja executar
            string pythonScript = @"C:\SysBroken\utility\api.py";

            // Configuração do processo para executar o script Python com pythonw.exe
            ProcessStartInfo pythonStartInfo = new ProcessStartInfo("pythonw")
            {
                Arguments = pythonScript,
                UseShellExecute = false,
                CreateNoWindow = true
            };

            // Iniciar o processo sem bloquear a interface do usuário
            using (Process pythonProcess = new Process())
            {
                pythonProcess.StartInfo = pythonStartInfo;
                pythonProcess.Start();
            }
        }

        private void LblRecuperar_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FormRecuperar form2 = new FormRecuperar();
            form2.Show();
        }

        private void LblCadastro_LinkClicked(object sender, LinkLabelLinkClickedEventArgs e)
        {
            FormAdmin formAdmin = new FormAdmin();
            formAdmin.Show();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void txtUsuario_TextChanged(object sender, EventArgs e)
        {
            string usuario = txtUsuario.Text;
            // Supondo que você tenha uma função `GetImagePath` para obter o caminho da imagem do banco de dados.
            string imagePath = GetImagePath(usuario);
            if (!string.IsNullOrEmpty(imagePath) && File.Exists(imagePath))
            {
                pictureBox1.Image = System.Drawing.Image.FromFile(imagePath);
                pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            }
            else
            {
                pictureBox1.Image = null;
            }
        }

        private string GetImagePath(string usuario)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string imagePath = null;
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                string sql = "SELECT Foto FROM LOGIN WHERE Usuario = @Usuario";
                using (SqlCommand command = new SqlCommand(sql, connection))
                {
                    command.Parameters.AddWithValue("@Usuario", usuario);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            imagePath = reader["Foto"] as string;
                        }
                    }
                }
            }
            return imagePath;
        }

        private void txtSenha_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }
    }
}