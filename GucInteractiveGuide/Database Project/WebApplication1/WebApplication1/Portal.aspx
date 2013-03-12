<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Portal.aspx.cs" Inherits="WebApplication1.academics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Academics' Portal</title>
</head>
<body> 
    <form id="form2" runat="server">
    
    <h4>Welcome to GUC Portal&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <a href="ChangePassword.aspx">Change Password</a>&nbsp; <a href="Page1.aspx">Logout</a> </h4>
    
        Academic Staff Actions<br />
        <br />
    
        <a href="CheckOfferedDegrees.aspx">Check Offered Degrees</a>
        <br />
        
        <a href="CheckResults.aspx">Check Survey Results</a>
        
        <br />
        <a href="AddCourse.aspx">Add Course</a>
        <br />
             <a href="AddLect.aspx">Add Lecturers to a Course</a> <br />
             <a href="ViewFaq.aspx">View FAQ</a>
        <br />
             <a href="DefineAssess.aspx">Define Course Assessment</a><br />
        <br />
        
        <p>Students Actions</p>
        <p>&nbsp;<a href="Register.aspx">Register Courses</a><br />
            <a href="fill.aspx">Fill Course Survey</a><br />
                <a href="fillSatis.aspx">Fill Satisfactory Survey</a><br />
                    <a href="CheckDetails.aspx">Check my Courses Details</a><br />
                        <a href="GradSur.aspx">Fill Graduation survey</a><br />
                            <a href="CheckNotf.aspx">Check notification</a><br /></p>

                 <p>
                     Administrative Staff Actions</p>
            <p>
                     <a href="CheckOfferedDegrees.aspx">Check Offered Degrees</a><br />
                     <a href="ViewFaq.aspx">View FAQ</a><br />
                     <a href="SendReport.aspx">Send Report</a><br />
                     <a href="CheckReport.aspx">Check Reports</a><br />
                 </p>
 
    </form>
</body>
</html>