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
    public partial class DefineSurvey1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string ad = "Admin";
            SqlCommand cmd = new SqlCommand("viewAllEvaluations", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_name", ad));
            conn.Open();
            Response.Write(cmd.ExecuteNonQuery());


            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string name = rdr.GetString(rdr.GetOrdinal("name_ev"));
                string type = rdr.GetString(rdr.GetOrdinal("type"));
             

                Label lbl = new Label();
                lbl.Text = name + "     ";
                form1.Controls.Add(lbl);

                Label lb2 = new Label();
                lb2.Text = type + "  <br /> <br />"; ; ;
                form1.Controls.Add(lb2);

       





            }
            conn.Close();
        }
    }
}