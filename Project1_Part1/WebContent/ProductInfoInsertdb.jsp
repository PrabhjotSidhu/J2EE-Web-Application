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
<title>Insert title here</title>
</head>
<body>
	<c:if
		test="${ empty param.pname or empty param.pprice or empty param.pbrand or empty param.pcolor}">
		<c:redirect url="ProductDisplay.jsp">
			<c:param name="errMsg"
				value="Please Enter Product Name, Product Price, Product Brand and Product Colour" />
			<br>
			<br>
		</c:redirect>

	</c:if>
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/project1_part1" user="root"
		password="1234" />
	<sql:update dataSource="${dbsource}" var="result">
            INSERT INTO productinfo VALUES (?,?,?,?);
            <sql:param value="${param.pname}" />
		<sql:param value="${param.pprice}" />
		<sql:param value="${param.pcolor}" />
		<sql:param value="${param.pbrand}" />
	</sql:update>
	<c:if test="${result>=1}">
		<font size="5" color='green'> Congratulations ! Data inserted
			successfully.</font>
		<div id="button">
			<a href="indexadmin.jsp"><input type="submit" value="Go Home" /></a>
		</div>

		<c:redirect url="ProductDisplay.jsp">
			<c:param name="susMsg"
				value="Congratulations ! Data inserted
            successfully." />
		</c:redirect>
	</c:if>
	<%@include file="header.jsp" %>
</body>
</html>