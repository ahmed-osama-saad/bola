using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication1
{
    public partial class Change_Password : System.Web.UI.Page
    {


        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("ChangePassword", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_name", Page1.username));
            cmd.Parameters.Add(new SqlParameter("@password", TextBox2.Text));
            cmd.Parameters.Add(new SqlParameter("@newPassword", TextBox3.Text));

            conn.Open();
            if (cmd.ExecuteNonQuery().Equals(1)) Response.Write("Password changed");
            else Response.Write("failed to change password");
            conn.Close();

        }
    }
}