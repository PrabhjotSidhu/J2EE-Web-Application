<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Signup</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="main">
		<form method="post">
			<div id="data">
				<table border="0" cellspacing="2" cellpadding="5">
					<thead>
						<tr>
							<th colspan="2">Register User</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label>User Name</label></td>
							<td><input type="text" name="username" /></td>
						</tr>
						<tr>
							<td><label>Password</label></td>
							<td><input type="password" name="password" /></td>
						</tr>

						<tr>
							<td><label>Cellphone</label></td>
							<td><input type="text" name="cellphone" /></td>
						</tr>
						<tr>
							<td><label>Email</label></td>
							<td><input type="email" name="email" /></td>
						</tr>
						<tr>
							<td><label>Address</label></td>
							<td><input type="text" name="address" /></td>
						</tr>

						<tr>
							<td><div id="buttons">
									<input type="submit" value="Register" />
								</div></td>
							<td><div id="buttons">
									<input type="reset" value="Reset" />
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>

		<!--  Adding record to table -->

		<sql:setDataSource var="dbCon" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project1_part1" user="root"
			password="1234" />
		<c:choose>
			<c:when
				test="${not empty param.username 
						&& not empty param.password 
						&& not empty param.cellphone 
						&& not empty param.email
						&& not empty param.address}">
				<sql:update dataSource="${dbCon}" var="empRec">
			insert into users values(?,?,?,?,?);
			<sql:param value="${param.username}" />
					<sql:param value="${param.password}" />
					<sql:param value="${param.cellphone}" />
					<sql:param value="${param.email}" />
					<sql:param value="${param.address}" />
				</sql:update>
				<c:if test="${empRec>=1}">
					<div id="buttons">
						<font size="5" color='green'> Congratulations ! Registered
							successfully. <br> Login Here to Continue! <a href="Login.jsp"><input
								type="submit" value="Login" /></a>
						</font>
					</div>
				</c:if>
			</c:when>
			<c:otherwise>
				<p style="color: red;">All fields are mandatory!</p>
			</c:otherwise>
		</c:choose>
	</div>
</body>
</html>