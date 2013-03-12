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
    public partial class Page1 : System.Web.UI.Page
    {
       public static string username;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);
            HttpCookie x = new HttpCookie(TextBox1.Text);

            SqlCommand cmd = new SqlCommand("logIn", conn);
            SqlCommand adminsCheck = new SqlCommand("SELECT * FROM Adminstratives, Users WHERE Adminstratives.user_id = Users.user_id AND Users.user_name = @user_name", conn);
            SqlCommand underCheck = new SqlCommand("SELECT * FROM Undergraduates, Users WHERE Undergraduates.user_id = Users.user_id AND Users.user_name = @user_name", conn);
            SqlCommand gradCheck = new SqlCommand("SELECT * FROM Graduates, Users WHERE Graduates.user_id = Users.user_id AND Users.user_name = @user_name", conn);
            SqlCommand acadCheck = new SqlCommand("SELECT * FROM Academics, Users WHERE Academics.user_id = Users.user_id AND Users.user_name = @user_name", conn);

            cmd.CommandType = CommandType.StoredProcedure;

            username = TextBox1.Text;
            string password = TextBox2.Text;

            cmd.Parameters.Add(new SqlParameter("@user_name", username));
            cmd.Parameters.Add(new SqlParameter("@password", password));

            adminsCheck.Parameters.Add(new SqlParameter("@user_name", username));
            underCheck.Parameters.Add(new SqlParameter("@user_name", username));
            gradCheck.Parameters.Add(new SqlParameter("@user_name", username));
            acadCheck.Parameters.Add(new SqlParameter("@user_name", username));



            try
            {
                conn.Open();
                if (cmd.ExecuteNonQuery().Equals(1))
                {
                    Response.Redirect("Portal.aspx");

                    // if (!adminsCheck.ExecuteNonQuery().Equals(0))
     //               Response.Write(adminsCheck.ExecuteNonQuery());

                    //if (!underCheck.ExecuteNonQuery().Equals(0))
   //                 Response.Write(underCheck.ExecuteNonQuery());


                    //if (!gradCheck.ExecuteNonQuery().Equals(0))
 //                   Response.Write(gradCheck.ExecuteNonQuery());

                    //if (!acadCheck.ExecuteNonQuery().Equals(0))
                    //Response.Write(acadCheck.ExecuteNonQuery());


                }
                else
                    Response.Write("Login Failed Please Register");


                conn.Close();
            }
            catch (SqlException E1)
            {
                Response.Write(E1.Message);
            }
        }

      
    }
}