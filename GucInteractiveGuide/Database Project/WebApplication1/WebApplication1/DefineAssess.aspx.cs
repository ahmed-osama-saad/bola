using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication1
{
    public partial class DefineAssess : System.Web.UI.Page
    {

        

        protected void Button1_Click(object sender, System.EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("defineAssess", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Page1.username));
            cmd.Parameters.Add(new SqlParameter("@type", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@name", TextBox2.Text));
            cmd.Parameters.Add(new SqlParameter("@weight", TextBox3.Text));
            cmd.Parameters.Add(new SqlParameter("@course", TextBox4.Text));
            conn.Open();
            try
            {
              
            }
            catch (SqlException E1)
            {
                Response.Write(E1.Message);

            }


            conn.Close();
        }
    }
}