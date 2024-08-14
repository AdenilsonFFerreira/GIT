using System;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    internal static class Program
    {
        /// <summary>
        /// Ponto de entrada principal para o aplicativo.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new FormLogin());
            /*
            Login login = new Login("user1", "user1");
            Usuario usuario = new Usuario(
                "user",
                "end",
                "200",
                "bairo",
                "cidade",
                "cepaqui",
                "cpf",
                "email",
                "m",
                "123",
                "321");
            Conexao conexao = new Conexao();
            Console.WriteLine(conexao.cadastrar_usuario(login));
            Console.WriteLine(conexao.inserir_usuario(usuario));
            */
        }
    }
}
