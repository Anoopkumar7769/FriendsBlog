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
    public partial class NewPost : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = BlogRecord; Integrated Security = True");
            if (imageUpload.HasFile)
            {
                string filename = imageUpload.PostedFile.FileName;
                String filepath = "Pictures/" + imageUpload.FileName;
                imageUpload.PostedFile.SaveAs(Server.MapPath("~/Pictures/") + filename);
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Post(userid,image,caption) values('" + Session["userid"] + "','" + filepath + "','" + txtCapt.Text + "')", con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Image Uploaded Successfully');</script>");
                Response.Redirect("Home.aspx");
            }

        }
    }
}