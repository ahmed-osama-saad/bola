<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GradSur.aspx.cs" Inherits="WebApplication1.GradSur" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <h3><a href="Portal.aspx">Home</a>
        <br /></h3>
    <form id="form1" runat="server">
    <div>
     Evaluation Name&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
    </div>
    </form>
</body>
</html>