<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Page2.aspx.cs" Inherits="WebApplication1.Page2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
</head>
<body>
    <h1>Registration Page </h1>
    <h2>Please Enter your Information below for Registration on System</h2>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="First Name : "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    </div>
        <asp:Label ID="Label2" runat="server" Text="Last Name : "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Phone No : "></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="UserName : "></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label5" runat="server" Text="PassWord : "></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <br />
        <br />
        <asp:CheckBox ID="Undergraduate" runat="server" Text="Undergraduate"/>
        <asp:CheckBox ID="Graduate" runat="server" Text="Graduate" />
        <p>
            <asp:Label ID="Label6" runat="server" Text="GPA"></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Text="Admission Year : "></asp:Label>
&nbsp;<asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Register" />
        </p>
    </form>
</body>
</html>
