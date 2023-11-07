using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography.X509Certificates;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp1
{
    public class Cadastro
    {
        public String mensagem;
        public Cadastro(String acao, String quantidade, String valor)
        {
            Conexao conexao = new Conexao();
            SqlCommand cmd = new SqlCommand();


        //comando sql  --SqlCommand
        cmd.CommandText = "insert into PAPEL (Acao, Quantidade, Valor) values (@acao, @quantidade, @valor)";

            //parametros
            cmd.Parameters.AddWithValue("@acao",acao);
            cmd.Parameters.AddWithValue("@quantidade",quantidade);
            cmd.Parameters.AddWithValue("@valor",valor);


            try
            {
                //concetar com banco  --Conexao
                cmd.Connection = conexao.conectar();
                //executar comando
                cmd.ExecuteNonQuery();
                //desconectar
                conexao.desconectar();
                //mostrar mensagem de erro ou sucesso  --variavel
                this.mensagem = "Cadastrado com Sucesso!!";

            }
            catch (SqlException e)
            {
                this.mensagem = "Erro: " + e.Message;
            }
        }
    }
}
