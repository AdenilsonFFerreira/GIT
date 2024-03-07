namespace açoes
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
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
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            lblUsuario = new Label();
            lblSenha = new Label();
            txbUsuario = new TextBox();
            txbSenha = new TextBox();
            btnOk = new Button();
            btnCancelar = new Button();
            lblRecuperar = new LinkLabel();
            lblCadastro = new LinkLabel();
            label1 = new Label();
            SuspendLayout();
            // 
            // lblUsuario
            // 
            lblUsuario.AutoSize = true;
            lblUsuario.Font = new Font("Microsoft Sans Serif", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            lblUsuario.Location = new Point(125, 141);
            lblUsuario.Name = "lblUsuario";
            lblUsuario.Size = new Size(84, 24);
            lblUsuario.TabIndex = 1;
            lblUsuario.Text = "Usuario: ";
            // 
            // lblSenha
            // 
            lblSenha.AutoSize = true;
            lblSenha.Font = new Font("Microsoft Sans Serif", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            lblSenha.Location = new Point(133, 198);
            lblSenha.Name = "lblSenha";
            lblSenha.Size = new Size(75, 24);
            lblSenha.TabIndex = 2;
            lblSenha.Text = "Senha: ";
            // 
            // txbUsuario
            // 
            txbUsuario.Font = new Font("Microsoft Sans Serif", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            txbUsuario.Location = new Point(204, 136);
            txbUsuario.Name = "txbUsuario";
            txbUsuario.Size = new Size(114, 29);
            txbUsuario.TabIndex = 3;
            // 
            // txbSenha
            // 
            txbSenha.Font = new Font("Microsoft Sans Serif", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            txbSenha.Location = new Point(204, 198);
            txbSenha.Name = "txbSenha";
            txbSenha.Size = new Size(114, 29);
            txbSenha.TabIndex = 4;
            // 
            // btnOk
            // 
            btnOk.Font = new Font("Microsoft Sans Serif", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnOk.Location = new Point(120, 325);
            btnOk.Name = "btnOk";
            btnOk.Size = new Size(104, 48);
            btnOk.TabIndex = 5;
            btnOk.Text = "OK";
            btnOk.UseVisualStyleBackColor = true;
            btnOk.Click += btnOk_Click;
            // 
            // btnCancelar
            // 
            btnCancelar.Font = new Font("Microsoft Sans Serif", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            btnCancelar.Location = new Point(265, 325);
            btnCancelar.Name = "btnCancelar";
            btnCancelar.Size = new Size(104, 48);
            btnCancelar.TabIndex = 6;
            btnCancelar.Text = "Cancelar";
            btnCancelar.UseVisualStyleBackColor = true;
            btnCancelar.Click += btnCancelar_Click;
            // 
            // lblRecuperar
            // 
            lblRecuperar.AutoSize = true;
            lblRecuperar.Font = new Font("Microsoft Sans Serif", 9.75F, FontStyle.Regular, GraphicsUnit.Point);
            lblRecuperar.Location = new Point(120, 253);
            lblRecuperar.Name = "lblRecuperar";
            lblRecuperar.Size = new Size(124, 16);
            lblRecuperar.TabIndex = 7;
            lblRecuperar.TabStop = true;
            lblRecuperar.Text = "Recuperar a Senha";
            lblRecuperar.LinkClicked += lblRecuperar_LinkClicked;
            // 
            // lblCadastro
            // 
            lblCadastro.AutoSize = true;
            lblCadastro.Font = new Font("Microsoft Sans Serif", 9.75F, FontStyle.Regular, GraphicsUnit.Point);
            lblCadastro.Location = new Point(307, 253);
            lblCadastro.Name = "lblCadastro";
            lblCadastro.Size = new Size(62, 16);
            lblCadastro.TabIndex = 8;
            lblCadastro.TabStop = true;
            lblCadastro.Text = "Cadastro";
            lblCadastro.LinkClicked += lblCadastro_LinkClicked;
            // 
            // label1
            // 
            label1.AutoSize = true;
            label1.Font = new Font("Microsoft Sans Serif", 14.25F, FontStyle.Regular, GraphicsUnit.Point);
            label1.Location = new Point(175, 57);
            label1.Name = "label1";
            label1.Size = new Size(120, 24);
            label1.TabIndex = 0;
            label1.Text = "Faça o Login";
            label1.Click += label1_Click;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(492, 450);
            Controls.Add(lblCadastro);
            Controls.Add(lblRecuperar);
            Controls.Add(btnCancelar);
            Controls.Add(btnOk);
            Controls.Add(txbSenha);
            Controls.Add(txbUsuario);
            Controls.Add(lblSenha);
            Controls.Add(lblUsuario);
            Controls.Add(label1);
            Name = "Form1";
            Text = "LOGIN";
            Load += Form1_Load;
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion
        private Label lblUsuario;
        private Label lblSenha;
        private TextBox txbUsuario;
        private TextBox txbSenha;
        private Button btnOk;
        private Button btnCancelar;
        private LinkLabel lblRecuperar;
        private LinkLabel lblCadastro;
        private Label label1;
    }
}