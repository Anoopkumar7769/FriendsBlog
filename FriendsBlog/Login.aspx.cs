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
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            SqlConnection con = new SqlConnection("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = BlogRecord; Integrated Security = True");
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Users where username='" + TextBox1.Text + "' and password='" + TextBox2.Text + "'", con);
            DataTable dt = new DataTable();
            sda.Fill(dt);
            
            if (dt.Rows.Count == 1)
            {
                
                Session["username"] = TextBox1.Text;
                string id = dt.Rows[0]["userid"].ToString();
                Session["userid"] = Int64.Parse(id);
                Response.Redirect("Home.aspx");
                
            }
            else
            {
                Label1.Text = "Login Unsuccessful!";
                Label1.ForeColor = System.Drawing.Color.Red;
            }
           
        }
    }
}