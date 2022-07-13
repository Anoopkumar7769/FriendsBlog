<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="FriendsBlog.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div id="form1" runat="server">
    <table style="background-color: #b6ff00; margin-right: 300px; height: 300px;width: 600px;margin-bottom: 0px;" align="center">
        <tr>
            <td colspan="2" align="center">
                <h2>Registeration Page</h2>
                <hr />
            </td>
            <td>&nbsp</td>
        </tr>
        <tr>
            <td style="height: 1px; width: 951px;width:50%" align="center">
                <b>Username:</b>
            </td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server" Height="47px" Width="239px" style="background-color: #b6ff00"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="User Name is Empty" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="Only Characters" ForeColor="Red" ValidationExpression="^[A-Za-z]*$"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td style="width:50%;height: 1px; width: 951px;" align="center"> <b>Email_ID:</b></td>
            <td>
                <asp:TextBox ID="TextBox2" runat="server" Height="47px" Width="239px" TextMode="Email" style="background-color: #b6ff00"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" ErrorMessage="Email_ID is Empty" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        
        <tr>
            <td  style="height: 1px; width: 951px;width:50%" align="center"> <b>Password:</b></td>
             <td>
                <asp:TextBox ID="TextBox3" runat="server" Height="47px" Width="239px" TextMode="Password" style="background-color: #b6ff00"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3" ErrorMessage="Password Field is Empty" ForeColor="Red">*</asp:RequiredFieldValidator><br />
            </td>
        </tr>
       
        
        <tr>
            <td align="center" colspan="2">
                <br />
                <asp:Button ID="Button1" runat="server" Text="Register" Height="51px" Width="206px" Font-Bold="True" Font-Size="Large" style="background-color: #b6ff00" OnClick="Button1_Click" /> &nbsp;&nbsp;&nbsp;
                 <asp:Button ID="Button2" runat="server" Text="Reset" Height="51px" Width="206px" Font-Bold="True" Font-Size="Large" style="background-color: #b6ff00" OnClick="Button2_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
            </td>
        </tr>
        <tr>
            <td colspan="2" style="height: 39px;">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </td>
            <td style="height: 39px;"></td>
        </tr>
    </table>
    </div>
</asp:Content>
