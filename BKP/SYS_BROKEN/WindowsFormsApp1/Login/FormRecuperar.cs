using System;
using System.Data;
using System.Data.SqlClient;
using System.Net;
using System.Net.Mail;
using System.Security.Cryptography;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows.Forms;

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
                // Gera uma senha temporária.
                string senhaTemporaria = GerarSenhaTemporaria();

                // Aplica o hash à senha temporária antes de atualizar no banco de dados.
                string senhaHash = HashPassword(senhaTemporaria);

                // Atualiza a senha no banco de dados com o hash da senha temporária.
                AtualizarSenhaNoBancoDeDados(emailUsuario, senhaHash);

                // Envia um e-mail para o usuário com a senha temporária.
                EnviarEmail(emailUsuario, senhaTemporaria);

                MessageBox.Show("Um e-mail foi enviado com a nova senha temporária.");
            }
            else
            {
                MessageBox.Show("E-MAIL NÃO CADASTRADO!!!!!!!!!");
            }
        }

        private bool VerificarEmailCadastrado(string emailUsuario)
        {
            // Expressão regular para validação básica de e-mail.
            if (!Regex.IsMatch(emailUsuario, @"^[^@\s]+@[^@\s]+\.[^@\s]+$"))
            {
                return false;
            }

            try
            {
                using (SqlConnection conn = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"))
                {
                    conn.Open();
                    using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM USUARIO WHERE Email = @Email", conn))
                    {
                        cmd.Parameters.Add(new SqlParameter("@Email", SqlDbType.NVarChar, 255) { Value = emailUsuario });
                        int count = (int)cmd.ExecuteScalar();
                        return count > 0;
                    }
                }
            }
            catch (SqlException ex)
            {
                // Log da exceção
                Console.WriteLine(ex.Message);
                return false;
            }
        }

        private string GerarSenhaTemporaria()
        {
            var chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
            var stringChars = new char[8];
            var random = new Random();

            for (int i = 0; i < stringChars.Length; i++)
            {
                stringChars[i] = chars[random.Next(chars.Length)];
            }

            return new String(stringChars);
        }


        /*
        private string GerarSenhaTemporaria()
        {
            using (RNGCryptoServiceProvider rngCsp = new RNGCryptoServiceProvider())
            {
                byte[] data = new byte[16];
                rngCsp.GetBytes(data);
                string senhaTemporaria = Convert.ToBase64String(data).Substring(0, 12); // Senha legível de 12 caracteres
                return senhaTemporaria;
            }
        }
        */

        private void AtualizarSenhaNoBancoDeDados(string emailUsuario, string senhaTemporaria)
        {
            // Hash da senha temporária.
            string senhaHash = HashPassword(senhaTemporaria);

            using (SqlConnection conn = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"))
            {
                conn.Open();
                SqlTransaction transaction = conn.BeginTransaction();

                try
                {
                    using (SqlCommand cmd = new SqlCommand("UPDATE LOGIN SET Senha = @Senha WHERE UsuarioID IN (SELECT ID FROM USUARIO WHERE Email = @Email)", conn, transaction))
                    {
                        cmd.Parameters.AddWithValue("@Senha", senhaHash);
                        cmd.Parameters.AddWithValue("@Email", emailUsuario);
                        int rowsAffected = cmd.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            transaction.Commit();
                            MessageBox.Show("Senha atualizada com sucesso.");
                        }
                        else
                        {
                            transaction.Rollback();
                            MessageBox.Show("Nenhuma linha foi afetada. Verifique se o e-mail está correto e cadastrado.");
                        }
                    }
                }
                catch (SqlException ex)
                {
                    transaction.Rollback();
                    MessageBox.Show("Erro ao atualizar a senha: " + ex.Message);
                }
            }
        }



        private string HashPassword(string password)
        {
            using (SHA256 sha256Hash = SHA256.Create())
            {
                byte[] bytes = sha256Hash.ComputeHash(Encoding.UTF8.GetBytes(password));
                StringBuilder builder = new StringBuilder();
                foreach (byte b in bytes)
                {
                    builder.Append(b.ToString("x2"));
                }
                return builder.ToString();
            }
        }



        private void EnviarEmail(string emailUsuario, string senhaTemporaria)
        {
            // Configura o servidor SMTP e a mensagem de e-mail
            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new NetworkCredential(
                "dj.4d3n1l50n@gmail.com", // Substitua por seu email do Gmail
                "fplx akjg eyzg cyos" // Substitua pela senha do app específica do Google
            );
            smtpClient.EnableSsl = true;

            MailMessage mail = new MailMessage();
            mail.From = new MailAddress("dj.4d3n1l50n@gmail.com", "Adenilson Fernandes Ferreira"); // Substitua por seu nome
            mail.To.Add(emailUsuario);
            mail.Subject = "Sua nova senha temporária";
            mail.Body = "Sua nova senha temporária é: " + senhaTemporaria;

            // Envia o e-mail
            try
            {
                smtpClient.Send(mail);
                MessageBox.Show("Email de recuperação de senha enviado com sucesso!");
            }
            catch (Exception ex)
            {
                MessageBox.Show("Falha no envio do email: " + ex.Message);
                // Registre o erro em um log para análise posterior
            }
        }



        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}