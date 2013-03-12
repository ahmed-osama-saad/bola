using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
namespace WebApplication1
{
    public partial class Page3 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("academicSignUp", conn);
           
            cmd.CommandType = CommandType.StoredProcedure;
          
            string first_name = TextBox1.Text;
            string last_name = TextBox2.Text;
            string phone_no = TextBox3.Text;
            string user_name = TextBox4.Text;
            string password = TextBox5.Text;
           

            cmd.Parameters.Add(new SqlParameter("f_name", first_name));
            cmd.Parameters.Add(new SqlParameter("l_name", last_name));
            cmd.Parameters.Add(new SqlParameter("phone_no", phone_no));
            cmd.Parameters.Add(new SqlParameter("@user_name", user_name));
            cmd.Parameters.Add(new SqlParameter("@pass", password));
          

      

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();
                Response.Redirect("Page1.aspx");

            }
            catch (SqlException E1)
            {
                Response.Write(E1.Message);
                
            }


            conn.Close();


        }
        }
    }
