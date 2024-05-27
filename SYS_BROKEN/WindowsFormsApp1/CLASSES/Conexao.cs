using System;
using System.Data;
using System.Data.SqlClient;


namespace WindowsFormsApp1
{
    public class Conexao
    {
        SqlConnection con = new SqlConnection();

        //CONSTRUTOR
        public Conexao()
        {
            con.ConnectionString = "Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True";
        }

        //METODO CONECTAR
        public SqlConnection Conectar()
        {
            if (con.State == System.Data.ConnectionState.Closed)
            {
                con.Open();
            }
            return con;

        }

        //METODO DESCONECTAR
        public void Desconectar()
        {
            if (con.State == System.Data.ConnectionState.Open)
            {
                con.Close();
            }
        }

        //METODO CADASTRAR PAPEL
        public String Cadastrar_Papel(Papel papel)
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
                cmd.Connection = this.Conectar();
                //executar comando
                cmd.ExecuteNonQuery();
                //desconectar
                this
                    .Desconectar();
                //mostrar mensagem de erro ou sucesso  --variavel
                mensagem = "Cadastrado com Sucesso!!";

            }
            catch (SqlException e)
            {
                mensagem = "Erro: " + e.Message;
            }
            return mensagem;
        }

        //METODO CADASTRAR USUARIO
        public String Cadastrar_Usuario(Login login)
        {
            Console.WriteLine("cadastrar_usuario foi chamado");
            SqlCommand cmd = new SqlCommand();
            String mensagem;

            //comando sql  --SqlCommand
            cmd.CommandText = "insert into LOGIN (Usuario, Senha, Foto) values (@usuario, @senha, @foto)";

            //parametros
            cmd.Parameters.AddWithValue("@usuario", login.Usuario);
            cmd.Parameters.AddWithValue("@senha", login.Senha);
            cmd.Parameters.AddWithValue("@foto", login.Foto);

            try
            {
                //concetar com banco  --Conexao
                cmd.Connection = this.Conectar();
                //executar comando
                cmd.ExecuteNonQuery();
                //desconectar
                this.Desconectar();
                //mostrar mensagem de erro ou sucesso  --variavel
                mensagem = "Cadastrado com Sucesso!!";

            }
            catch (SqlException e)
            {
                mensagem = "Erro: " + e.Message;
            }
            return mensagem;

        }

        //METODO USUARIO
        public String Inserir_Usuario(Usuario usuario)
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
                cmd.Connection = this.Conectar();
                // executar comando
                cmd.ExecuteNonQuery();
                // desconectar
                this.Desconectar();
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

        //METODO CADASTRAR PROVISAO
        public String Cadastrar_Provisao(Provisao provisao)
        {
            SqlCommand cmd = new SqlCommand();
            String mensagem;

            //comando sql  --SqlCommand
            cmd.CommandText = "INSERT INTO PROVISAO (Acao, Div_Valor, Data_Com, Data_Pag) values (@acao, @div_valor, @data_com, @data_pag)";

            //parametros
            cmd.Parameters.AddWithValue("@acao", provisao.acao);
            cmd.Parameters.AddWithValue("@div_valor", provisao.div_valor);
            cmd.Parameters.AddWithValue("@data_com", provisao.data_com);
            cmd.Parameters.AddWithValue("@data_pag", provisao.data_pag);

            try
            {
                //concetar com banco  --Conexao
                cmd.Connection = this.Conectar();
                //executar comando
                cmd.ExecuteNonQuery();
                //desconectar
                this
                    .Desconectar();
                //mostrar mensagem de erro ou sucesso  --variavel
                mensagem = "Cadastrado com Sucesso!!";

            }
            catch (SqlException e)
            {
                mensagem = "Erro: " + e.Message;
            }
            return mensagem;
        }

        //METODO BUSCAR USUARIO
        public Usuario Buscar_Usuario(String CPF)
        {
            return new Usuario();
        }


        public Papel[] posicao_consolidade()
        {
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "SELECT Acao, SUM(Quantidade) as Qtd, SUM(Valor) / COUNT(Acao) as VlrMedio from PAPEL GROUP BY Acao";
            Papel[] papeis = new Papel[1];
            String mensagem = String.Empty;
            DataTable dataTable = new DataTable();
            try
            {
                cmd.Connection = this.Conectar();
                SqlDataReader reader = cmd.ExecuteReader();
                dataTable.Load(reader);
                papeis = new Papel[dataTable.Rows.Count];
                for (int row = 0; row < papeis.Length; row++)
                {
                    papeis[row] = new Papel(
                        (string)dataTable.Rows[row][0],
                        (int)dataTable.Rows[row][1],
                        (double)dataTable.Rows[row][2]
                    );
                }

            }
            catch (SqlException e)
            {
                // mensagem de erro
                mensagem = "Erro ao cadastrar usuário: " + e.Message;
            }
            return papeis;
        }


    }
}
