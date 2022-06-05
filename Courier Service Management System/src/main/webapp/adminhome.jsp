<%
String aid = (String)session.getAttribute("aid");
String pwd = (String)session.getAttribute("pwd");
//if(aid==null || pwd==null)
//{
   // response.sendRedirect("asession.html");
//}
%>
<html>
    <head>
        <title>Welcome to admin</title>
    </head>
    <body bgcolor="white">
        <h2 align="center" style="size:10pt;color:red">You are in Admin Page</h2>
        <hr color="green"><hr color="green"><br>
        <a href="adminhome.jsp">Home</a>&nbsp;&nbsp;&nbsp;
         <a href="viewcustomers.jsp">customers</a>&nbsp;&nbsp;&nbsp;
        <a href="viewemployees.jsp">employees</a>&nbsp;&nbsp;&nbsp;
        <a href="adminlogout.jsp">Logout</a>
        <br><br>
        <h3 align=center>Welcome&nbsp;&nbsp;<%=aid%></h3>
    </body>
</html>

