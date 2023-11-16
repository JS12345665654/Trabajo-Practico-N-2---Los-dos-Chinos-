using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CapaEntidad;
using FontAwesome.Sharp;
using CapaNegocio;


namespace CapaPresentacion
{
    public partial class Inicio : Form
    {
        private static Usuario usuarioActual;
        private static IconMenuItem MenuActivo = null;
        private static Form FormularioActivo = null;
     
        //Aca programo el inicio para que no haga falta logearse
        public Inicio(Usuario objusuario = null)
        {
            if (objusuario == null) usuarioActual = new Usuario(){NombreCompleto = "ADMINISTRADOR PREDEFINIDO",UsuarioID = 0};
            else
            usuarioActual = objusuario;
            InitializeComponent();
        }


        private void Inicio_Load(object sender, EventArgs e)
        {
            List<Permiso> ListarPermisos = new CN_Permiso().Listar(usuarioActual.UsuarioID);

            foreach (IconMenuItem iconmenu in menu.Items)
            {
                bool encontrado = ListarPermisos.Any(m => m.NombreMenu == iconmenu.Name);

                if(encontrado == false){
                    iconmenu.Visible = false;

                }
            }
            lblusuario.Text = usuarioActual.NombreCompleto;



        }


        private void AbrirFormulario(IconMenuItem menu, Form formulario)
        {
            if (FormularioActivo != null)
            {
                MenuActivo.BackColor = Color.White;

            }

            menu.BackColor = Color.Silver;
            MenuActivo = menu;

            if (FormularioActivo != null)
            {

                FormularioActivo.Close();

            }

            FormularioActivo = formulario;
            formulario.TopLevel = false;
            formulario.FormBorderStyle = FormBorderStyle.None;
            formulario.Dock = DockStyle.Fill;
            formulario.BackColor = Color.SteelBlue;

            contenedor.Controls.Add(formulario);
            formulario.Show();
        
        }

        private void menuusuarios_Click(object sender, EventArgs e)
        {
            AbrirFormulario((IconMenuItem)sender, new frmusuario());
        }

        private void iconMenuItem1_Click(object sender, EventArgs e)
        {
            AbrirFormulario(menuoperador, new frmCategoria());
        }

        private void submenuproducto_Click(object sender, EventArgs e)
        {
            AbrirFormulario(menuoperador, new frmArticulos());
        }

        private void submenuregistrar_Click(object sender, EventArgs e)
        {
            AbrirFormulario(menuventas, new frmVentas());
        }

        private void submenudetalledeventa_Click(object sender, EventArgs e)
        {
            AbrirFormulario(menuventas, new frmDetalleVentas());
        }

        private void submenuregistrarcompra_Click(object sender, EventArgs e)
        {
            AbrirFormulario(menucompras, new frmCompras());
        }

        private void submenudetalledecompra_Click(object sender, EventArgs e)
        {
            AbrirFormulario(menucompras, new frmDetalleCompras());
        }

        private void menuclientes_Click(object sender, EventArgs e)
        {
            AbrirFormulario((IconMenuItem)sender, new frmClientes());
        }

        private void menuproveedores_Click(object sender, EventArgs e)
        {
            AbrirFormulario((IconMenuItem)sender, new frmProveedores());
        }

        private void menureportes_Click(object sender, EventArgs e)
        {
            AbrirFormulario((IconMenuItem)sender, new frmReportes());
        }

        private void menucamaras_Click(object sender, EventArgs e)
        {
            frmcamaravigilancia frm = new frmcamaravigilancia();
            frm.Show();
        }

        private void sobreElNegociToolStripMenuItem_Click(object sender, EventArgs e)
        {
            AbrirFormulario(menuoperador, new frmnegociopresentacion());

        }

        private void horafecha_Tick(object sender, EventArgs e)
        {
            lblhora.Text = DateTime.Now.ToLongTimeString();
            lblfecha.Text = DateTime.Now.ToLongDateString();
        }
    }
}
