<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AskQGuest.aspx.cs" Inherits="WebApplication1.AskQGuest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<body>
    <h3>Write Your Question Below</h3>
    <form id="form1" runat="server">
    <div>
    
        Question
    
        <asp:TextBox ID="TextBox1" runat="server" ></asp:TextBox>
    
        <br />
        Name&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <br />
        Subject&nbsp;
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="ask" Width="53px" />
    
    </div>
    </form>
</body>
</html>
