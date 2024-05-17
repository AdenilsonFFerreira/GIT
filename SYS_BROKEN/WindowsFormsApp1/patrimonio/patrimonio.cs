using System;
using System.Windows.Forms;
using System.Data;
using System.Data.SqlClient;

namespace WindowsFormsApp1
{
    public partial class Patrimonio : Form
    {
        
        public Patrimonio()
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void patrimonio_Load(object sender, EventArgs e)
        {

        }

        private void btnAdicionar_Click(object sender, EventArgs e)
        {
            // Cria uma nova instância da classe PatrimonioModel
            Patrimonio patrimonio = new Patrimonio();

            // Preenche as propriedades do objeto patrimonio com os valores dos TextBoxes
            patrimonio.Corretora = textBox1.Text;
            patrimonio.Valor = Convert.ToDecimal(textBox2.Text);

            // Cria uma nova instância da classe Conexao
            Conexao conexao = new Conexao();

            // Chama a função Cadastrar_Patrimonio
            String mensagem = conexao.Cadastrar_Patrimonio(patrimonio);

            // Mostra a mensagem retornada pela função
            MessageBox.Show(mensagem);
        }


    }
}
