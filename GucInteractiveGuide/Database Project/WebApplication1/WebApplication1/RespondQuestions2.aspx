<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RespondQuestions2.aspx.cs" Inherits="WebApplication1.RespondQuestions2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <a href="RespondQuestions.aspx">Go Back To Questions ?</a><form id="form1" runat="server">
        <asp:Label ID="Label1" runat="server" Text="Question  : "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
&nbsp;<div>
    
            <asp:Label ID="Label2" runat="server" Text="Reply  : "></asp:Label>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <br />
    
    </div>
        <p style="margin-left: 200px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Answer" />
        </p>
    </form>
</body>
</html>
