namespace acoes
{
    partial class Form2
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
            this.lbloperacao = new System.Windows.Forms.Label();
            this.btnCompravenda = new System.Windows.Forms.Button();
            this.btnOpdia = new System.Windows.Forms.Button();
            this.btnAnalise = new System.Windows.Forms.Button();
            this.btnProvisao = new System.Windows.Forms.Button();
            this.btnRelatorio = new System.Windows.Forms.Button();
            this.btnPerfil = new System.Windows.Forms.Button();
            this.btnConfiguracao = new System.Windows.Forms.Button();
            this.btnDividendo = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // lbloperacao
            // 
            this.lbloperacao.AutoSize = true;
            this.lbloperacao.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.lbloperacao.Location = new System.Drawing.Point(270, 64);
            this.lbloperacao.Name = "lbloperacao";
            this.lbloperacao.Size = new System.Drawing.Size(226, 24);
            this.lbloperacao.TabIndex = 0;
            this.lbloperacao.Text = "MODE DE OPERAÇÃO";
            this.lbloperacao.Click += new System.EventHandler(this.label1_Click);
            // 
            // btnCompravenda
            // 
            this.btnCompravenda.Location = new System.Drawing.Point(156, 150);
            this.btnCompravenda.Name = "btnCompravenda";
            this.btnCompravenda.Size = new System.Drawing.Size(136, 30);
            this.btnCompravenda.TabIndex = 4;
            this.btnCompravenda.Text = "COMPRA E VENDA";
            this.btnCompravenda.UseVisualStyleBackColor = true;
            // 
            // btnOpdia
            // 
            this.btnOpdia.Location = new System.Drawing.Point(156, 205);
            this.btnOpdia.Name = "btnOpdia";
            this.btnOpdia.Size = new System.Drawing.Size(136, 30);
            this.btnOpdia.TabIndex = 5;
            this.btnOpdia.Text = "OPERCAÇÃO DO DIA";
            this.btnOpdia.UseVisualStyleBackColor = true;
            // 
            // btnAnalise
            // 
            this.btnAnalise.Location = new System.Drawing.Point(156, 272);
            this.btnAnalise.Name = "btnAnalise";
            this.btnAnalise.Size = new System.Drawing.Size(136, 30);
            this.btnAnalise.TabIndex = 6;
            this.btnAnalise.Text = "ANALISE";
            this.btnAnalise.UseVisualStyleBackColor = true;
            // 
            // btnProvisao
            // 
            this.btnProvisao.Location = new System.Drawing.Point(156, 334);
            this.btnProvisao.Name = "btnProvisao";
            this.btnProvisao.Size = new System.Drawing.Size(136, 30);
            this.btnProvisao.TabIndex = 7;
            this.btnProvisao.Text = "PROVISÃO";
            this.btnProvisao.UseVisualStyleBackColor = true;
            // 
            // btnRelatorio
            // 
            this.btnRelatorio.Location = new System.Drawing.Point(520, 205);
            this.btnRelatorio.Name = "btnRelatorio";
            this.btnRelatorio.Size = new System.Drawing.Size(136, 30);
            this.btnRelatorio.TabIndex = 8;
            this.btnRelatorio.Text = "RELATORIOS";
            this.btnRelatorio.UseVisualStyleBackColor = true;
            // 
            // btnPerfil
            // 
            this.btnPerfil.Location = new System.Drawing.Point(520, 272);
            this.btnPerfil.Name = "btnPerfil";
            this.btnPerfil.Size = new System.Drawing.Size(136, 30);
            this.btnPerfil.TabIndex = 9;
            this.btnPerfil.Text = "CARREGAR PERFIL";
            this.btnPerfil.UseVisualStyleBackColor = true;
            // 
            // btnConfiguracao
            // 
            this.btnConfiguracao.Location = new System.Drawing.Point(520, 334);
            this.btnConfiguracao.Name = "btnConfiguracao";
            this.btnConfiguracao.Size = new System.Drawing.Size(136, 30);
            this.btnConfiguracao.TabIndex = 10;
            this.btnConfiguracao.Text = "CONFIGURAÇÕES";
            this.btnConfiguracao.UseVisualStyleBackColor = true;
            // 
            // btnDividendo
            // 
            this.btnDividendo.Location = new System.Drawing.Point(520, 150);
            this.btnDividendo.Name = "btnDividendo";
            this.btnDividendo.Size = new System.Drawing.Size(136, 30);
            this.btnDividendo.TabIndex = 11;
            this.btnDividendo.Text = "DIVIDENDO";
            this.btnDividendo.UseVisualStyleBackColor = true;
            // 
            // Form2
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.btnDividendo);
            this.Controls.Add(this.btnConfiguracao);
            this.Controls.Add(this.btnPerfil);
            this.Controls.Add(this.btnRelatorio);
            this.Controls.Add(this.btnProvisao);
            this.Controls.Add(this.btnAnalise);
            this.Controls.Add(this.btnOpdia);
            this.Controls.Add(this.btnCompravenda);
            this.Controls.Add(this.lbloperacao);
            this.Name = "Form2";
            this.Text = "OPERAÇÃO";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label lbloperacao;
        private System.Windows.Forms.Button btnCompravenda;
        private System.Windows.Forms.Button btnOpdia;
        private System.Windows.Forms.Button btnAnalise;
        private System.Windows.Forms.Button btnProvisao;
        private System.Windows.Forms.Button btnRelatorio;
        private System.Windows.Forms.Button btnPerfil;
        private System.Windows.Forms.Button btnConfiguracao;
        private System.Windows.Forms.Button btnDividendo;
    }
}