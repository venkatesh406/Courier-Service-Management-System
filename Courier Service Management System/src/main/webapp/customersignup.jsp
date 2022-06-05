<%@ page import="java.sql.*" %>
<%
String fname = request.getParameter("fname");
String lname = request.getParameter("lname");
String email = request.getParameter("email");
String pass = request.getParameter("pass");
String cpass = request.getParameter("cpass");


int id = (int)(Math.random() * 99999 + 1);


try   
{
	 Connection con=null;
	 Class.forName("oracle.jdbc.driver.OracleDriver");
	 con=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/XE","system","root"); 
	 PreparedStatement ps = con.prepareStatement("select * from customersignup where email=?");
	 ps.setString(1, email);
	 
	 ResultSet rs = ps.executeQuery();
	 
	 if(rs.next())
	 {
		 %>
			<h3>Email Exists</h3><br>
	        <a href="customerlogin.html">Try Again</a>
	    <%  
	 }
	 else
	 {
		 PreparedStatement pstmt = con.prepareStatement("insert into customersignup values(?,?,?,?,?,?)");
		 
		 pstmt.setInt(1, id);
		 pstmt.setString(2, fname);
		 pstmt.setString(3, lname);
		 pstmt.setString(4, email);
		 pstmt.setString(5, pass);
		 pstmt.setString(6, cpass);
		
		 int i = pstmt.executeUpdate();
		 
		 if(i>0)
		 {
			%>
			<h3>User Registration Successful</h3><br>
	<a href="customerlogin.html">Go to Login</a>
			<% 
		 }
		 else
		 {
				%>
				<h3>User Registration UnSuccessful</h3><br>
		<a href="customersignup.html">Try to Register Again</a>
				<% 
		 }
		
	 }
}
catch(Exception e)
{
	out.println(e);
}

%>