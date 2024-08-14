using System;
using System.Windows.Forms;

namespace WindowsFormsApp1.carregarperfil
{
    public partial class carregarperfil : Form
    {
        public carregarperfil()
        {
            InitializeComponent();
        }

        private void carregarperfil_Load(object sender, EventArgs e)
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
