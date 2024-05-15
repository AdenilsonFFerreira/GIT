using System;
using System.Windows.Forms;

namespace WindowsFormsApp1.patrimonio
{
    public partial class patrimonio : Form
    {
        public patrimonio()
        {
            InitializeComponent();
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
    }
}
