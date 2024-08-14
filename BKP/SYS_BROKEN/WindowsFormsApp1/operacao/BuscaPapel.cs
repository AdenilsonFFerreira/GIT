using System;

namespace WindowsFormsApp1
{

    public class BuscaPapel
    {
        public String acao;
        public int qtd;
        public float valor;

        public BuscaPapel(String acao, int qtd, float valor)
        {
            this.acao = acao;
            this.valor = valor;
            this.qtd = qtd;
        }
    }
}