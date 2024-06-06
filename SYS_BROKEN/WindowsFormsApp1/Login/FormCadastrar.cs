using System;
using System.Data.SqlClient;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Windows.Forms;

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
            // Validação do CPF.
            if (!ValidaCPF(txbCpf.Text))
            {
                MessageBox.Show("CPF inválido!");
                txbCpf.Focus();
                return;
            }

            // Verificação se o campo de e-mail está preenchido.
            if (string.IsNullOrEmpty(txbEmail.Text))
            {
                MessageBox.Show("O campo de e-mail é obrigatório!");
                txbEmail.Focus();
                return;
            }

            // Verificação se o CPF já existe no banco de dados.
            string cpf = txbCpf.Text;
            int usuarioId = 0; // Variável para armazenar o ID do usuário.
            using (SqlConnection conn = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("SELECT COUNT(*) FROM USUARIO WHERE CPF = @CPF", conn))
                {
                    cmd.Parameters.AddWithValue("@CPF", cpf);
                    int count = (int)cmd.ExecuteScalar();
                    if (count > 0)
                    {
                        MessageBox.Show("CPF já existe!");
                        txbCpf.Focus();
                        return;
                    }
                }

                // Inserção do usuário na tabela USUARIO e obtenção do ID gerado.
                using (SqlCommand cmd = new SqlCommand("INSERT INTO USUARIO (Nome, CPF, Email) VALUES (@Nome, @CPF, @Email); SELECT SCOPE_IDENTITY();", conn))
                {
                    cmd.Parameters.AddWithValue("@Nome", txbNome.Text);
                    cmd.Parameters.AddWithValue("@CPF", cpf);
                    cmd.Parameters.AddWithValue("@Email", txbEmail.Text);
                    usuarioId = Convert.ToInt32(cmd.ExecuteScalar());
                }
            }

            // Criptografia da senha.
            string senha = txbSenha.Text;
            senha = HashPassword(senha);

            // Caminho da imagem.
            string imagePath = pictureBox1.ImageLocation;

            // Inserção do login na tabela LOGIN associado ao ID do usuário.
            using (SqlConnection conn = new SqlConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"))
            {
                conn.Open();
                using (SqlCommand cmd = new SqlCommand("INSERT INTO LOGIN (UsuarioID, Usuario, Senha, TipoUsuario, Foto) VALUES (@UsuarioID, @Usuario, @Senha, @TipoUsuario, @Foto)", conn))
                {
                    cmd.Parameters.AddWithValue("@UsuarioID", usuarioId);
                    cmd.Parameters.AddWithValue("@Usuario", txbUsuario.Text);
                    cmd.Parameters.AddWithValue("@Senha", senha);
                    cmd.Parameters.AddWithValue("@TipoUsuario", "Tipo do Usuário"); // Substitua pelo tipo de usuário apropriado.
                    cmd.Parameters.AddWithValue("@Foto", imagePath);
                    cmd.ExecuteNonQuery();
                }
            }

            MessageBox.Show("Usuário cadastrado com sucesso!");
        }


        // Método para criar um hash da senha.
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

        //string savePathGlobal; // Variável global para armazenar o caminho da imagem

        private void btnFoto_Click(object sender, EventArgs e)
        {
            OpenFileDialog openFileDialog = new OpenFileDialog();
            openFileDialog.Filter = "Imagens (*.BMP;*.JPG;*.GIF,*.PNG)|*.BMP;*.JPG;*.GIF;*.PNG";
            openFileDialog.Title = "Selecione a imagem";

            if (openFileDialog.ShowDialog() == DialogResult.OK)
            {
                string sourcePath = openFileDialog.FileName;
                string targetPath = @"C:\GIT\SYS_BROKEN\bd\imagens\" + txbUsuario.Text + Path.GetExtension(sourcePath);

                System.IO.File.Copy(sourcePath, targetPath, true);

                pictureBox1.ImageLocation = targetPath;
                pictureBox1.SizeMode = PictureBoxSizeMode.StretchImage;
            }
        }


        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}
