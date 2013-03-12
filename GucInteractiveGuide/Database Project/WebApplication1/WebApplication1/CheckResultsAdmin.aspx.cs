using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class CheckResultsAdmin : System.Web.UI.Page
    {
        

        protected void Page_Load(object sender, System.EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);

            SqlCommand cmd = new SqlCommand("checkResultsAdmin", conn);
            cmd.CommandType = CommandType.StoredProcedure;

            conn.Open();

            SqlDataReader rdr = cmd.ExecuteReader(CommandBehavior.CloseConnection);
            while (rdr.Read())
            {
                string one = rdr.GetString(rdr.GetOrdinal("Efs.results"));
                string two = rdr.GetString(rdr.GetOrdinal("Efs.name_ev"));

                string three = rdr.GetString(rdr.GetOrdinal("Efst.results"));
                string four = rdr.GetString(rdr.GetOrdinal("Efst.name_ev"));


                string five = rdr.GetString(rdr.GetOrdinal("Afe.results"));
                string six = rdr.GetString(rdr.GetOrdinal("Afe.name_ev"));

                Label lbl1 = new Label();
                lbl1.Text = one + "  Result of: ";
                form1.Controls.Add(lbl1);


                Label lbl2 = new Label();
                lbl2.Text = two + "     ";
                form1.Controls.Add(lbl2);

                Label lbl3 = new Label();
                lbl3.Text = three + "  Result of:   ";
                form1.Controls.Add(lbl3);


                Label lbl4 = new Label();
                lbl4.Text = four + "     ";
                form1.Controls.Add(lbl4);

                Label lbl5 = new Label();
                lbl5.Text = five + " Result of  :";
                form1.Controls.Add(lbl5);


                Label lbl6 = new Label();
                lbl6.Text = six + "  <br /> <br />";
                form1.Controls.Add(lbl6);
            }
            conn.Close();
        }
    }
}