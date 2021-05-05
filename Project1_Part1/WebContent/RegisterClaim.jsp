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
<title>Register Claim</title>
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
							<th colspan="2">Register Claim</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label>Date of Claim : </label></td>
							<td><input type="date" name="claimDate" /></td>
						</tr>
						<tr>
							<td><label>Product Registration ID : </label></td>
							<td><input type="text" name="regid" /></td>
						</tr>
						<tr>
							<td><label>Description : </label></td>
							<td><textarea rows="7" cols="30" name="desc"></textarea></td>
						</tr>
						<tr>
							<td colspan="2"></td>
						</tr>
						<tr>
							<td colspan="2"><div id="button">
									<input type="submit" value="Submit" />
								</div></td>
						</tr>
						<tr>
							<td colspan="2"><div id="button">
									<input type="reset" value="Reset" />
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<div id="button">
			<a href="indexcustomer.jsp"><input type="submit" value="Go Back" /></a>
		</div>

		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project1_part1" user="root"
			password="1234" />
		<div id="data">
		<c:if test="${param.submitted}"> 
			<c:choose>
				<c:when
					test="${not empty param.claimDate 
						&& not empty param.regid 
						&& not empty param.desc
					}">
					
					<sql:query dataSource="${dbsource}" var="result">
					select * from claims where ProductRegistrationID=?;
					<sql:param value="${param.regid}"></sql:param>
					</sql:query>
					
				
					
					<c:if test="${result.rowCount>=3}">
						<p style="color: red;">Maximum claims limit is 3!</p>
					</c:if>

					<c:if test="${result.rowCount<3}">
						<sql:update dataSource="${dbsource}" var="claimReg">
			insert into claims (ProductRegistrationID, DateOfClaim, Description) values (?,?,?);
						
							<sql:param value="${param.regid}" />
							<sql:param value="${param.claimDate}" />
							<sql:param value="${param.desc}" />
						</sql:update>
						<c:if test="${claimReg>=1}">
							<font size="4" color='green'> Congratulations! Your claim
								has been submitted successfully. </font>
						</c:if>
					</c:if>
					
				</c:when>
				<c:otherwise>
					<p style="color: red;">All fields are mandatory!</p>
				</c:otherwise>
			</c:choose>
			</c:if>
		</div>
	</div>
	<%@include file="header.jsp"%>
	
</body>
</html>