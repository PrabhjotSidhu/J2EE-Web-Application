<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List of All Users</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="main">
		<div id="button">
			<a href="UserSearch.jsp"><input type="submit"
				value="Search Specific User Details" /></a>
		</div>
		<p></p>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />
		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from users;
    </sql:query>
		<table border="1" width="40%">
			<caption>User List</caption>
			<tr>
				<th>User Name</th>
				<th>Password</th>
				<th>Cellphone</th>
				<th>Email</th>
				<th>Address</th>
				<th>Action</th>
			</tr>

			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.username}" /></td>
					<td><c:out value="${row.password}" /></td>
					<td><c:out value="${row.cellphone}" /></td>
					<td><c:out value="${row.email}" /></td>
					<td><c:out value="${row.address}" /></td>
					<td><div id="buttons">
							<a
								href="RegisteredProductsDisplay.jsp?id=<c:out value="${row.username}"/>"><input
								type="submit" value="View Registered Products" /></a>
						</div></td>
				</tr>
			</c:forEach>
		</table>
		<div id="button">
			<a href="indexadmin.jsp"><input type="submit" value="Go Back" /></a>
		</div>
		<%@include file="header.jsp"%>
	</div>

</body>
</html>