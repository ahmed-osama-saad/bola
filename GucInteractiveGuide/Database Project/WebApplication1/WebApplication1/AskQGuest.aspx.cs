using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class AskQGuest : System.Web.UI.Page
    {

      

    

        protected void Button1_Click(object sender, System.EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("askQuestion", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@question", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@name", TextBox2.Text));
            cmd.Parameters.Add(new SqlParameter("@subject", TextBox3.Text));
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

        protected void Page_Load(object sender, System.EventArgs e)
        {

        }
    }
}