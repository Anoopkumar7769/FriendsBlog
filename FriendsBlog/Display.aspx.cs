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
    public partial class Display : System.Web.UI.Page
    {

        //img,capt,uname string variables are initialised
        public string img = "";
        public string capt = "";
        public string uname = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            posts();//posts method call
            if (!IsPostBack)
            {
                image.ImageUrl = "~/" + img;//image id used to display image in Display aspx by adding image url and
                                            //img varible returns the image path present in database
                BtnLike_Click.Visible = !handle(); //bool value is responsible for visiblity of like button
                btnDislike_Click.Visible = handle(); //bool value is responsible for visiblity of dislike button
                disp_comments();//disp_comments method call
            }
           
        }
        protected void posts()
        {
            string a = Request.QueryString["postid"];//postid is fetched form route params and is stored in string a variable
            int Id = (int)Int64.Parse(a);//string is parsed to integer type
            SqlConnection con = new SqlConnection("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = BlogRecord; Integrated Security = True");
            con.Open();//connection open
            SqlDataAdapter sda = new SqlDataAdapter("Select * from Post where postid = " + Id + "  ", con);//sda helps to write query with specific condition
            DataTable dt = new DataTable();//Datatable object created
            sda.Fill(dt); //record feteched from sda fill in datatable
            string img1 = dt.Rows[0]["image"].ToString();//img1 string variable which stores image value
            img = img + img1;//image path concatenated
            string caption = dt.Rows[0]["caption"].ToString();//caption string variable which stores capt value;
            capt = capt + caption;//caption is concatenated
            con.Close();//close connection
            con.Open();//open connection
            string id = dt.Rows[0]["userid"].ToString();//id string variable which stores userid value
            int uid = (int)Int64.Parse(id);//string is parsed to integer type
            SqlDataAdapter sda1 = new SqlDataAdapter("Select username from Users where userid = " + uid + " ", con);//sda helps to write query with specific condition
            DataTable dt1 = new DataTable();//Datatable object created
            sda1.Fill(dt1); //record feteched from sda1 fill in datatable
            string username = dt1.Rows[0]["username"].ToString();//username string variable which stores username value;
            uname = uname + username;//uname is concatenated with username fetched
            con.Close();//close connection
        }
        SqlConnection con = new SqlConnection("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = BlogRecord; Integrated Security = True");

        Boolean handle()//handle method is created to return bool value if record exists
        {
            string id = Session["userid"].ToString();//id string variable which stores Session userid(perosn logged in) value
            int uid = (int)Int64.Parse(id);//string is parsed to integer type
            string a = Request.QueryString["postid"];//postid is fetched form route params and is stored in string a variable
            int postid = (int)Int64.Parse(a);//string is parsed to integer type
            SqlDataAdapter sda1 = new SqlDataAdapter("Select userid,postid from Likes where userid = " + uid + " and postid = " + postid+" ", con);//sda helps to write query with specific condition
            DataTable dt1 = new DataTable();//Datatable object created
            sda1.Fill(dt1); //record feteched from sda1 fill in datatable
            if (dt1.Rows.Count > 0)//checks if session userid count exists or not
            {
                return true;
            }
            else
            {
                return false;
            }
         
        }
        protected void BtnLike_Click_Click(object sender, EventArgs e)//if user clicks on like userid and postid should be added into database
        {
            con.Open();
            string userid = Session["userid"].ToString();//gets userid from Session
            string postid = Request.QueryString["postid"];//gets id to querystring and stores in postid variable
            SqlCommand cmd = new SqlCommand("insert into Likes(userid,postid) values(@userid,@postid)", con);//userid and postid values are inserted
            cmd.Parameters.AddWithValue("@userid", userid);//AddWithValue will derive the type of the parameter of its value, so ensure that it's the correct type. You should, for example, parse a string to int if that is the correct type.
            cmd.Parameters.AddWithValue("@postid", postid);
            cmd.ExecuteNonQuery();//ExecuteNonQuery used for executing queries that does not return any dat
            con.Close();
            BtnLike_Click.Visible = false;//if user likes like button should not be visible
            btnDislike_Click.Visible = true;//if user likes dislike button should be visible
        }
        protected void btnDislike_Click_Click(object sender, EventArgs e)
        {
            con.Open();
            string postid = Request.QueryString["postid"];//gets id to querystring and stores in postid variable
            string userid = Session["userid"].ToString();//gets userid from Session
            SqlCommand cmd = new SqlCommand("delete from Likes where postid = " + postid + " and userid = " +userid+ " ", con);
            cmd.Parameters.AddWithValue("@postid", postid);
            cmd.ExecuteNonQuery();
            con.Close();
            BtnLike_Click.Visible = true;
            btnDislike_Click.Visible = false;
        }
        protected void disp_comments()
        {
            string a = Request.QueryString["postid"];//gets id to querystring and stores in postid variable
            int Id = (int)Int64.Parse(a);//string converted to int
            SqlConnection con = new SqlConnection("Data Source = (localdb)\\MSSQLLocalDB; Initial Catalog = BlogRecord; Integrated Security = True");
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter("Select username,comment_txt from Comments where postid = " + Id + " order by comment_txt ASC ", con);//sda helps to write query with specific condition
            DataTable dt = new DataTable();//Datatable object created
            sda.Fill(dt); //record feteched from sda fill in datatable
            //Here Foreach loop is use to traversing in datatable and add some properties
            foreach (DataRow row in dt.Rows)
            {
                int count = 0;
                foreach (var item in row.ItemArray)
                {
                    if (count == 0){
                        Label1.Text +="<b>" + item + "</b>";
                    }
                    else
                    {
                        Label1.Text += item;
                    }
                    count++;
                    Label1.Text += "<br />";
                       while (count % 2 == 0)
                        {
                            Label1.Text +="<hr />";
                            count++;
                    }
                     
                }
            }

        }

        //UName() Function Returns the UserName
        protected string UName()
        {
            return uname.ToString();
        }
        //Caption() Function Returns the Caption
        protected string Caption()
        {
            return capt.ToString();
        }
        
    }
}