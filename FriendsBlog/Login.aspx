<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="FriendsBlog.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div id="form1" runat="server">
        <div align="center">
             <table align="center" style="background-color: #b6ff00; margin-right: 350px;width: 508px;height: 366px;">
        <tr>
            <td colspan="2" align="center">
                <h2>Login Page</h2></td>
        </tr>
        <tr>
            <td align="center" style="width:50%"><b>Username:</b></td>
            <td >
                <b><asp:TextBox ID="TextBox1" runat="server" Height="46px" Width="176px" style="background-color: #b6ff00"></asp:TextBox></b>
            </td>
        </tr>
        <tr>
            <td  align="center" style="width:50%"><b>Password:</b></td>
            <td>
                <b><asp:TextBox ID="TextBox2" runat="server" Height="46px" Width="176px" style="background-color: #b6ff00" TextMode="Password"></asp:TextBox></b>
            </td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <asp:Button ID="Button1" runat="server" Text="Login" Height="45px" Width="164px" style="background-color: #b6ff00" Font-Bold="True" Font-Size="Large" OnClick="Button1_Click" />
            </td>
           
        </tr>
        <tr style="background-color:#b6ff00">
            <td colspan="2" style="text-align:right">
              </td>    
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
       </div>
        </div>
</asp:Content>
