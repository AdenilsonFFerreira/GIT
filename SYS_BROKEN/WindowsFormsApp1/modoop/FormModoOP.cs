using System;
using System.Diagnostics;
using System.IO;
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
            // Caminho completo para o script Python
            string pythonScript = @"C:\SysBroken\utility\import.py";

            // Configuração do processo para executar o script Python
            ProcessStartInfo pythonProcessInfo = new ProcessStartInfo("python", pythonScript)
            {
                UseShellExecute = false,
                RedirectStandardOutput = true,
                CreateNoWindow = true
            };

            // Iniciando o processo
            using (Process pythonProcess = Process.Start(pythonProcessInfo))
            {
                using (StreamReader reader = pythonProcess.StandardOutput)
                {
                    // Lendo a saída do script Python
                    string output = reader.ReadToEnd();
                    Console.WriteLine(output);
                }
            }

            // Mostrando o formulário de operação
            FormOperacao form5 = new FormOperacao();
            form5.Show();

            // Fechando o formulário atual
            this.Close();
        }





        private void btnFechar_Click(object sender, EventArgs e)
        {
            DialogResult result = MessageBox.Show("Tem certeza de que deseja sair?", "Confirmação", MessageBoxButtons.OKCancel);
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
            var form = new WindowsFormsApp1.carregarperfil.carregarperfil();
            form.Show();
            this.Close();
        }



        private void btnProvisao_Click(object sender, EventArgs e)
        {
            var formProvisao = new WindowsFormsApp1.provisao.provisao();
            formProvisao.Show();
            this.Close();
        }


        private void btnFi_Click(object sender, EventArgs e)
        {
            var formFi = new WindowsFormsApp1.fi.fi();
            formFi.Show();
            this.Close();
        }


        private void btnAnalise_Click(object sender, EventArgs e)
        {
            var formAnalise = new WindowsFormsApp1.analise.analise();
            formAnalise.Show();
            this.Close();
        }

        private void btnPatrimonio_Click(object sender, EventArgs e)
        {
            var formPatrimonio = new WindowsFormsApp1.patrimonio.patrimonio();
            formPatrimonio.Show();
            this.Close();
        }


        private void FormModoOP_Load(object sender, EventArgs e)
        {

        }
    }
}

