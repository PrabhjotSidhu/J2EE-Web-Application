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
<title>List of Registered Claims</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="main">
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />

		<table border="1">
			<caption>List of Registered Claims for Product Registration
				ID : ${param.id}</caption>
			<sql:query dataSource="${dbsource}" var="claimsresult">
            	SELECT * from claims where productregistrationid = ?;
            	<sql:param value="${param.id}" />
			</sql:query>
			<sql:query dataSource="${dbsource}" var="productregresult">
            	SELECT * from productregistration where productregistrationid = ?;
            	<sql:param value="${param.id}" />
			</sql:query>

			<tr>
				<th>Product Name</th>
				<th>Date of Claim</th>
				<th>Description</th>
				<th>Status</th>
				
			</tr>
			<c:forEach var="prodregrow" items="${productregresult.rows}">
				<c:forEach var="cliamsrow" items="${claimsresult.rows}">
					<tr>
						<td><c:out value="${prodregrow.productname}" /></td>
						<td><c:out value="${cliamsrow.dateofclaim}" /></td>
						<td><c:out value="${cliamsrow.description}" /></td>
						<td><c:out value="${cliamsrow.status}" /></td>
						
					</tr>
				</c:forEach>
			</c:forEach>
		</table>
				<div id="button">
			<a href="indexcustomer.jsp"><input type="submit" value="Go Back" /></a>
		</div>
		<%@include file="header.jsp" %>
	</div>
</body>
</html>