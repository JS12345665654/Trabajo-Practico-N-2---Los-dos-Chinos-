namespace CapaPresentacion
{
    partial class frmcamaravigilancia
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
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.picboxcamaravigilancia = new System.Windows.Forms.PictureBox();
            this.cmbapagarencender = new System.Windows.Forms.ComboBox();
            this.btngrabar = new FontAwesome.Sharp.IconButton();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.picboxcamaravigilancia)).BeginInit();
            this.SuspendLayout();
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = global::CapaPresentacion.Properties.Resources.supermercado_los_dos_chinos_logo;
            this.pictureBox2.Location = new System.Drawing.Point(616, 2);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(339, 492);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.pictureBox2.TabIndex = 3;
            this.pictureBox2.TabStop = false;
            // 
            // picboxcamaravigilancia
            // 
            this.picboxcamaravigilancia.Location = new System.Drawing.Point(3, 24);
            this.picboxcamaravigilancia.Name = "picboxcamaravigilancia";
            this.picboxcamaravigilancia.Size = new System.Drawing.Size(607, 459);
            this.picboxcamaravigilancia.TabIndex = 2;
            this.picboxcamaravigilancia.TabStop = false;
            // 
            // cmbapagarencender
            // 
            this.cmbapagarencender.FormattingEnabled = true;
            this.cmbapagarencender.Location = new System.Drawing.Point(12, 2);
            this.cmbapagarencender.Name = "cmbapagarencender";
            this.cmbapagarencender.Size = new System.Drawing.Size(295, 21);
            this.cmbapagarencender.TabIndex = 4;
            // 
            // btngrabar
            // 
            this.btngrabar.BackColor = System.Drawing.Color.Red;
            this.btngrabar.FlatStyle = System.Windows.Forms.FlatStyle.Flat;
            this.btngrabar.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.btngrabar.IconChar = FontAwesome.Sharp.IconChar.Camera;
            this.btngrabar.IconColor = System.Drawing.Color.Black;
            this.btngrabar.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btngrabar.IconSize = 20;
            this.btngrabar.ImageAlign = System.Drawing.ContentAlignment.MiddleLeft;
            this.btngrabar.Location = new System.Drawing.Point(354, 2);
            this.btngrabar.Name = "btngrabar";
            this.btngrabar.Size = new System.Drawing.Size(146, 23);
            this.btngrabar.TabIndex = 5;
            this.btngrabar.Text = "Grabar";
            this.btngrabar.UseVisualStyleBackColor = false;
            this.btngrabar.Click += new System.EventHandler(this.btngrabar_Click);
            // 
            // frmcamaravigilancia
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.RoyalBlue;
            this.ClientSize = new System.Drawing.Size(967, 495);
            this.Controls.Add(this.btngrabar);
            this.Controls.Add(this.cmbapagarencender);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.picboxcamaravigilancia);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.Name = "frmcamaravigilancia";
            this.Text = "frmcamaravigilancia";
            this.FormClosed += new System.Windows.Forms.FormClosedEventHandler(this.frmcamaravigilancia_FormClosed);
            this.Load += new System.EventHandler(this.frmcamaravigilancia_Load);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.picboxcamaravigilancia)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion
        private System.Windows.Forms.PictureBox picboxcamaravigilancia;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.ComboBox cmbapagarencender;
        private FontAwesome.Sharp.IconButton btngrabar;
    }
}