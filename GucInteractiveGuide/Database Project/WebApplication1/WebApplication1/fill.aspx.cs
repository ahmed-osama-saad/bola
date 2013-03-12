using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication1
{
    public partial class fill : System.Web.UI.Page
    {
        public static string name_ev;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            name_ev = TextBox1.Text;
            Response.Redirect("fill2.aspx");
        }
    }
}