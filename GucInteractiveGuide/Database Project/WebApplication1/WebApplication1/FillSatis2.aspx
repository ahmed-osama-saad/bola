<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FillSatis2.aspx.cs" Inherits="WebApplication1.FillSatis2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <h2>Satisfaction Survey</h2>
    <h3><a href="Portal.aspx">Home</a>
        <br /></h3>
    <form id="form1" runat="server">
    <div>
    <asp:TextBox ID="TextBox1" runat="server" Height="141px" OnTextChanged="TextBox1_TextChanged" Width="396px"></asp:TextBox>
    </div>
    </form>
</body>
</html>
