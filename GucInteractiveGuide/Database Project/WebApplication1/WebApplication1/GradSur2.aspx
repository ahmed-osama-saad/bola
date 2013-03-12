<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradSur2.aspx.cs" Inherits="WebApplication1.GradSur2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Graduation Survey</title>
</head>
<body>
    <h3>Your Final Survey Congratulations&nbsp;&nbsp;&nbsp;&nbsp; <a href="Portal.aspx">Home</a>
        <br /></h3>

    <form id="form1" runat="server">
    <div>
            <asp:TextBox ID="TextBox1" runat="server" Height="141px" OnTextChanged="TextBox1_TextChanged" Width="396px"></asp:TextBox>

    </div>
    </form>
</body>
</html>