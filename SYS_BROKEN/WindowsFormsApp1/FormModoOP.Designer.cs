namespace WindowsFormsApp1
{
    partial class FormModoOP
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
            this.btnOperacao = new System.Windows.Forms.Button();
            this.btnAnalise = new System.Windows.Forms.Button();
            this.btnFi = new System.Windows.Forms.Button();
            this.btnConfiguracao = new System.Windows.Forms.Button();
            this.btnRelatorio = new System.Windows.Forms.Button();
            this.btnFechar = new System.Windows.Forms.Button();
            this.btnPerfil = new System.Windows.Forms.Button();
            this.btnProvisao = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btnOperacao
            // 
            this.btnOperacao.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnOperacao.Location = new System.Drawing.Point(11, 32);
            this.btnOperacao.Name = "btnOperacao";
            this.btnOperacao.Size = new System.Drawing.Size(147, 58);
            this.btnOperacao.TabIndex = 0;
            this.btnOperacao.Text = "Operação";
            this.btnOperacao.UseVisualStyleBackColor = true;
            this.btnOperacao.Click += new System.EventHandler(this.BtnOperacao_Click);
            // 
            // btnAnalise
            // 
            this.btnAnalise.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnAnalise.Location = new System.Drawing.Point(99, 147);
            this.btnAnalise.Name = "btnAnalise";
            this.btnAnalise.Size = new System.Drawing.Size(147, 58);
            this.btnAnalise.TabIndex = 1;
            this.btnAnalise.Text = "Analise";
            this.btnAnalise.UseVisualStyleBackColor = true;
            // 
            // btnFi
            // 
            this.btnFi.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFi.Location = new System.Drawing.Point(376, 32);
            this.btnFi.Name = "btnFi";
            this.btnFi.Size = new System.Drawing.Size(147, 58);
            this.btnFi.TabIndex = 2;
            this.btnFi.Text = "FI";
            this.btnFi.UseVisualStyleBackColor = true;
            // 
            // btnConfiguracao
            // 
            this.btnConfiguracao.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnConfiguracao.Location = new System.Drawing.Point(99, 246);
            this.btnConfiguracao.Name = "btnConfiguracao";
            this.btnConfiguracao.Size = new System.Drawing.Size(147, 58);
            this.btnConfiguracao.TabIndex = 3;
            this.btnConfiguracao.Text = "Configurações";
            this.btnConfiguracao.UseVisualStyleBackColor = true;
            this.btnConfiguracao.Click += new System.EventHandler(this.btnConfiguracao_Click);
            // 
            // btnRelatorio
            // 
            this.btnRelatorio.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnRelatorio.Location = new System.Drawing.Point(290, 147);
            this.btnRelatorio.Name = "btnRelatorio";
            this.btnRelatorio.Size = new System.Drawing.Size(147, 58);
            this.btnRelatorio.TabIndex = 4;
            this.btnRelatorio.Text = "Relatorios";
            this.btnRelatorio.UseVisualStyleBackColor = true;
            this.btnRelatorio.Click += new System.EventHandler(this.btnRelatorio_Click);
            // 
            // btnFechar
            // 
            this.btnFechar.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnFechar.Location = new System.Drawing.Point(210, 333);
            this.btnFechar.Name = "btnFechar";
            this.btnFechar.Size = new System.Drawing.Size(116, 44);
            this.btnFechar.TabIndex = 5;
            this.btnFechar.Text = "Fechar";
            this.btnFechar.UseVisualStyleBackColor = true;
            this.btnFechar.Click += new System.EventHandler(this.btnFechar_Click);
            // 
            // btnPerfil
            // 
            this.btnPerfil.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnPerfil.Location = new System.Drawing.Point(290, 246);
            this.btnPerfil.Name = "btnPerfil";
            this.btnPerfil.Size = new System.Drawing.Size(147, 58);
            this.btnPerfil.TabIndex = 6;
            this.btnPerfil.Text = "Carregar Perfil";
            this.btnPerfil.UseVisualStyleBackColor = true;
            this.btnPerfil.Click += new System.EventHandler(this.btnPerfil_Click);
            // 
            // btnProvisao
            // 
            this.btnProvisao.Font = new System.Drawing.Font("Microsoft Sans Serif", 14.25F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btnProvisao.Location = new System.Drawing.Point(192, 32);
            this.btnProvisao.Name = "btnProvisao";
            this.btnProvisao.Size = new System.Drawing.Size(147, 58);
            this.btnProvisao.TabIndex = 7;
            this.btnProvisao.Text = "Provisão";
            this.btnProvisao.UseVisualStyleBackColor = true;
            this.btnProvisao.Click += new System.EventHandler(this.btnProvisao_Click);
            // 
            // FormModoOP
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(537, 389);
            this.Controls.Add(this.btnProvisao);
            this.Controls.Add(this.btnPerfil);
            this.Controls.Add(this.btnFechar);
            this.Controls.Add(this.btnRelatorio);
            this.Controls.Add(this.btnConfiguracao);
            this.Controls.Add(this.btnFi);
            this.Controls.Add(this.btnAnalise);
            this.Controls.Add(this.btnOperacao);
            this.Name = "FormModoOP";
            this.Text = "MODO DE OPERAÇÃO";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btnOperacao;
        private System.Windows.Forms.Button btnAnalise;
        private System.Windows.Forms.Button btnFi;
        private System.Windows.Forms.Button btnConfiguracao;
        private System.Windows.Forms.Button btnRelatorio;
        private System.Windows.Forms.Button btnFechar;
        private System.Windows.Forms.Button btnPerfil;
        private System.Windows.Forms.Button btnProvisao;
    }
}