using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Data;

namespace WindowsFormsApp1
{
    public class Conexao
    {
        SqlConnection con = new SqlConnection();
        
        //contrutor
        public Conexao()
        {
            con.ConnectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
        }

        //metodo conectar
        public SqlConnection conectar()
        {
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open(); 
            }
            return con;

        }
        //metodo desconectar
        public void desconectar()
        {
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
        }

        public String cadastrar_papel(Papel papel)
        {
            SqlCommand cmd = new SqlCommand();
            String mensagem;

            //comando sql  --SqlCommand
            cmd.CommandText = "insert into PAPEL (Acao, Quantidade, Valor) values (@acao, @quantidade, @valor)";

            //parametros
            cmd.Parameters.AddWithValue("@acao", papel.acao);
            cmd.Parameters.AddWithValue("@quantidade", papel.qtd);
            cmd.Parameters.AddWithValue("@valor", papel.valor);

            try
            {
                //concetar com banco  --Conexao
                cmd.Connection = this.conectar();
                //executar comando
                cmd.ExecuteNonQuery();
                //desconectar
                this.desconectar();
                //mostrar mensagem de erro ou sucesso  --variavel
                mensagem = "Cadastrado com Sucesso!!";

            }
            catch (SqlException e)
            {
                mensagem = "Erro: " + e.Message;
            }
            return mensagem;
        }

        public String cadastrar_usuario(Login login)
        {
            Console.WriteLine("cadastrar_usuario foi chamado");
            SqlCommand cmd = new SqlCommand();
            String mensagem;

            //comando sql  --SqlCommand
            cmd.CommandText = "insert into LOGIN (Usuario, Senha) values (@usuario, @senha)";

            //parametros
            cmd.Parameters.AddWithValue("@usuario", login.usuario);
            cmd.Parameters.AddWithValue("@senha", login.senha);

            try
            {
                //concetar com banco  --Conexao
                cmd.Connection = this.conectar();
                //executar comando
                cmd.ExecuteNonQuery();
                //desconectar
                this.desconectar();
                //mostrar mensagem de erro ou sucesso  --variavel
                mensagem = "Cadastrado com Sucesso!!";

            }
            catch (SqlException e)
            {
                mensagem = "Erro: " + e.Message;
            }
            return mensagem;

        }

        public String inserir_usuario(Usuario usuario)
            {
                SqlCommand cmd = new SqlCommand();
                String mensagem;

                // comando SQL
                cmd.CommandText = "INSERT INTO USUARIO (Nome, Endereco, Numero, Bairro, Cidade, CEP, CPF, Email, Sexo, Celular, Telefone) VALUES (@nome, @endereco, @numero, @bairro, @cidade, @cep, @cpf, @email, @sexo, @celular, @telefone)";

                // parâmetros
                cmd.Parameters.AddWithValue("@nome", usuario.nome);
                cmd.Parameters.AddWithValue("@endereco", usuario.endereco);
                cmd.Parameters.AddWithValue("@numero", usuario.numero);
                cmd.Parameters.AddWithValue("@bairro", usuario.bairro);
                cmd.Parameters.AddWithValue("@cidade", usuario.cidade);
                cmd.Parameters.AddWithValue("@cep", usuario.cep);
                cmd.Parameters.AddWithValue("@cpf", usuario.cpf);
                cmd.Parameters.AddWithValue("@email", usuario.email);
                cmd.Parameters.AddWithValue("@sexo", usuario.sexo);
                cmd.Parameters.AddWithValue("@celular", usuario.celular);
                cmd.Parameters.AddWithValue("@telefone", usuario.telefone);

                try
                {
                    // conectar com o banco
                    cmd.Connection = this.conectar();
                    // executar comando
                    cmd.ExecuteNonQuery();
                    // desconectar
                    this.desconectar();
                    // mensagem de sucesso
                    mensagem = "Usuário cadastrado com sucesso!";
                }
                catch (SqlException e)
                {
                    // mensagem de erro
                    mensagem = "Erro ao cadastrar usuário: " + e.Message;
                }

                return mensagem;
            }
        }
    /*

        public bool autenticar_usuario(String username, String password)
        {
            // verifica senha, true se ok, false se nao
            return true;
        }
    }
    */
}
