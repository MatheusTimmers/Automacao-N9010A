﻿
namespace Automacao_N9010A
{
    partial class Form3
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
            this.ListaEnsaiosItem12 = new System.Windows.Forms.CheckedListBox();
            this.LEnsaiosItem12 = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // ListaEnsaiosItem12
            // 
            this.ListaEnsaiosItem12.FormattingEnabled = true;
            this.ListaEnsaiosItem12.Items.AddRange(new object[] {
            "Potência de saída",
            "Densidade espectral de potência",
            "Emissão fora da faixa"});
            this.ListaEnsaiosItem12.Location = new System.Drawing.Point(13, 72);
            this.ListaEnsaiosItem12.Margin = new System.Windows.Forms.Padding(4, 3, 4, 3);
            this.ListaEnsaiosItem12.Name = "ListaEnsaiosItem12";
            this.ListaEnsaiosItem12.Size = new System.Drawing.Size(295, 94);
            this.ListaEnsaiosItem12.TabIndex = 7;
            // 
            // LEnsaiosItem12
            // 
            this.LEnsaiosItem12.AutoSize = true;
            this.LEnsaiosItem12.BackColor = System.Drawing.Color.Transparent;
            this.LEnsaiosItem12.Font = new System.Drawing.Font("Microsoft Sans Serif", 9.75F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.LEnsaiosItem12.ForeColor = System.Drawing.SystemColors.ActiveCaptionText;
            this.LEnsaiosItem12.Location = new System.Drawing.Point(13, 24);
            this.LEnsaiosItem12.Margin = new System.Windows.Forms.Padding(4, 0, 4, 0);
            this.LEnsaiosItem12.Name = "LEnsaiosItem12";
            this.LEnsaiosItem12.Size = new System.Drawing.Size(307, 32);
            this.LEnsaiosItem12.TabIndex = 6;
            this.LEnsaiosItem12.Text = "Ensaios para 5150 a 5350MHz e 5470 a 5725MHz.. \r\nItem 12 da norma 6506.";
            // 
            // Form3
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(7F, 15F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.CornflowerBlue;
            this.ClientSize = new System.Drawing.Size(321, 186);
            this.Controls.Add(this.ListaEnsaiosItem12);
            this.Controls.Add(this.LEnsaiosItem12);
            this.Name = "Form3";
            this.Text = "Form3";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.CheckedListBox ListaEnsaiosItem12;
        private System.Windows.Forms.Label LEnsaiosItem12;
    }
}