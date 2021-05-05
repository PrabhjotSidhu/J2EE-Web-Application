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
	<sql:setDataSource var="dbsource" driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/project1_part1" user="root"
		password="1234" />
	<sql:update dataSource="${dbsource}" var="count">
            DELETE FROM productinfo
            WHERE productname='${param.id}'
        </sql:update>
	<c:if test="${count>=1}">
		<font size="5" color='green'> Congratulations ! Data deleted
			successfully.</font>
		<a href="ProductDisplay.jsp">Go Back</a>
	</c:if>
	<%@include file="header.jsp" %>
</body>
</html>