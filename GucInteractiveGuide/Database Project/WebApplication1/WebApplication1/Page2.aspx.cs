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
    public partial class Page2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            Response.Write(Page1.username);

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            

            SqlCommand cmd = new SqlCommand("studentSignUp", conn);
            SqlCommand insGrad = new SqlCommand("insGrad", conn);
            SqlCommand insUnder = new SqlCommand("insUnder", conn);

            cmd.CommandType = CommandType.StoredProcedure;
            insGrad.CommandType = CommandType.StoredProcedure;
            insUnder.CommandType = CommandType.StoredProcedure;

            string first_name = TextBox1.Text;
            string last_name = TextBox2.Text;
            string phone_no = TextBox3.Text;
            string user_name = TextBox4.Text;
            string password = TextBox5.Text;
           // int gpa = int.Parse(TextBox6.Text);
            int a_year = int.Parse(TextBox7.Text);

            cmd.Parameters.Add(new SqlParameter("f_name", first_name));
            cmd.Parameters.Add(new SqlParameter("l_name", last_name));
            cmd.Parameters.Add(new SqlParameter("phone_no", phone_no));
            cmd.Parameters.Add(new SqlParameter("@user_name", user_name));
            cmd.Parameters.Add(new SqlParameter("@pass", password));
            
            insGrad.Parameters.Add(new SqlParameter("@user_name",user_name));
            
            insUnder.Parameters.Add(new SqlParameter("@user_name",user_name));
            insUnder.Parameters.Add(new SqlParameter("@gpa", TextBox6.Text));
            insUnder.Parameters.Add(new SqlParameter("@admission_year", a_year));

      

            conn.Open();
            try
            {
                cmd.ExecuteNonQuery();

                if (Graduate.Checked)
                {
                    if (insGrad.ExecuteNonQuery().Equals(1))
                        Response.Redirect("Page1.aspx");
                    else
                        Response.Write("Graduate Sign Up Fail");
                }

                if (Undergraduate.Checked)
                {
                    if (insUnder.ExecuteNonQuery().Equals(1))
                        Response.Write("Page1.aspx");
                    else
                        Response.Write("UnderGraduate Sign Up Fail");
                }
            }
            catch (SqlException E1)
            {
                Response.Write(E1.Message);
                
            }


            conn.Close();


        }

       
    }
}