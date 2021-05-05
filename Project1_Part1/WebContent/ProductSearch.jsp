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
<title>Search Product</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="main">
		<form method="post">
			<div id="data">
				<input type="hidden" name="submitted" value="true">
				<table border="0" cellspacing="2" cellpadding="5">
					<thead>
						<tr>
							<th colspan="2">Search Product</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label>Product Name : </label></td>
							<td><input type="text" name="pnamesearch" /></td>
						</tr>
						<tr>
							<td></td>
							<td><div id="buttons"><input type="submit" value="Search" /></div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
				<div id="button">
			<a href="indexadmin.jsp"><input type="submit" value="Go Back" /></a>
		</div>
		
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />

		<sql:query dataSource="${dbsource}" var="searchresult">
            SELECT * from productinfo where productname=?;
            <sql:param value="${param.pnamesearch}" />
		</sql:query>

		<c:if
			test="${param.submitted && not empty param.pnamesearch && searchresult.rowCount != 0}">
			<table border="1" width="40%">
				<caption>Product List</caption>
				<tr>
					<th>Product Name</th>
					<th>Product Price</th>
					<th>Product Color</th>
					<th>Product Brand</th>
				</tr>
				<c:forEach var="row" items="${searchresult.rows}">
					<tr>
						<td><c:out value="${row.productname}" /></td>
						<td><c:out value="${row.productprice}" /></td>
						<td><c:out value="${row.productcolor}" /></td>
						<td><c:out value="${row.productbrand}" /></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<br>
		</c:if>

		<font color="red"> <c:if
				test="${param.submitted && not empty param.pnamesearch && searchresult.rowCount == 0}">
				<p>"${param.pnamesearch}" product does'nt exist in the database!</p>
			</c:if>
		</font> <font color="red"> <c:if
				test="${param.submitted && empty param.pnamesearch}">
				<p>Please enter a product name to view product details!</p>
			</c:if>
		</font>
	</div>
	<%@include file="header.jsp" %>
</body>
</html>