<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AddCourse.aspx.cs" Inherits="WebApplication1.AddCourse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <h1>Add Course</h1>
    <h2>Enter The Form Below To add a Course</h2>
    <form id="form1" runat="server">
    <div>
    
        <asp:Label ID="Label1" runat="server" Text="Course Code : "></asp:Label>
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
    
    </div>
        <asp:Label ID="Label2" runat="server" Text="Course Name : "></asp:Label>
        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label3" runat="server" Text="Course Type : "></asp:Label>
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label4" runat="server" Text="Coardinator : "></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" Height="20px" Width="131px"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label9" runat="server" Text="Semester"></asp:Label>
            <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
        </p>
        <asp:Label ID="Label5" runat="server" Text="Language : "></asp:Label>
        <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
        <p>
            <asp:Label ID="Label6" runat="server" Text="Content : "></asp:Label>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label7" runat="server" Text="Resources : "></asp:Label>
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
        </p>
        <p>
            <asp:Label ID="Label8" runat="server" Text="Learning_Outcome : "></asp:Label>
            <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
        </p>
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Course" />
    </form>
</body>
</html>
