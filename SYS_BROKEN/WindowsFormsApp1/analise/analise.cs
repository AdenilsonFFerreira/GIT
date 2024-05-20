using System;
using System.Windows.Forms;

namespace WindowsFormsApp1.analise
{
    public partial class analise : Form
    {
        public analise()
        {
            InitializeComponent();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }

        private void analise_Load(object sender, EventArgs e)
        {

        }
    }
}
