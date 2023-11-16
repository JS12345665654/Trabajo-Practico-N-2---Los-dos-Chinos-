using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CN_PROVEEDOR
    {
        private CD_PROVEEDOR objcd_Proveedor = new CD_PROVEEDOR();

        public List<Proveedor> Listar()
        {
            return objcd_Proveedor.Listar();

        }

        public int Registrar(Proveedor obj, out string Mensaje)
        {
            Mensaje = String.Empty;

            if (obj.Documento == "")
            {
                Mensaje += "Es necesario el documento del Proveedor/n";
            }

            if (obj.NombreProveedor == "")
            {
                Mensaje += "Se necesita el nombre del Proveedor/n";
            }

            if (obj.Email == "")
            {
                Mensaje += "Se necesita el email del Proveedor/n";
            }

            if (Mensaje != String.Empty)
            {
                return 0;
            }
            else
            {
                return objcd_Proveedor.Registrar(obj, out Mensaje);
            }
        }

        public bool Editar(Proveedor obj, out string Mensaje)
        {
            Mensaje = String.Empty;


            if (obj.Documento == "")
            {
                Mensaje += "Es necesario el documento del Proveedor/n";
            }

            if (obj.NombreProveedor == "")
            {
                Mensaje += "Se necesita el nombre del Proveedor/n";
            }

            if (obj.Email == "")
            {
                Mensaje += "Se necesita el email del Proveedor/n";
            }

            if (Mensaje != String.Empty)
            {
                return false;
            }
            else
            {
                return objcd_Proveedor.Editar(obj, out Mensaje);
            }
        }

        public bool Eliminar(Proveedor obj, out string Mensaje)
        {
            return objcd_Proveedor.Eliminar(obj, out Mensaje);
        }
    }
}
