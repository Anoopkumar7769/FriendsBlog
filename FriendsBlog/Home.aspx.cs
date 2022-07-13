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
    public partial class Home1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // IsPostBack== false - Means it works for first time form load. it does not work when button is clicked .
            if (!IsPostBack)//condition true
            {
                //If Session Of Username is Null It should redirect to Login Page
                if (Session["username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string postid = ((Button)sender).CommandArgument.ToString();//Storing the string Command Argument passed in aspx into postid  
            Response.Redirect("Display.aspx?postid="+postid+"");//Redirecting to Display aspx Using the values of the variables in the HTTP query string
        }
        protected void Button2_Click(object sender, EventArgs e)
        {
            string postid = ((Button)sender).CommandArgument.ToString();
            Response.Redirect("CommentPage.aspx?postid="+postid+"");
        }

    }
}