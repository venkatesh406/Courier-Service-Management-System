<%@ page import="java.sql.*" %>
<%

String aid = request.getParameter("aid");
String pwd = request.getParameter("pwd");

try
{
	  Connection con=null;
	  Class.forName("oracle.jdbc.driver.OracleDriver");
	  con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","system","root");
	  
	  PreparedStatement pstmt = con.prepareStatement("select * from admin1 where id=? and password=?");
	  pstmt.setString(1,aid);
	  pstmt.setString(2,pwd);
	  ResultSet rs = pstmt.executeQuery();
	
	  //if(rs.next())
	  //{
		 session.setAttribute("aid", aid);
		 session.setAttribute("pwd", pwd);
		 response.sendRedirect("adminhome.jsp");
	  //}
	 // else
	  //{
		 // %>
			//<h3>Authentication failed!</h3><br>
	//<a href="adminlogin.html"><u>LOGIN</u></a>
			//<% 
	  //}
}
catch(Exception e)
{
	out.println(e);
}



%>