<%@ page import="java.sql.*" %>
<%

String email = request.getParameter("email");
String pwd = request.getParameter("pwd");

try
{
	  Connection con=null;
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","system","root");
	  PreparedStatement pstmt = con.prepareStatement("select * from customersignup  where email=? and pass=?");
	  pstmt.setString(1,email);
	  pstmt.setString(2,pwd);
	  ResultSet rs = pstmt.executeQuery();
	  if(rs.next())
	  {
		 session.setAttribute("fname", rs.getString("fname"));
		 session.setAttribute("email", email);
		 session.setAttribute("pwd", pwd);
		 session.setMaxInactiveInterval(100);
		 response.sendRedirect("customerhome.jsp");
	  }
	  else
	  {
		  %>
			<h3>Login Failed</h3><br>
	<a href="customerlogin.html">LOGIN</a>
			<% 
	  }
}
catch(Exception e)
{
	out.println(e);
}



%>