<%@ page import="java.sql.*"%>
<%@ page import="oracle.jdbc.OracleDriver" %>
<%
String fname=request.getParameter("fname");
String lname=request.getParameter("lname");
String Email=request.getParameter("email");
String password=request.getParameter("pass");
String cpassword=request.getParameter("cpass");
%>
<%
  try
  {
	  Connection con=null;
	  DriverManager.registerDriver(new OracleDriver());
	  con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE","system","root");
      PreparedStatement ps = con.prepareStatement("insert into signup values(?,?,?,?,?,?)" ); 
	  ps.setString(1,fname);
	  ps.setString(2,lname);
	  ps.setString(3,Email);
	  ps.setString(4,password);
	  ps.setString(5,cpassword);
	  int x=ps.executeUpdate();
	  if(x!=0)
	  {
		  out.print("<h1>Signup Success</h1>");
	  }
	  else{
		out.print("Please follow conditions");   
	  }
  }
  catch(Exception e)
  {
	  out.print(e);
  }
 
%>