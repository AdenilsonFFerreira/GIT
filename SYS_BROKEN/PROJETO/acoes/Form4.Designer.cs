namespace acoes
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
            this.btnAdicionar = new System.Windows.Forms.Button();
            this.btnRemover = new System.Windows.Forms.Button();
            this.lblValorcompra = new System.Windows.Forms.Label();
            this.lblAcao = new System.Windows.Forms.Label();
            this.txtAcao = new System.Windows.Forms.TextBox();
            this.txtValor = new System.Windows.Forms.TextBox();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.lblRemocao = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // btnAdicionar
            // 
            this.btnAdicionar.Location = new System.Drawing.Point(608, 159);
            this.btnAdicionar.Name = "btnAdicionar";
            this.btnAdicionar.Size = new System.Drawing.Size(109, 36);
            this.btnAdicionar.TabIndex = 0;
            this.btnAdicionar.Text = "ADICIONAR AÇÃO";
            this.btnAdicionar.UseVisualStyleBackColor = true;
            this.btnAdicionar.Click += new System.EventHandler(this.btnAdicionar_Click);
            // 
            // btnRemover
            // 
            this.btnRemover.Location = new System.Drawing.Point(608, 323);
            this.btnRemover.Name = "btnRemover";
            this.btnRemover.Size = new System.Drawing.Size(109, 36);
            this.btnRemover.TabIndex = 1;
            this.btnRemover.Text = "REMOVER AÇÃO";
            this.btnRemover.UseVisualStyleBackColor = true;
            this.btnRemover.Click += new System.EventHandler(this.button2_Click);
            // 
            // lblValorcompra
            // 
            this.lblValorcompra.AutoSize = true;
            this.lblValorcompra.Location = new System.Drawing.Point(669, 85);
            this.lblValorcompra.Name = "lblValorcompra";
            this.lblValorcompra.Size = new System.Drawing.Size(110, 13);
            this.lblValorcompra.TabIndex = 2;
            this.lblValorcompra.Text = "VALOR DA COMPRA";
            // 
            // lblAcao
            // 
            this.lblAcao.AutoSize = true;
            this.lblAcao.Location = new System.Drawing.Point(569, 85);
            this.lblAcao.Name = "lblAcao";
            this.lblAcao.Size = new System.Drawing.Size(36, 13);
            this.lblAcao.TabIndex = 3;
            this.lblAcao.Text = "AÇÃO";
            this.lblAcao.Click += new System.EventHandler(this.lblAcao_Click);
            // 
            // txtAcao
            // 
            this.txtAcao.Location = new System.Drawing.Point(537, 115);
            this.txtAcao.Name = "txtAcao";
            this.txtAcao.Size = new System.Drawing.Size(100, 20);
            this.txtAcao.TabIndex = 4;
            // 
            // txtValor
            // 
            this.txtValor.Location = new System.Drawing.Point(672, 115);
            this.txtValor.Name = "txtValor";
            this.txtValor.Size = new System.Drawing.Size(100, 20);
            this.txtValor.TabIndex = 5;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(598, 286);
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(132, 20);
            this.textBox1.TabIndex = 6;
            // 
            // lblRemocao
            // 
            this.lblRemocao.AutoSize = true;
            this.lblRemocao.Location = new System.Drawing.Point(623, 253);
            this.lblRemocao.Name = "lblRemocao";
            this.lblRemocao.Size = new System.Drawing.Size(85, 13);
            this.lblRemocao.TabIndex = 7;
            this.lblRemocao.Text = "DIGITE A AÇÃO";
            this.lblRemocao.Click += new System.EventHandler(this.label1_Click);
            // 
            // Form4
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.lblRemocao);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.txtValor);
            this.Controls.Add(this.txtAcao);
            this.Controls.Add(this.lblAcao);
            this.Controls.Add(this.lblValorcompra);
            this.Controls.Add(this.btnRemover);
            this.Controls.Add(this.btnAdicionar);
            this.Name = "Form4";
            this.Text = "OPERCAÇÃO DO DIA";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Button btnAdicionar;
        private System.Windows.Forms.Button btnRemover;
        private System.Windows.Forms.Label lblValorcompra;
        private System.Windows.Forms.Label lblAcao;
        private System.Windows.Forms.TextBox txtAcao;
        private System.Windows.Forms.TextBox txtValor;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.Label lblRemocao;
    }
}