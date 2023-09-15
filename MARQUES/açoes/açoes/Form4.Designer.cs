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
            btnOperacao.Size = new Size(137, 44);
            btnOperacao.TabIndex = 5;
            btnOperacao.Text = "Operação";
            btnOperacao.UseVisualStyleBackColor = true;
            // 
            // btnAnalise
            // 
            btnAnalise.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnAnalise.Location = new Point(225, 60);
            btnAnalise.Name = "btnAnalise";
            btnAnalise.Size = new Size(137, 44);
            btnAnalise.TabIndex = 6;
            btnAnalise.Text = "Analise";
            btnAnalise.UseVisualStyleBackColor = true;
            // 
            // btnFi
            // 
            btnFi.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnFi.Location = new Point(416, 60);
            btnFi.Name = "btnFi";
            btnFi.Size = new Size(137, 44);
            btnFi.TabIndex = 7;
            btnFi.Text = "FI";
            btnFi.UseVisualStyleBackColor = true;
            // 
            // btnRelatorios
            // 
            btnRelatorios.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnRelatorios.Location = new Point(327, 171);
            btnRelatorios.Name = "btnRelatorios";
            btnRelatorios.Size = new Size(137, 44);
            btnRelatorios.TabIndex = 8;
            btnRelatorios.Text = "Relatorios";
            btnRelatorios.UseVisualStyleBackColor = true;
            // 
            // btnConfiguracao
            // 
            btnConfiguracao.Font = new Font("Segoe UI", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnConfiguracao.Location = new Point(122, 171);
            btnConfiguracao.Name = "btnConfiguracao";
            btnConfiguracao.Size = new Size(137, 44);
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