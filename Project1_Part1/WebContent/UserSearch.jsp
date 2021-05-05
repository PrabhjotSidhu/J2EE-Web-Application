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
<title>Search User</title>
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
							<th colspan="2">Search User</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label>User Name : </label></td>
							<td><input type="text" name="unamesearch" /></td>
						</tr>
						<tr>
							<td></td>
							<td><div id="buttons">
									<input type="submit" value="Search" />
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />

		<sql:query dataSource="${dbsource}" var="searchresult">
            SELECT * from users where username=?;
            <sql:param value="${param.unamesearch}" />
		</sql:query>

		<c:if
			test="${param.submitted && not empty param.unamesearch && searchresult.rowCount != 0}">
			<table border="1" width="40%">
				<caption>Search Result</caption>
				<tr>
					<th>User Name</th>
					<th>Password</th>
					<th>Cellphone</th>
					<th>Email</th>
					<th>Address</th>
				</tr>
				<c:forEach var="row" items="${searchresult.rows}">
					<tr>
						<td><c:out value="${row.username}" /></td>
						<td><c:out value="${row.password}" /></td>
						<td><c:out value="${row.cellphone}" /></td>
						<td><c:out value="${row.email}" /></td>
						<td><c:out value="${row.address}" /></td>
					</tr>
				</c:forEach>
			</table>
			<br>
			<br>
		</c:if>

		<font color="red"> <c:if
				test="${param.submitted && not empty param.unamesearch && searchresult.rowCount == 0}">
				<p>"${param.unamesearch}" user does'nt exist in the database!</p>
			</c:if>
		</font> <font color="red"> <c:if
				test="${param.submitted && empty param.unamesearch}">
				<p>Please enter a user name to view user details!</p>
			</c:if>
		</font>
		<div id="button">
			<a href="indexadmin.jsp"><input type="submit" value="Go Back" /></a>
		</div>
		<%@include file="header.jsp"%>
	</div>
</body>
</html>