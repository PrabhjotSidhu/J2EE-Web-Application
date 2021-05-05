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
<title>Product Info Update</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="main">
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />

		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from productinfo where productname=?;
            <sql:param value="${param.id}" />
		</sql:query>
		<form action="ProductInfoUpdatedb.jsp" method="post">
			<div id="data">
				<table border="0" width="40%">
					<caption>Update Product</caption>
					<tr>
						<th>Product Name</th>
						<th>Product Price</th>
						<th>Product Colour</th>
						<th>Product Brand</th>
					</tr>
					<c:forEach var="row" items="${result.rows}">
						<tr>
							<td><input type="text" value="${row.productname}"
								name="pname" /></td>
							<td><input type="text" value="${row.productprice}"
								name="pprice" /></td>
							<td><input type="text" value="${row.productcolor}"
								name="pcolor" /></td>
							<td><input type="text" value="${row.productbrand}"
								name="pbrand" /></td>
						</tr>
						<tr>
							<td colspan="4"><div id="button">
									<input type="submit" value="Update" />
								</div></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</form>
		<div id="button">
			<a href="ProductDisplay.jsp"><input type="submit" value="Go Back" /></a>
		</div>

	</div>
	<%@include file="header.jsp" %>
</body>
</html>