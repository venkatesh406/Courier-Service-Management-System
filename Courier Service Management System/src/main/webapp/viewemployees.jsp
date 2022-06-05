<%@ page import="java.sql.*" %>
<%
String aid = (String)session.getAttribute("aid");
String pwd = (String)session.getAttribute("pwd");
if(aid==null || pwd==null)
{
    response.sendRedirect("asession.html");
}
%>
<html>
    <head>
        <title>Simple JSP Application</title>
    </head>
    <body bgcolor="white">
        <h2 align="center" style="size:10pt;color:red">Simple JSP Application</h2>
        <hr color="green"><hr color="green"><br>
        <a href="adminhome.jsp">Home</a>&nbsp;&nbsp;&nbsp;
        <a href="viewemployees.jsp">customers</a>&nbsp;&nbsp;&nbsp;
        <a href="alogout.jsp">Logout</a>
        <br><br>
        <h3 align=right>Welcome&nbsp;&nbsp;<%=aid%></h3><br>
<table align=center width="800">
<tr align=center bgcolor="pink" border=1>
<th>ID</th>
<th>FULL NAME</th>
<th>LAST NAME</th>
<th>EMAIL ID</th>
<th>PASSWORD</th>
<th>ACTION</th>
</tr>
<%

Connection con=null;
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","system","root");
 
 PreparedStatement pstmt = con.prepareStatement("select * from employeesignup");
 ResultSet rs = pstmt.executeQuery();
 while(rs.next())
{
	%>
	<tr align=center>
	<td><%=rs.getString("id")%></td>
	<td><%=rs.getString("fname")%></td>
	<td><%=rs.getString("lname")%></td>
	<td><%=rs.getString("email")%></td>
	<td><%=rs.getString("pass")%></td>
	<td>
	<a href="deleteemployees.jsp?id=<%=rs.getString("id")%>">DELETE</a>
	</td>
	</tr>
	<%
}

%>
</table>
    </body>
</html>



