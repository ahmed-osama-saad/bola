using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1 //to be changed
{
    public partial class CheckNotf : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("checkNotifications", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_name", Page1.username));
            conn.Open();
            Response.Write(cmd.ExecuteNonQuery());


            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string course_name = rdr.GetString(rdr.GetOrdinal("name_course"));
                string notifications = rdr.GetString(rdr.GetOrdinal("notifications"));
        
                Label lbl = new Label();
                lbl.Text = course_name + "          ";
                form1.Controls.Add(lbl);


                Label lbl2 = new Label();
                lbl2.Text = notifications + "  <br /> <br />";
                form1.Controls.Add(lbl2);

            }
            conn.Close();
        }
    }
}