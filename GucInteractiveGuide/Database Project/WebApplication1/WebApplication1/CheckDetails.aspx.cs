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
    public partial class CheckDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("checkDetails", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_name", Page1.username));
            conn.Open();
            Response.Write(cmd.ExecuteNonQuery());


            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string course_name = rdr.GetString(rdr.GetOrdinal("name_course"));
                string content = rdr.GetString(rdr.GetOrdinal("content"));
                string resources = rdr.GetString(rdr.GetOrdinal("resources"));
                string learning_outcome = rdr.GetString(rdr.GetOrdinal("learning_outcome"));
                string coordinator = rdr.GetString(rdr.GetOrdinal("coordinator"));

                Label lbl = new Label();
                lbl.Text = course_name + "          ";
                form1.Controls.Add(lbl);


                Label lbl2 = new Label();
                lbl2.Text = content + "           ";
                form1.Controls.Add(lbl2);

                Label lbl3 = new Label();
                lbl3.Text = resources + "            ";
                form1.Controls.Add(lbl3);

                Label lbl4 = new Label() ;
                lbl4.Text =learning_outcome + "             ";
                form1.Controls.Add(lbl4);
                
                Label lbl5 = new Label();
                lbl5.Text = coordinator +   "  <br /> <br />";
                form1.Controls.Add(lbl5);
            }
            conn.Close();
        }
    }
}