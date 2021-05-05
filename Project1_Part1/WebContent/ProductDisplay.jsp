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
<title>List of All Products</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script>
	function confirmGo(m, u) {
		if (confirm(m)) {
			window.location = u;
		}
	}
</script>
</head>
<body>
	<br clear="all">
	<div id="main">
		<form action="ProductInfoInsertdb.jsp" method="post">
			<div id="data">
				<table border="0" cellspacing="2" cellpadding="5">
					<thead>
						<tr>
							<th colspan="2">Insert New Product</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label>Product Name</label></td>
							<td><input type="text" name="pname" /></td>
						</tr>
						<tr>
							<td><label>Product Price</label></td>
							<td><input type="text" name="pprice" /></td>
						</tr>
						<tr>
							<td><label>Product Color</label></td>
							<td><input type="text" name="pcolor" /></td>
						</tr>
						<tr>
							<td><label>Product Brand</label></td>
							<td><input type="text" name="pbrand" /></td>
						</tr>
						<tr>
							<td></td>
							<td><div id="buttons">
									<input type="submit" value="Insert" /> <input type="reset"
										value="Reset" />
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<div id="button">
			<a href="indexadmin.jsp"><input type="submit" value="Go Home" /></a>
		</div>

		<font color="red"><c:if test="${not empty param.errMsg}">
				<c:out value="${param.errMsg}" />
				<br>
				<br>
			</c:if></font> <font color="green"><c:if test="${not empty param.susMsg}">
				<c:out value="${param.susMsg}" />
				<br>
				<br>
			</c:if></font>
		<div id="button">
			<br> <a href="ProductSearch.jsp"><input type="submit"
				value="Search For Specific Product Details" /></a>
		</div>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />
		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from productinfo;
        </sql:query>
		<table border="1" width="40%">
			<caption>Product List</caption>
			<tr>
				<th>Product Name</th>
				<th>Product Price</th>
				<th>Product Color</th>
				<th>Product Brand</th>
				<th colspan="2">Action</th>
			</tr>
			<c:forEach var="row" items="${result.rows}">
				<tr>
					<td><c:out value="${row.productname}" /></td>
					<td><c:out value="${row.productprice}" /></td>
					<td><c:out value="${row.productcolor}" /></td>
					<td><c:out value="${row.productbrand}" /></td>
					<td><div id="buttons">
							<a
								href="ProductInfoUpdate.jsp?id=<c:out value="${row.productname}"/>"><input
								type="submit" value="Update" /></a>
						</div></td>
					<td><div id="buttons">
							<a
								href="javascript:confirmGo('Sure to delete this record?','ProductInfoDeletedb.jsp?id=<c:out value="${row.productname}"/>')"><input
								type="submit" value="Delete" /></a>
						</div></td>
				</tr>
			</c:forEach>
		</table>
		<%@include file="header.jsp"%>
	</div>
</body>
</html>