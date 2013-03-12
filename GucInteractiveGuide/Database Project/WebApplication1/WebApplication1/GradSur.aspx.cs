using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class GradSur : System.Web.UI.Page
    {
        public static string name_ev2;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            name_ev2 = TextBox1.Text;
            Response.Redirect("GradSur2.aspx");
        }
    }
}