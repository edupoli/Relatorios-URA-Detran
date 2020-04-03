using MySql.Data.MySqlClient;
using System.Web;

namespace Relatorios
{
    public class Conexao
    {
        public string conec = "SERVER=10.0.2.9;DATABASE=bd_sercomtelcc;UID=ura;PWD=ask123;";
        public MySqlConnection con = null;
        public void AbrirCon()
        {
            try
            {
                con = new MySqlConnection(conec);
                con.Open();
                //HttpContext.Current.Response.Write("Conectado");
            }
            catch (System.Exception ex)
            {

                HttpContext.Current.Response.Write("Erro ao conectar" + ex);
            }
        }
        public void FecharCon()
        {
            try
            {
                con = new MySqlConnection(conec);
                con.Close();
            }
            catch (System.Exception ex)
            {

                HttpContext.Current.Response.Write("Erro ao conectar" + ex);
            }
        }
    }
}