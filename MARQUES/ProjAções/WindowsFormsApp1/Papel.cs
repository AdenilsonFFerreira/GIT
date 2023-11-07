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
        public int valor;

        public Papel(String acao,  int qtd, int valor)
        {
            this.acao = acao;
            this.valor = valor;
            this.qtd = qtd;
        }
    }
}

