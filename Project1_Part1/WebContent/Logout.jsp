<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Logout</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
<div id = "main">
        <%
            session.removeAttribute("loginUser");
        %>
        <h1>You have successfully logged out of the system!</h1>
        <div id="button">
        <br>
			<a href="Login.jsp"><input type="submit"
				value="Login" /></a>
		</div>
</div>		
</body>
</html>