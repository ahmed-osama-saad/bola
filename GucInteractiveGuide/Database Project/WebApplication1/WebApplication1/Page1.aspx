member<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page1.aspx.cs" Inherits="WebApplication1.Page1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="UserName : "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    </div>
        <asp:Label ID="Label2" runat="server" Text="PassWord : "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="LogIn" />
        &nbsp;</p>
        <a href="Page2.aspx"> Register as a student</a>
        <br />
        <a href="Page3.aspx">Register as an Academic</a>
        <br />
        <a href="Page4.aspx">Register as an Adminstrative</a>
        <br />
        <a href="Page5.aspx">Enter as Guest</a>


    </form>
</body>
</html>
