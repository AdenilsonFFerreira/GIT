using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace WindowsFormsApp1
{

    public class Papel
    {
        public String acao;
        public int qtd;
        public double valor;
        private string text;
        private int v;
        private decimal valor1;

        public Papel(String acao, int qtd, double valor)
        {
            this.acao = acao;
            this.valor = valor;
            this.qtd = qtd;
        }

        public Papel(string text, int v, decimal valor1)
        {
            this.text = text;
            this.v = v;
            this.valor1 = valor1;
        }
    }
}

