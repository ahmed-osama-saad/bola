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
    public partial class ViewFaq : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewFaqSP", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@user_name", Page1.username));
            conn.Open();
            Response.Write(cmd.ExecuteNonQuery());


            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string question = rdr.GetString(rdr.GetOrdinal("question"));
                string subject = rdr.GetString(rdr.GetOrdinal("subject"));
                string reply = rdr.GetString(rdr.GetOrdinal("reply"));
                Label lbl = new Label();
                lbl.Text = question + "         ";
                form1.Controls.Add(lbl);


                Label lbl2 = new Label();
                lbl2.Text = subject + "         ";
                form1.Controls.Add(lbl2);

                Label lbl3 = new Label();
                lbl3.Text = reply + "  <br /> <br />";
                form1.Controls.Add(lbl3);

            }
            conn.Close();
        }
    }
}