using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace shivani_ajax_
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          string strcon = ConfigurationManager.ConnectionStrings["dbconnection"].ConnectionString;
          SqlConnection con = new SqlConnection(strcon);
            string sql = "select * from login ";
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(sql,con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            Repeaters1.DataSource = dt;
             Repeaters1.DataBind();
            con.Close();
        }

    }
}