using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class GradSur2 : System.Web.UI.Page
    {


        protected void Page_Load(object sender, System.EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("viewQuestions", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@name_ev", GradSur.name_ev2));
            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string Name = rdr.GetString(rdr.GetOrdinal("questions"));

                Label lbl = new Label();
                lbl.Text = Name;
                form1.Controls.Add(lbl);
            }
            conn.Close();

        }

        protected void TextBox1_TextChanged(object sender, System.EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("fillGradSurvey", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@username", Page1.username));
            cmd.Parameters.Add(new SqlParameter("@result", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@nameeval", GradSur.name_ev2));

            conn.Open();
            if (cmd.ExecuteNonQuery().Equals(1)) Response.Write("Answer Recorded");
            else Response.Write("failed");
            conn.Close();
        }
    }
}