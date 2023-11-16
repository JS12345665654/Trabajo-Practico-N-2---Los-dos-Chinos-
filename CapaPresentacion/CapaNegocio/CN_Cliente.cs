using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CN_Cliente
    {
        private CD_CLIENTE objcd_Cliente = new CD_CLIENTE();

        public List<Cliente> Listar()
        {
            return objcd_Cliente.Listar();

        }

        public int Registrar(Cliente obj, out string Mensaje)
        {
            Mensaje = String.Empty;

            if (obj.Documento == "")
            {
                Mensaje += "Es necesario el documento del Cliente/n";
            }

            if (obj.NombreCompleto == "")
            {
                Mensaje += "Se necesita el nombre completo del Cliente/n";
            }

            if (obj.Correo == "")
            {
                Mensaje += "Se necesita el Email del Cliente/n";
            }

            if (Mensaje != String.Empty)
            {
                return 0;
            }
            else
            {
                return objcd_Cliente.Registrar(obj, out Mensaje);
            }
        }

        public bool Editar(Cliente obj, out string Mensaje)
        {
            Mensaje = String.Empty;


            if (obj.Documento == "")
            {
                Mensaje += "Es necesario el documento del Cliente/n";
            }

            if (obj.NombreCompleto == "")
            {
                Mensaje += "Se necesita el nombre completo del Cliente/n";
            }

            if (obj.Correo == "")
            {
                Mensaje += "Se necesita el Email del Cliente/n";
            }

            if (Mensaje != String.Empty)
            {
                return false;
            }
            else
            {
                return objcd_Cliente.Editar(obj, out Mensaje);
            }
        }

        public bool Eliminar(Cliente obj, out string Mensaje)
        {
            return objcd_Cliente.Eliminar(obj, out Mensaje);
        }
    }
}

