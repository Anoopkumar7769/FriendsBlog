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
    public partial class CommentPage : System.Web.UI.Page
    {

        //img string variable is initialised
        public string img = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            posts();//method called
            image.ImageUrl = "~/" + img; //image id used to display image in Commentpage aspxby adding image url and
                                         //img varible returns the image path present in database
        }

        protected void posts()
        {
            string a = Request.QueryString["postid"];//postid is fetched and is stored in string a variable
            int Id = (int)Int64.Parse(a);//string is parsed to integer type
            SqlConnection con = new SqlConnection("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = BlogRecord; Integrated Security = True");
            con.Open();//connection open
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Post where postid = " + Id + "  ", con);//sda helps to write query with specific condition
            DataTable dt = new DataTable();//Datatable object created
            sda.Fill(dt);//record feteched from sda fill in datatable
            string img1 = dt.Rows[0]["image"].ToString();//img1 string variable which stores image value 
            img = img + img1;//image path concatenated
            con.Close();//close connection
        }
        
        protected void addcomment_Click(object sender, EventArgs e)
        {
            string a = Request.QueryString["postid"];//postid is fetched and is stored in string a variable
            int Id = (int)Int64.Parse(a);//string is parsed to integer type
            SqlConnection con = new SqlConnection("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = BlogRecord; Integrated Security = True");
            con.Open();//connection open
            SqlCommand cmd = new SqlCommand("insert into Comments(postid,username,comment_txt) values('" + Id + "','" + Session["username"] + "','" + comment.Text + "')", con);//SqlCommand helps to write query with specific condition
            cmd.ExecuteNonQuery();//Excecutes the query and retuns the rows effected
            comment.Text = "";//comment id after inserting comment box shoud become empty
            Response.Redirect("Display.aspx?postid="+Id+"");//using id it should redirect to display page
            con.Close();//close connection
        }
    }
}