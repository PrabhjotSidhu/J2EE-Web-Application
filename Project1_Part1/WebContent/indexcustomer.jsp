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
<title>Home</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="main">
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />
		<h1>Choose Option</h1>
		<br>
		<div id="button">
			<a href="RegisterProduct.jsp"><input type="submit"
				value="Register New Purchased Product" /></a>
		</div>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />

		<sql:query dataSource="${dbsource}" var="searchresult">
            SELECT * from productregistration where username=?;
            <sql:param value="${loginUser}" />
		</sql:query>
		<table border="1" width="40%">
			<caption>Registered Products</caption>
			<tr>
				<th>Product Name</th>
				<th>User Name</th>
				<th>Serial No</th>
				<th>Purchase Date</th>
				<th colspan="2">Action</th>
			</tr>
			<c:forEach var="row" items="${searchresult.rows}">
				<tr>
					<td><c:out value="${row.productname}" /></td>
					<td><c:out value="${row.username}" /></td>
					<td><c:out value="${row.serialno}" /></td>
					<td><c:out value="${row.purchasedate}" /></td>
					<td><div id="buttons">
							<a
								href="RegisterClaim.jsp?id=<c:out value="${row.productregistrationid}"/>"><input
								type="submit" value="Add new Claims" /></a>
						</div></td>
					<td><div id="buttons">
							<a
								href="RegisteredClaimsDisplayCustomer.jsp?id=<c:out value="${row.productregistrationid}"/>"><input
								type="submit" value="View Registered Claims" /></a>
						</div></td>

				</tr>
			</c:forEach>
		</table>
	</div>
	<%@include file="header.jsp"%>
</body>
</html>