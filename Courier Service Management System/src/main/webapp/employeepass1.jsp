<%@ page import="java.sql.*" %>
<!--  <%
String fname = (String)session.getAttribute("fname");
String email = (String)session.getAttribute("email");
String pwd = (String)session.getAttribute("pwd");
if(fname==null || email==null || pwd==null)
{
    response.sendRedirect("employeelogin.html");
}
%>-->
<%

String opwd = request.getParameter("opwd");
String npwd = request.getParameter("npwd");

try
{
	Connection con=null;
	Class.forName("oracle.jdbc.driver.OracleDriver");
	con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","system","root");
	  
	  PreparedStatement pstmt = con.prepareStatement("select * from employeesignup where email=? and pass=?");
	  pstmt.setString(1,email);
	  pstmt.setString(2,opwd);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		  PreparedStatement pstmt1 = con.prepareStatement("update employeesignup set pass=? where email=?");
		  pstmt1.setString(1,npwd);
		  pstmt1.setString(2,email);
		  int i = pstmt1.executeUpdate();
		  if(i>0)
		  {
			  %>
				<h3>Password Updated Successfully</h3><br>
		<a href="employeelogin.html">Login Again</a>
				<% 
		  }
		  else
		  {
			  %>
			<h3>Password has not been updated</h3><br>
	<a href="employeepass.jsp">Try Again</a>
				<%   
		  }
	  }
	  else
	  {
		  %>
			<h3>Current Password is incorrect</h3><br>
	<a href="employeepass.jsp">Try Again</a>
			<% 
	  }
}
catch(Exception e)
{
	out.println(e);
}



%>