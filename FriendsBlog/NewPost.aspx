<%@ Page Title="" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="NewPost.aspx.cs" Inherits="FriendsBlog.NewPost" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="navbar" style="border-width:3px;border-color:#333333;height:auto">
           <table style="width:700px;height:390px;background-color:#5f98f3;" align="center">
               
               <tr>
                   <td align="center" width="50%" colspan="2">
                       <h1>Add New Post</h1><hr />
                   </td>
               </tr>
               <tr>
                   <td align="center" width="50%">
                       <h3>
                           Image:
                       </h3>
                   </td>
                   <td width="50%">
                       <asp:FileUpload ID="imageUpload" runat="server"></asp:FileUpload>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                           ErrorMessage="Image is Mandatory" ControlToValidate="imageUpload" 
                           Display="Dynamic" ForeColor="Red">
                           *</asp:RequiredFieldValidator>
                   </td>
               </tr>
               <tr>
                   <td align="center" width="50%" >
                       <h3>
                          Caption
                       </h3>
                   </td>
                   <td width="50%">
                       <asp:TextBox ID="txtCapt" runat="server" TextMode="MultiLine" placeholder="caption here"></asp:TextBox>
                       <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                          ControlToValidate="txtCapt" Display="Dynamic" ForeColor="Red" >*</asp:RequiredFieldValidator>
                   </td>
               </tr>
             
               <tr>
                   <td align="center" width="50%" colspan="2">
                       <asp:Button ID="btnSubmit" runat="server" Text="Add" Font-Bold="true" ForeColor="Black" Height="36px"
                           Width="88px" OnClick="btnSubmit_Click" />
                   </td>
               </tr>
               <tr>
                   <td colspan="2" align="center">
                       <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red"
                          HeaderText="Fix the following Error" />
                   </td>
               </tr>
           </table>

       </div>
        <div>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:BlogRecordConnectionString %>" SelectCommand="SELECT [image], [caption], [date] FROM [Post]"></asp:SqlDataSource>
        </div>
</asp:Content>
