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
    public partial class RespondQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            string ad = "Admin";
            SqlCommand cmd = new SqlCommand("viewAllQuestions", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_name", ad));
            conn.Open();
            Response.Write(cmd.ExecuteNonQuery());


            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string question = rdr.GetString(rdr.GetOrdinal("question"));
                string subject = rdr.GetString(rdr.GetOrdinal("subject"));
                DateTime date = rdr.GetDateTime(rdr.GetOrdinal("date_posted"));

                Label lbl = new Label();
                lbl.Text = question + "     ";
                form1.Controls.Add(lbl);

                Label lb2 = new Label();
                lb2.Text = subject + "      ";
                form1.Controls.Add(lb2);
                
              /*  Label lb3 = new Label();
                lbl.Text = reply;
                form1.Controls.Add(lb3);
               * */

                Label lb4 = new Label();
                lb4.Text = date.ToString() + "  <br /> <br />"; 
                form1.Controls.Add(lb4);

               

                


            }
            conn.Close();
        }

   
    }
}