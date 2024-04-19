using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace WindowsFormsApp1
{
    public partial class FormRecuperar : Form
    {
        public FormRecuperar()
        {
            InitializeComponent();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void FormRecuperar_Load(object sender, EventArgs e)
        {

        }

        private void btnRecuperarSenha_Click(object sender, EventArgs e)
        {
            string emailUsuario = textBox1.Text;
            if (VerificarEmailCadastrado(emailUsuario))
            {                
                string senhaTemporaria = GerarSenhaTemporaria();               
                AtualizarSenhaNoBancoDeDados(emailUsuario, senhaTemporaria);                
                EnviarEmail(emailUsuario, senhaTemporaria);
                MessageBox.Show("Um e-mail foi enviado com a nova senha temporária.");
                MessageBox.Show("E-mail cadastrado");                
            }
            else
            {
                MessageBox.Show("E-MAIL NÃO CADASTRADO!!!!!!!!!");
            }
        }

        // Implemente os métodos EmailCadastrado, GerarSenhaTemporaria, AtualizarSenhaNoBancoDeDados e EnviarEmail

        private bool VerificarEmailCadastrado(string emailUsuario)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM USUARIO WHERE Email = @Email", conn))
                {
                    cmd.Parameters.AddWithValue("@Email", emailUsuario);
                    int count = (int)cmd.ExecuteScalar();
                    return count > 0;
                }
            }
        }

        private string GerarSenhaTemporaria()
        {            
            using (RNGCryptoServiceProvider rngCsp = new RNGCryptoServiceProvider())
            {
                byte[] data = new byte[4];
                rngCsp.GetBytes(data);
                string senhaTemporaria = BitConverter.ToString(data);
                return senhaTemporaria;
            }
        }

        private void AtualizarSenhaNoBancoDeDados(string emailUsuario, string senhaTemporaria)
        {
            using (SqlConnection conn = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("UPDATE LOGIN SET Senha = @Senha WHERE UsuarioID IN (SELECT ID FROM USUARIO WHERE Email = @Email)", conn))
                {
                    cmd.Parameters.AddWithValue("@Senha", senhaTemporaria);
                    cmd.Parameters.AddWithValue("@Email", emailUsuario);
                    cmd.ExecuteNonQuery();
                }
            }
        }

        private void EnviarEmail(string emailUsuario, string senhaTemporaria)
        {
            // Configura o servidor SMTP e a mensagem de e-mail
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new NetworkCredential("dj.4d3n1l50n@gmail.com", "");
            smtpClient.EnableSsl = true;

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("dj.4d3n1l50n@gmail.com");
            mail.To.Add(emailUsuario);
            mail.Subject = "Sua nova senha temporária";
            mail.Body = "Sua nova senha temporária é: " + senhaTemporaria;

            // Envia o e-mail
            smtpClient.Send(mail);
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            FormLogin formLogin = new FormLogin();
            formLogin.Show();

        }
    }
}