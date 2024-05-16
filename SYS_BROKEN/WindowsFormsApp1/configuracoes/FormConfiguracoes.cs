using System;
using System.Windows.Forms;
using Microsoft.SqlServer.Management.Smo;
using Microsoft.SqlServer.Management.Common;

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

        private void btnBackup_Click(object sender, EventArgs e)
        {
            string databaseName = "ProjAcoes";
            string filePath = @"C:\backup.bak"; // Caminho onde o backup será salvo

            Server dbServer = new Server(new ServerConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"));
            Backup dbBackup = new Backup() { Action = BackupActionType.Database, Database = databaseName };
            dbBackup.Devices.AddDevice(filePath, DeviceType.File);
            dbBackup.SqlBackupAsync(dbServer);
        }

        private void btnRestore_Click(object sender, EventArgs e)
        {
            string databaseName = "ProjAcoes";
            string filePath = @"C:\backup.bak"; // Caminho do arquivo de backup

            Server dbServer = new Server(new ServerConnection("Data Source=SNVME\\SQLEXPRESS;Initial Catalog=ProjAcoes;Integrated Security=True"));
            Restore dbRestore = new Restore() { Database = databaseName, Action = RestoreActionType.Database, ReplaceDatabase = true, NoRecovery = false };
            dbRestore.Devices.AddDevice(filePath, DeviceType.File);
            dbRestore.SqlRestoreAsync(dbServer);
        }
    }
}
