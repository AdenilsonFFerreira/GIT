namespace WindowsFormsApp1
{
    public class Login
    {
        public string Usuario { get; set; }
        public string Senha { get; set; }
        public string Foto { get; set; }  // Novo campo para armazenar o caminho da foto

        public Login(string usuario, string senha)
        {
            Usuario = usuario;
            Senha = senha;
        }

        // Novo construtor que aceita o caminho da foto como um argumento
        public Login(string usuario, string senha, string foto)
        {
            Usuario = usuario;
            Senha = senha;
            Foto = foto;
        }
    }


}