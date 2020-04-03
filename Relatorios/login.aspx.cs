using MySql.Data.MySqlClient;
using System;
using System.Data;

namespace Relatorios
{
    public partial class login : System.Web.UI.Page
    {
        Object obj;
        Conexao con = new Conexao();
        protected void Page_Load(object sender, EventArgs e)
        {
            con.AbrirCon();
            painelMensagemErro.Visible = false;

        }

        protected void bntLogin_Click(object sender, EventArgs e)
        {
            if (txtUsuario.Text == "")
            {
                painelMensagemErro.Visible = true;
                MensagemErro.Text = "Digite o Login de Usuario para acessar o sistema!";
            }
            else if (txtPassword.Text == "")
            {
                painelMensagemErro.Visible = true;
                MensagemErro.Text = "Digite a senha de Usuario para acessar o sistema!";
            }
            else
            {
                string sql;
                MySqlCommand cmd;
                con.AbrirCon();
                sql = "SELECT count(*) FROM usuarios WHERE login=@login and senha=@senha";
                cmd = new MySqlCommand(sql, con.con);
                cmd.CommandType = CommandType.Text;
                cmd.Parameters.AddWithValue("@login", txtUsuario.Text);
                cmd.Parameters.AddWithValue("@senha", txtPassword.Text);
                obj = cmd.ExecuteScalar();
                if (Convert.ToInt32(obj) != 0)
                {
                    Response.Redirect("Default.aspx");
                }
                else
                {
                    painelMensagemErro.Visible = true;
                    MensagemErro.Text = "Usuario ou Senha Inválidos!";

                }
            }
        }
    }
}