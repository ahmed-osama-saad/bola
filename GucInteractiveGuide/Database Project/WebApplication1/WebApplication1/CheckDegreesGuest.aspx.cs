using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;


namespace WebApplication1
{
    public partial class CheckDegreesGuest : System.Web.UI.Page
    {


        protected void Page_Load(object sender, System.EventArgs e)
        {
             string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("checkDegreesGuest", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string major_Name = rdr.GetString(rdr.GetOrdinal("name_mj"));
                string Faculty_name = rdr.GetString(rdr.GetOrdinal("name_fac"));
                string name = rdr.GetString(rdr.GetOrdinal("name"));

                Label lbl = new Label();
                lbl.Text = name +"    ";
                form1.Controls.Add(lbl);


                Label lbl2 = new Label();
                lbl2.Text = Faculty_name + "  ";
                form1.Controls.Add(lbl2);

                Label lbl3 = new Label();
                lbl3.Text = major_Name + "  <br /> <br />";
                form1.Controls.Add(lbl3);
               

        }

            conn.Close();
    }
    }
}