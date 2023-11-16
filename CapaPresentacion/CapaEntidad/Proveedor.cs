using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class Proveedor
    {
        public long ProveedorID { get; set; }
        public string Documento { get; set; }
        public long RazonSocial { get; set; }
        public string Email { get; set; }
        public string Telefono { get; set; } 
        public string NombreProveedor { get; set; }
        public bool Estado { get; set; }
        public string FechaRegistro { get; set; }
    }
}
