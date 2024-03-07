namespace açoes
{
    partial class Form4
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            btnOperacao = new Button();
            btnAnalise = new Button();
            btnFi = new Button();
            btnRelatorios = new Button();
            btnConfiguracao = new Button();
            SuspendLayout();
            // 
            // btnOperacao
            // 
            btnOperacao.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnOperacao.Location = new Point(31, 60);
            btnOperacao.Name = "btnOperacao";
            btnOperacao.Size = new Size(153, 50);
            btnOperacao.TabIndex = 5;
            btnOperacao.Text = "Operação";
            btnOperacao.UseVisualStyleBackColor = true;
            btnOperacao.Click += btnOperacao_Click;
            // 
            // btnAnalise
            // 
            btnAnalise.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnAnalise.Location = new Point(225, 60);
            btnAnalise.Name = "btnAnalise";
            btnAnalise.Size = new Size(153, 50);
            btnAnalise.TabIndex = 6;
            btnAnalise.Text = "Analise";
            btnAnalise.UseVisualStyleBackColor = true;
            // 
            // btnFi
            // 
            btnFi.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnFi.Location = new Point(416, 60);
            btnFi.Name = "btnFi";
            btnFi.Size = new Size(153, 50);
            btnFi.TabIndex = 7;
            btnFi.Text = "FI";
            btnFi.UseVisualStyleBackColor = true;
            // 
            // btnRelatorios
            // 
            btnRelatorios.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnRelatorios.Location = new Point(314, 163);
            btnRelatorios.Name = "btnRelatorios";
            btnRelatorios.Size = new Size(153, 50);
            btnRelatorios.TabIndex = 8;
            btnRelatorios.Text = "Relatorios";
            btnRelatorios.UseVisualStyleBackColor = true;
            // 
            // btnConfiguracao
            // 
            btnConfiguracao.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnConfiguracao.Location = new Point(109, 163);
            btnConfiguracao.Name = "btnConfiguracao";
            btnConfiguracao.Size = new Size(153, 50);
            btnConfiguracao.TabIndex = 9;
            btnConfiguracao.Text = "Configurações";
            btnConfiguracao.UseVisualStyleBackColor = true;
            // 
            // Form4
            // 
            AllowDrop = true;
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(582, 265);
            Controls.Add(btnConfiguracao);
            Controls.Add(btnRelatorios);
            Controls.Add(btnFi);
            Controls.Add(btnAnalise);
            Controls.Add(btnOperacao);
            Name = "Form4";
            Text = "MODO DE OPERAÇÃO";
            ResumeLayout(false);
        }

        #endregion
        private Button btnOperacao;
        private Button btnAnalise;
        private Button btnFi;
        private Button btnRelatorios;
        private Button btnConfiguracao;
    }
}