using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp1
{
    public class Usuario
    {
        public String nome;
        public String endereco;
        public int numero;
        public String bairro;
        public String cidade;
        public int cep;
        public int cpf;
        public String email;
        public String sexo;
        public int celular;
        public int telefone;

        public Usuario(String nome, String endereco, int numero, String bairro, String cidade,
        int cep, int cpf, String email, String sexo, int celular, int telefone)
        { 
            this.nome = nome;
            this.endereco = endereco;
	        this.numero = numero;
	        this.bairro = bairro;
	        this.cidade = cidade;
	        this.cep = cep;
	        this.cpf = cpf;
	        this.email = email;
            this.sexo = sexo;
            this.celular = celular;
            this.telefone = telefone;
        }
    }
}
