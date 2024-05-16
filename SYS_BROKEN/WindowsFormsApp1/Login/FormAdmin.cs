using System;
using System.Data.SqlClient;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class FormAdmin : Form
    {
        public FormAdmin()
        {
            InitializeComponent();
        }

        private void FormAdmin_Load(object sender, EventArgs e)
        {

        }

        private string ValidarUsuario(string usuario, string senha)
        {
            string connectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
            string tipoUsuario = "";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();

                using (SqlCommand command = new SqlCommand("SELECT TipoUsuario FROM LOGIN WHERE Usuario = @Usuario AND Senha = @Senha", connection))
                {
                    command.Parameters.AddWithValue("@Usuario", usuario);
                    command.Parameters.AddWithValue("@Senha", senha);

                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        tipoUsuario = reader["TipoUsuario"].ToString();
                    }
                }
            }

            return tipoUsuario;
        }

        private void btnValidar_Click(object sender, EventArgs e)
        {
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

            string tipoUsuario = ValidarUsuario(usuario, senha);

            if (tipoUsuario.Equals("admin", StringComparison.OrdinalIgnoreCase))
            {
                FormCadastrar form3 = new FormCadastrar();
                form3.Show();
                this.Hide();
            }
            else
            {
                MessageBox.Show("Acesso negado. Somente administradores podem acessar este recurso.");
            }
        }



        private void txtUsuario_TextChanged(object sender, EventArgs e)
        {

        }

        private void txtSenha_TextChanged(object sender, EventArgs e)
        {

        }

        private void btnCancelar_Click(object sender, EventArgs e)
        {
            this.Hide();
        }
    }
}
