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
    public partial class Check_Offered_degrees : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("CheckDegreesSP", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_name", Page1.username));
            conn.Open();
            Response.Write(cmd.ExecuteNonQuery());


            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string Name = rdr.GetString(rdr.GetOrdinal("Name"));
                string Faculty_name = rdr.GetString(rdr.GetOrdinal("name_fac"));

                Label lbl = new Label();
                lbl.Text = Name + "         ";
                form1.Controls.Add(lbl);


                Label lbl2 = new Label();
                lbl2.Text = Faculty_name + "  <br /> <br />";
                form1.Controls.Add(lbl2);

            }
            conn.Close();
        }

    }
}