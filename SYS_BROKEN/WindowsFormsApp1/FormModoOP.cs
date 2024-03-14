using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1
{
    public partial class FormModoOP : Form
    {
        public FormModoOP()
        {
            InitializeComponent();
        }

        private void BtnOperacao_Click(object sender, EventArgs e)
        {
            FormOperacao form5 = new FormOperacao();
            form5.Show();
            this.Close();
        }

        private void btnFechar_Click(object sender, EventArgs e)
        {
            // Exiba uma caixa de diálogo de confirmação
            DialogResult result = MessageBox.Show("Tem certeza de que deseja sair?", "Confirmação", MessageBoxButtons.OKCancel);

            // Se o usuário clicou em OK, feche o aplicativo
            if (result == DialogResult.OK)
            {
                Application.Exit();
            }
        }

        private void btnRelatorio_Click(object sender, EventArgs e)
        {
            FormRelatorio form6 = new FormRelatorio();
            form6.Show();
            this.Close();
        }

        private void btnConfiguracao_Click(object sender, EventArgs e)
        {
            FormConfiguracoes form5 = new FormConfiguracoes();
            form5.Show();
            this.Close();
        }

        private void btnPerfil_Click(object sender, EventArgs e)
        {

        }

        private void btnProvisao_Click(object sender, EventArgs e)
        {           
            provisao formProvisao = new provisao();          
            formProvisao.Show();
        }

    }
}
}
