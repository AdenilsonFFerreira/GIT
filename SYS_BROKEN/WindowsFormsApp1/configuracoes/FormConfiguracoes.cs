using System;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class FormConfiguracoes : Form
    {
        public FormConfiguracoes()
        {
            InitializeComponent();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }

        private void btnAlerta_Click(object sender, EventArgs e)
        {

        }
    }
}
