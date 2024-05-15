using System;

namespace WindowsFormsApp1
{
    public class Usuario
    {
        public String nome;
        public String endereco;
        public String numero;
        public String bairro;
        public String cidade;
        public String cep;
        public String cpf;
        public String email;
        public String sexo;
        public String celular;
        public String telefone;

        public Usuario()
        {
            this.nome = String.Empty;
            this.endereco = String.Empty;
            this.numero = String.Empty;
            this.bairro = String.Empty;
            this.cidade = String.Empty;
            this.cep = String.Empty;
            this.cpf = String.Empty;
            this.email = String.Empty;
            this.sexo = String.Empty;
            this.celular = String.Empty;
            this.telefone = String.Empty;
        }
        public Usuario(String nome, String endereco, String numero, String bairro, String cidade,
        String cep, String cpf, String email, String sexo, String celular, String telefone)
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
