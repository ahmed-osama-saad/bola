﻿using System;
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
    public partial class Send_Report : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string connStr = ConfigurationManager.ConnectionStrings["MyDbConn"].ToString();
            SqlConnection conn = new SqlConnection(connStr);


            SqlCommand cmd = new SqlCommand("sendReport", conn);

            cmd.CommandType = CommandType.StoredProcedure;


            cmd.Parameters.Add(new SqlParameter("@user_name", Page1.username));
            cmd.Parameters.Add(new SqlParameter("@report", TextBox1.Text));
            cmd.Parameters.Add(new SqlParameter("@manager_name", TextBox2.Text));


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
    }
}