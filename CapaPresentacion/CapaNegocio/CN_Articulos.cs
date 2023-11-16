using CapaDatos;
using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaNegocio
{
    public class CN_Articulos
    {
        private CD_Articulos objcd_Articulo = new CD_Articulos();

        public List<Articulos> Listar()
        {
            return objcd_Articulo.Listar();

        }

        public int Registrar(Articulos obj, out string Mensaje)
        {
            Mensaje = String.Empty;

            if (obj.Codigo == "")
            {
                Mensaje += "Especifique el código del Articulo/n";
            }

            if (obj.Nombre == "")
            {
                Mensaje += "Se necesita el nombre del Articulo/n";
            }

            if (obj.Descripcion == "")
            {
                Mensaje += "Se necesita la descripción del Articulo/n";
            }

            if (Mensaje != String.Empty)
            {
                return 0;
            }
            else
            {
                return objcd_Articulo.Registrar(obj, out Mensaje);
            }
        }

        public bool Editar(Articulos obj, out string Mensaje)
        {
            Mensaje = String.Empty;


            if (obj.Codigo == "")
            {
                Mensaje += "Especifique el código del Articulo/n";
            }

            if (obj.Nombre == "")
            {
                Mensaje += "Se necesita el nombre del Articulo/n";
            }

            if (obj.Descripcion == "")
            {
                Mensaje += "Se necesita la descripcion del Articulo/n";
            }

            if (Mensaje != String.Empty)
            {
                return false;
            }
            else
            {
                return objcd_Articulo.Editar(obj, out Mensaje);
            }
        }

        public bool Eliminar(Articulos obj, out string Mensaje)
        {
            return objcd_Articulo.Eliminar(obj, out Mensaje);
        }
    }

}

