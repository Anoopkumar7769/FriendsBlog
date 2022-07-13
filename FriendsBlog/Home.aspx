<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="FriendsBlog.Home1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server"> 
    <div id="form1" runat="server" style="background-color:#ffd800" OnItemCommand="DataList1_ItemCommand">
     <table>

     </table>
       
    <asp:DataList style="background-color:#ffa100" ID="DataList1" runat="server" DataKeyField="postid" DataSourceID="SqlDataSource1" Height="300px" Width="600px" RepeatColumns="1" align="center" >
        <ItemTemplate >
            <table align="center">
                <tr>
                    <td style="text-align:center">
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("image") %>' BorderColor="#660066" BorderWidth="1px" Height="300px" Width="450px" />
                    </td>
                </tr>
                <tr style="text-align:justify-all">
                    <td>
                         <asp:HyperLink ID="HyperLink1" align="left" ForeColor="Black"   runat="server" NavigateUrl=<%#string.Format("~/Posts.aspx?userid={0}",HttpUtility.UrlEncode(Eval("userid").ToString())) %> Height="25px" Width="171px" Font-Bold="true" Font-Size="Medium" CommandArgument='<%# Eval("userid")%>' CommandName='<%# Eval("userid") %>' ><%# Eval("username") %></asp:HyperLink>
                         <asp:Label ID="Label2" align="end" style="text-transform:uppercase" runat="server" Text='<%# "Posted: " + Eval("posted", "{0:ddd MMM d yyyy}")%>' Font-Bold="True" ForeColor="#333300"  Width="290px"></asp:Label>
                    </td> 
                </tr>
                <tr style="text-align:center;background-color:#808080;" > 
                    <td>
                        <asp:Label ID="Label1" runat="server" Height="30px" Width="400px" Text='<%# Eval("caption")%>' Font-Bold="True" ForeColor="White"></asp:Label>
                     </td>
                </tr>
                <tr>
                </tr>
                <tr>
                     <td align="center">
                       <asp:Label  ID="tlikes" runat="server" style=" border:1px solid Red;background-color:azure;border-style:groove;text-align:center;border-top:5px;outline-style:unset;" BackColor="#ffff00"  ForeColor="#800000" align="left" Text='<%# "Total Likes: " + Eval("total") %>'  Height="20px" Width="110px"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Button ID="Button2" style=" border:1px solid Red;background-color:azure;border-style:groove;border-top:5px;outline-style:ridge;" align="left" runat="server" Text="Comment" Height="20px" Width="110px" CommandArgument='<%# Eval("postid") %>' CommandName="Comment" OnClick="Button2_Click"  />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                       <asp:Button ID="Button1" style=" border:1px solid Red;background-color:bisque;border-style:groove;border-top:5px;outline-style:ridge;" align="end" runat="server" Text="View" Height="20px" Width="110px" CommandArgument='<%# Eval("postid") %>' CommandName="View" OnClick="Button1_Click"  />
                     </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
        </div>

    <%--Data to display products--%>
   <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlogRecordConnectionString %>" SelectCommand="SELECT Post.postid,Post.userid, Post.posted, Post.image,Post.caption,Users.username,count(Likes.userid) as total FROM Post LEFT join Users ON Users.userid = Post.userid LEFT Join Likes ON Likes.postid = Post.postid group by Post.postid,Post.userid, Post.posted, Post.image,Post.caption,Users.username ORDER BY Post.postid DESC;" ></asp:SqlDataSource>
   
   </asp:Content>

