namespace CapaPresentacion
{
    partial class Login
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
            this.menuLogin = new System.Windows.Forms.MenuStrip();
            this.btn_usuariocontraseña = new FontAwesome.Sharp.IconMenuItem();
            this.Logo = new System.Windows.Forms.PictureBox();
            this.menuLogin.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Logo)).BeginInit();
            this.SuspendLayout();
            // 
            // menuLogin
            // 
            this.menuLogin.BackColor = System.Drawing.Color.Navy;
            this.menuLogin.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.btn_usuariocontraseña});
            this.menuLogin.Location = new System.Drawing.Point(0, 0);
            this.menuLogin.Name = "menuLogin";
            this.menuLogin.Size = new System.Drawing.Size(359, 84);
            this.menuLogin.TabIndex = 0;
            this.menuLogin.Text = "menuStrip1";
            // 
            // btn_usuariocontraseña
            // 
            this.btn_usuariocontraseña.AutoSize = false;
            this.btn_usuariocontraseña.BackColor = System.Drawing.Color.DarkRed;
            this.btn_usuariocontraseña.BackgroundImageLayout = System.Windows.Forms.ImageLayout.None;
            this.btn_usuariocontraseña.Font = new System.Drawing.Font("Segoe UI", 12F);
            this.btn_usuariocontraseña.IconChar = FontAwesome.Sharp.IconChar.Lock;
            this.btn_usuariocontraseña.IconColor = System.Drawing.Color.Gold;
            this.btn_usuariocontraseña.IconFont = FontAwesome.Sharp.IconFont.Auto;
            this.btn_usuariocontraseña.IconSize = 50;
            this.btn_usuariocontraseña.Name = "btn_usuariocontraseña";
            this.btn_usuariocontraseña.Size = new System.Drawing.Size(350, 80);
            this.btn_usuariocontraseña.Text = "Usuario || Contraseña";
            this.btn_usuariocontraseña.TextImageRelation = System.Windows.Forms.TextImageRelation.ImageAboveText;
            this.btn_usuariocontraseña.Click += new System.EventHandler(this.btn_usuariocontraseña_Click);
            // 
            // Logo
            // 
            this.Logo.Dock = System.Windows.Forms.DockStyle.Fill;
            this.Logo.Image = global::CapaPresentacion.Properties.Resources.supermercado_los_dos_chinos_logo;
            this.Logo.Location = new System.Drawing.Point(0, 84);
            this.Logo.Name = "Logo";
            this.Logo.Size = new System.Drawing.Size(359, 366);
            this.Logo.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            this.Logo.TabIndex = 1;
            this.Logo.TabStop = false;
            // 
            // Login
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(359, 450);
            this.Controls.Add(this.Logo);
            this.Controls.Add(this.menuLogin);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedSingle;
            this.MainMenuStrip = this.menuLogin;
            this.Name = "Login";
            this.Text = "Login";
            this.menuLogin.ResumeLayout(false);
            this.menuLogin.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.Logo)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private FontAwesome.Sharp.IconMenuItem btn_usuariocontraseña;
        private System.Windows.Forms.PictureBox Logo;
        private System.Windows.Forms.MenuStrip menuLogin;
    }
}