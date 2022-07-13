<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Display.aspx.cs" Inherits="FriendsBlog.Display" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <%--<h1><%=UName()%></h1>--%>
  <div id="form1" runat="server" style="background-color:#ffd800">
    <table align="center" DataKeyField="postid" >
        <tr>
            <td>
                <asp:Image ID="image" runat="server" BorderWidth="1px" Height="700px" Width="700px" />
            </td>
        </tr>
         <tr>
             <td>
                 <asp:Button ID="BtnLike_Click" runat="server" Font-Bold="true" BackColor="#0000cc" Text="Like" CommandName="VoteUp" OnClick="BtnLike_Click_Click" CommandArgument='<%# Eval("postid") %>' />
                  <asp:Button ID="btnDislike_Click" runat="server" Font-Bold="true" BackColor="#0000cc" Text="Dislike" CommandName="VoteDown" OnClick="btnDislike_Click_Click" CommandArgument='<%# Eval("postid") %>' />
             </td>
         </tr>
        <tr>
            <td>
                <asp:Label ID="username" runat="server" Font-Bold="true" ><%=UName()%></asp:Label>
            </td>
        </tr>
        
        <tr>
            <td>
                <asp:Label ID="caption" runat="server"><%=Caption()%></asp:Label><hr />
                <div>
                      <asp:Label ID="Label2" runat="server" BackColor="YellowGreen">Comments</asp:Label>
                </div><hr />
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    </div>
<%--<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlogRecordConnectionString %>" SelectCommand="SELECT * FROM [Post] WHERE ([postid] = @postid)">
    <SelectParameters>
        <asp:Parameter Name="postid" Type="Int32" />
    </SelectParameters>
    </asp:SqlDataSource>--%>
</asp:Content>
