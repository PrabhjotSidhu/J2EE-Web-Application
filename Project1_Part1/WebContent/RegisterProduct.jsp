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
<title>Register Product</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="main">
		<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost:3306/project1_part1" user="root"
			password="1234" />
		<sql:query dataSource="${dbsource}" var="searchresult">
            SELECT * from productinfo;
	</sql:query>

		<sql:query dataSource="${dbsource}" var="printdetails">
            SELECT * from productregistration where username = ?;
            <sql:param value="${param.uname}" />
		</sql:query>

		<form method="post">
			<div id="data">
				<input type="hidden" name="pid" value="1">
				<table border="0" cellspacing="2" cellpadding="5">
					<thead>
						<tr>
							<th colspan="2">Register Product</th>
						</tr>
					</thead>

					<tbody>
						<tr>
							<td><label>User Name</label></td>
							<td><input type="text" name="username"
								value="${param.uname}" /></td>
						</tr>
						<tr>
							<td><label>Product Name</label></td>
							<td><select name="pname" id="pname">
									<c:forEach var="row" items="${searchresult.rows}">
										<option value="${row.productname}">${row.productname}</option>
									</c:forEach>
							</select></td>
						</tr>
						<tr>
							<td><label>Serial Number</label></td>
							<td><input type="text" name="sno" /></td>
						</tr>
						<tr>
							<td><label>Purchase Date</label></td>
							<td><input type="date" name="pdate" /></td>
						</tr>
						<tr>
							<td></td>
							<td><div id="buttons">
									<input type="submit" value="Register" /> <input type="reset"
										value="Reset" />
								</div></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>
		<div id="button">
			<a href="indexcustomer.jsp"><input type="submit" value="Go Back" /></a>
		</div>

		<!--  Adding record to table -->

		<c:choose>
			<c:when
				test="${not empty param.pname 
						&& not empty param.sno 
						&& not empty param.pdate 
						&& not empty param.username
						}">
				<sql:transaction dataSource="${dbsource}">
					<sql:update var="empRec">
			insert into productregistration (Username, ProductName, SerialNo, PurchaseDate) values (?,?,?,?);
				<sql:param value="${param.username}" />
						<sql:param value="${param.pname}" />
						<sql:param value="${param.sno}" />
						<sql:param value="${param.pdate}" />
					</sql:update>
					<sql:query var="nextIdTable">
    				SELECT LAST_INSERT_ID() as lastId
  				</sql:query>
				</sql:transaction>
				<c:if test="${empRec>=1}">
					<font size="4" color='green'> Congratulations ! Your product
						has been registered successfully. <br> <br> Your Product
						Registration ID is : ${nextIdTable.rows[0].lastId}. Please keep a
						record of this ID. You will need it in order to register a claim!
					</font>
				</c:if>
			</c:when>
			<c:otherwise>
				<p style="color: red;">All fields are mandatory!</p>
			</c:otherwise>
		</c:choose>
	</div>
	<%@include file="header.jsp"%>
</body>
</html>