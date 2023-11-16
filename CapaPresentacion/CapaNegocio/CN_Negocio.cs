using CapaEntidad;
using CapaDatos;
using CapaNegocio;
using System;
using System.Data;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Runtime.InteropServices.WindowsRuntime;

namespace CapaNegocio
{
    public class CN_Negocio
    {
        private CD_Negocio objcd_negocio = new CD_Negocio();

        public Negocio obtenerdatos()
        {
            return objcd_negocio.obtenerdatos();

        }

        public bool Registrar(Negocio obj, out string Mensaje)
        {
            Mensaje = String.Empty;

            if (obj.RazonSocial == "")
            {
                Mensaje += "Es necesario la razon social del supermercado/n";
            }

            if (obj.Dirección == "")
            {
                Mensaje += "Se necesita la direccion del supermercado/n";
            }

            if (obj.NegocioID.ToString() == "")
            {
                Mensaje += "Se necesita el ID del supermercado /n";
            }

            if (Mensaje != String.Empty)
            {
                return false;
            }
            else
            {
                return objcd_negocio.Guardardatos(obj, out Mensaje);
            }
        }

        public byte[] ObtenerLogo(out bool obtenido)
        {
            return objcd_negocio.ObtenerLogo(out obtenido);
        }

        public bool ActualizarLogo(byte[] imagen, out string mensaje)
        {
            return objcd_negocio.ActualizarLogo(imagen, out mensaje); 
        }
        
    }
}
