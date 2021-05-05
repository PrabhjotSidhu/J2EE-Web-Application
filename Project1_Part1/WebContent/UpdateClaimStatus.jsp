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
<title>Update Claim Status</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div class="main">
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />

		<sql:query dataSource="${dbsource}" var="result">
            SELECT * from claims where claimid=?;
            <sql:param value="${param.id}" />
		</sql:query>
		<form action="UpdateClaimStatusdb.jsp" method="post">
			<div id="data">
				<table border="0" width="40%">
					<caption>Update Claim Status</caption>
					<tr>
						<th>Date Of Claim</th>
						<th>Description</th>
						<th>Status</th>
					</tr>
					<c:forEach var="row" items="${result.rows}">
						<tr>
							<td><input type="hidden" value="${row.claimid}" name="id" /><input
								type="text" value="${row.description}" name="description"
								disabled /></td>
							<td><input type="text" value="${row.dateofclaim}"
								name="dateofclaim" disabled /></td>
							<td><select name="status" id="status">
									<option value="Approved">Approved</option>
									<option value="Rejected">Rejected</option>
									<option value="In Progress">In Progress</option>
							</select></td>
						</tr>
						<tr>
							<td colspan="3"><div id="button">
									<input type="submit" value="Update" />
								</div></td>
						</tr>
					</c:forEach>
				</table>
			</div>
		</form>
		<div id="button">
			<a href="RegisteredClaimsDisplay.jsp"><input type="submit"
				value="Go Back" /></a>
		</div>
		<%@include file="header.jsp"%>
	</div>
</body>
</html>