<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
</head>
<body>
<%
session.setMaxInactiveInterval(10);
%>
<h1 align=center>You just left the admin page</h1>
<h3>Log out success !!</h3><br>
<a href="adminlogin.html">LOGIN</a>&nbsp;&nbsp;
<a href="homepage.html">HOME</a>
</body>
</html>