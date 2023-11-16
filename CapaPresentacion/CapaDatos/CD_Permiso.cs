using CapaEntidad;
using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Reflection;

namespace CapaDatos
{
    public class CD_Permiso
    {
       public List<Permiso> Listar( int UsuarioID)
            {
                List<Permiso> lista = new List<Permiso>();

                using (SqlConnection oconnection = new SqlConnection(Conexion.cadena))
                {

                    try
                    {
                        StringBuilder query = new StringBuilder();
                        query.AppendLine("SELECT p.IdRol, p.NombreMenu FROM PERMISO p");
                        query.AppendLine("INNER JOIN ROL r ON r.IdRol = p.IdRol");
                        query.AppendLine("INNER JOIN USUARIO u ON u.IdRol = r.IdRol");
                        query.AppendLine("WHERE u.UsuarioID = @UsuarioID");


                        SqlCommand cmd = new SqlCommand(query.ToString(), oconnection);
                        cmd.Parameters.AddWithValue("@UsuarioID" , UsuarioID);
                        cmd.CommandType = CommandType.Text;

                        oconnection.Open();
                     
                        using (SqlDataReader dr = cmd.ExecuteReader())
                        {

                            while (dr.Read())
                            {

                                lista.Add(new Permiso()
                                {
                                    oRol = new Rol() {IdRol = Convert.ToInt32(dr["IdRol"]) }, 
                                    NombreMenu = dr["NombreMenu"].ToString(),
                                   

                                });
                            }


                        }

                    }
                    catch (Exception)
                    {
                        lista = new List<Permiso >();
                    }



                }

                return lista;
       }

    }

    
}
