﻿using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace WindowsFormsApp1.fi
{
    public partial class fi : Form
    {
        public fi()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }

        private void btnVoltar_Click(object sender, EventArgs e)
        {
            this.Close();
            FormModoOP form4 = new FormModoOP();
            form4.Show();
        }
    }
}