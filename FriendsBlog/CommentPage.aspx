<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="CommentPage.aspx.cs" Inherits="FriendsBlog.CommentPage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div  style="background-color:#ffd800">
    <formview>
     <table align="center" DataKeyField="postid">
        <tr>
            <td>
                <asp:Image ID="image" runat="server" BorderWidth="1px" Height="700px" Width="700px" />
            </td>
        </tr>
         <tr>
             <td>
                <asp:TextBox ID="comment" runat="server" TextMode="MultiLine" placeholder="comment here" Width="700px"></asp:TextBox>
                <asp:Button ID="addcomment" runat="server" Text="Send" OnClick="addcomment_Click"  />
            </td>
         </tr>
       </table>
  </formview>
        </div> 
</asp:Content>
