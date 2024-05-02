using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

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
          
            string tipoUsuario = ValidarUsuario(usuario, senha);

            if (tipoUsuario.Equals("Admin", StringComparison.OrdinalIgnoreCase))
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
    }
}
