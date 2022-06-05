<%@ page import="java.sql.*" %>
<%
String aid = (String)session.getAttribute("aid");
String pwd = (String)session.getAttribute("pwd");
if(aid==null || pwd==null)
{
    response.sendRedirect("asession.html");
}
%>
<%
String id = request.getParameter("id");
%>
<%
 Connection con=null;
 Class.forName("oracle.jdbc.driver.OracleDriver");
 con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","system","root");
 PreparedStatement pstmt = con.prepareStatement("delete from employeesignup where id=?");
 pstmt.setString(1,id);
 pstmt.executeUpdate();
 response.sendRedirect("viewemployees.jsp");

%>