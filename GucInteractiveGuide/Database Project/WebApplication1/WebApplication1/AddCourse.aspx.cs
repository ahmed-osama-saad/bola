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
    public partial class AddCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            
            SqlCommand cmd = new SqlCommand("AddCourse", conn);
     
            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.Add(new SqlParameter("@user_name", Page1.username));


            cmd.Parameters.Add(new SqlParameter("@code", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@name_course", TextBox2.Text));
            cmd.Parameters.Add(new SqlParameter("@type", TextBox3.Text));
            cmd.Parameters.Add(new SqlParameter("@coordinator", TextBox4.Text));
            cmd.Parameters.Add(new SqlParameter("@semester", TextBox9.Text));
            cmd.Parameters.Add(new SqlParameter("@language",TextBox5.Text));
            cmd.Parameters.Add(new SqlParameter("@content", TextBox6.Text));
            cmd.Parameters.Add(new SqlParameter("@resources",TextBox7.Text));
            cmd.Parameters.Add(new SqlParameter("@learning_outcome",TextBox8.Text));
            
      

            conn.Open();
            try
            {
                if(cmd.ExecuteNonQuery().Equals(1))
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
