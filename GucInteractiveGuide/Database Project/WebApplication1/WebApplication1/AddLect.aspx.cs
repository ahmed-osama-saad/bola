using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication1
{
    public partial class AddLect : System.Web.UI.Page
    {

        protected void Button1_Click(object sender, System.EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("addOtherLecturers", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Page1.username));
            cmd.Parameters.Add(new SqlParameter("@course", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@addusername", TextBox2.Text));

            conn.Open();
            if (cmd.ExecuteNonQuery().Equals(1)) Response.Write("Added successfully");
            else Response.Write("failed");
            conn.Close();
        }
    }
}