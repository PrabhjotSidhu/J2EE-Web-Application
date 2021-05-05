<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<h1>This is Admin View</h1>
	<div id="main">
		<h1>Choose Option</h1>
		<br>
		<div id="button">
			<a href="UserDisplay.jsp"><input type="submit"
				value="View all the Users" /></a>
		</div>
		<br>
		<div id="button">
			<a href="ProductDisplay.jsp"><input type="submit"
				value="View all the Products" /></a>
		</div>
	</div>
	<%@include file="header.jsp" %>
</body>
</html>