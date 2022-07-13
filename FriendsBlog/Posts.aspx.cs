using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsBlog
{
    public partial class Posts : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            posts();
        }
        protected void posts()
        {
            string a = Request.QueryString["userid"];
            int Id = (int)Int64.Parse(a);
            SqlConnection con = new SqlConnection("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = BlogRecord; Integrated Security = True");
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select postid,userid,image,caption from Post where userid = " + Id + "  ", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count > 0)
            {
                DataList1.DataSource = dt;
                DataList1.DataBind();
            }

            else
            {
                Response.Write(@"<script language='javascript'>alert('No image uploaded')</script>");
            }
            con.Close();
        }
    }
}