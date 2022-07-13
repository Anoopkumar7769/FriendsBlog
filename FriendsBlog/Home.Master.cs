using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FriendsBlog
{
    public partial class Home : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //If the UserNot Logged in UserName Btn should not be Visible
            if (Session["username"] == null)
            {
                btnUser.Visible = false;
            }
            //If the User Logged in UserName Btn should be Visible
            if (Session["username"] != null)
            {
                btnUser.Text = Session["username"].ToString();
                btnUser.Visible = true;
                btnLogout.Visible = true;
                //if User Logged in Login and Register Btn should not be Visible
                btnLogin.Visible = false;
                btnRegister.Visible = false;
            }
            //If User Is not Logged in Logout Should not be Visible
            else
            {
                btnLogout.Visible = false;
            }
        }

        protected void BtnHome_Click(object sender, EventArgs e)
        {
            //If Person is not logged in he cant see posts 
            if (Session["username"] == null)
            {
                Response.Write(@"<script language='javascript'>alert('Please Login to See Posts')</script>");
            }
            //If Person is logged in he can see posts 
            else
            {
                Response.Redirect("Home.aspx");
            }
                
        }
        
        protected void BtnAddPost_Click(object sender, EventArgs e)
        {
            //If Person is not logged in he cant Add posts 
            if (Session["username"] == null)
            {
                Response.Write(@"<script language='javascript'>alert('Please Login to Add Posts')</script>");
            }
            //If Person is not logged in he cant Add posts 
            else
            {
                Response.Redirect("NewPost.aspx");
            }
        }

        protected void BtnLogin_Click(object sender, EventArgs e)
        {
            Response.Redirect("Login.aspx");//Redirecting To login Page
        }

        protected void BtnRegister_Click(object sender, EventArgs e)
        {
            Response.Redirect("Register.aspx");//Redirecting To Register Page
        }

        protected void BtnLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();//Cancels the Current Session
            Response.Redirect("Login.aspx");//Redirecting To login Page
        }

        protected void BtnUser_Click(object sender, EventArgs e)
        {
            string userid = Session["userid"].ToString();////Storing the Sessions Userid into userid
            Response.Redirect("UserAccount.aspx?userid="+userid+"");//Redirecting to UserAccount aspx Using the values of the variables in the HTTP query string
        }
    }
}