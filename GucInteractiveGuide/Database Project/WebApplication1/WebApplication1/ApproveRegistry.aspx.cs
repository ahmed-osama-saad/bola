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
    public partial class ApproveRegistry : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand cmd = new SqlCommand("approveRegister", conn);

            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.Add(new SqlParameter("@user_name", Page1.username));
            cmd.Parameters.Add(new SqlParameter("@student_name", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@course_code", TextBox2.Text));
            
            if(CheckBox1.Checked)
                cmd.Parameters.Add(new SqlParameter("@approve", 1));
            else
                if(CheckBox2.Checked)
                    cmd.Parameters.Add(new SqlParameter("@approve", 0));


            conn.Open();
            try
            {
                if (cmd.ExecuteNonQuery().Equals(1))
                    Response.Write("Success");
                else
                    Response.Write("Fail");

            }
            catch (SqlException E1)
            {
                Response.Write(E1.Message);

            }


            conn.Close();

        }
    }
}