<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/Home.Master" AutoEventWireup="true" CodeBehind="UserAccount.aspx.cs" Inherits="FriendsBlog.User_Account" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
 
    <div id="form1" runat="server" style="background-color:#ffd800" OnItemCommand="DataList1_ItemCommand">
     <table>
     </table>
        <h1 align="center">Your Posts:</h1>
        <asp:DataList style="background-color:#ffa100" ID="DataList1" runat="server" DataKeyField="userid" Height="300px" Width="600px"  RepeatColumns="2" align="center" >
        <ItemTemplate >
            <table align="center">
                <tr>
                    <td style="text-align:center">
                        <asp:Image ID="image" runat="server" BorderColor="#660066" ImageUrl='<%# Eval("image") %>' BorderWidth="1px" Height="300px" Width="450px" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align:center;background-color:#808080">
                        <asp:Label ID="caption" runat="server" Font-Bold="True" ForeColor="White"><%# Eval("caption") %> </asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <asp:HyperLink ID="HyperLink1" ForeColor="White" style="text-align:center;padding-top:7px" Height="25px" Width="70px" Font-Bold="true"  Font-Size="Medium" BackColor="#666666"  runat="server" NavigateUrl=<%#string.Format("~/Display.aspx?postid={0}",HttpUtility.UrlEncode(Eval("postid").ToString())) %> >VIEW</asp:HyperLink>
                        <%--<asp:HyperLink ID="HyperLink2" ForeColor="White" style="text-align:center;padding-top:7px"  Height="25px" Width="100px" Font-Bold="true"  Font-Size="Medium" BackColor="#666666"  runat="server" NavigateUrl=<%#string.Format("~/DeletePost.aspx?postid={0}",HttpUtility.UrlEncode(Eval("postid").ToString())) %> >DELETE</asp:HyperLink>--%>
                        <asp:label id="lbl_del_image" runat="server"  text='<%#Eval("image") %>'  visible="false"> </asp:label>
                       <asp:linkbutton id="Delete" ForeColor="White" style="text-align:center;padding-top:7px" Height="25px" Width="100px" Font-Bold="true"  Font-Size="Medium" BackColor="#666666" runat="server" text="DELETE" onclick="Delete_Click" />
                     </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
        </div>
</asp:Content>
