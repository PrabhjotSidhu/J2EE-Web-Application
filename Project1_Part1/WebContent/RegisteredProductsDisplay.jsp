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
<title>List of Registered Products</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="main">
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />

		<table border="1">
			<caption>List of Registered Products for ${param.id}</caption>
			<sql:query dataSource="${dbsource}" var="productregresult">
            	SELECT * from productregistration where username = ?;
            	<sql:param value="${param.id}" />
			</sql:query>
			<tr>
				<th>Product Name</th>
				<th>User Name</th>
				<th>Serial No</th>
				<th>Purchase Date</th>
				<th>Action</th>
			</tr>
			<c:forEach var="prodregrow" items="${productregresult.rows}">
				<tr>
					<td><c:out value="${prodregrow.productname}" /></td>
					<td><c:out value="${prodregrow.username}" /></td>
					<td><c:out value="${prodregrow.serialno}" /></td>
					<td><c:out value="${prodregrow.purchasedate}" /></td>
					<td><div id="buttons">
							<a
								href="RegisteredClaimsDisplay.jsp?id=<c:out value="${prodregrow.productregistrationid}"/>"><input
								type="submit" value="View Registered Claims" /></a>
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