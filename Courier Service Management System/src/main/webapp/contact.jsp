h<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.OracleDriver" %>
<%
String name=request.getParameter("name");
String email=request.getParameter("email");
String phone=request.getParameter("phonenumber");
String msg=request.getParameter("message");

%>
<%

  try
  {
	  Connection con=null;
	  DriverManager.registerDriver(new OracleDriver());
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
      PreparedStatement ps = con.prepareStatement("insert into contact values(?,?,?,?)" ); 
	  ps.setString(1,name);
	  ps.setString(2,email);
	  ps.setString(3,phone);
	  ps.setString(4,msg);
	  int x=ps.executeUpdate();
	  if(x!=0)
	  {
		  String redirectURL="homepage.html";
		  response.sendRedirect(redirectURL);
	  }
	  else{
		out.print("Invalid Login");   
	  }
  }
  catch(Exception e)
  {
	  out.print(e);
  }
 
%>