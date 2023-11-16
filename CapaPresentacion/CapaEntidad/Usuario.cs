using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace CapaEntidad
{
    public class Usuario
    {
        public int UsuarioID { get; set; }
        public string Documento { get; set; }
        public string NombreCompleto { get; set; } 
        public string Email { get; set; }
        public string Clave { get; set; }
        public int Acceso { get; set; }
        public Rol oRol { get; set; }
        public string Celular {  get; set; } 
        public bool Estado { get; set; }
        public string FechaRegistro { get; set; }
    }
}