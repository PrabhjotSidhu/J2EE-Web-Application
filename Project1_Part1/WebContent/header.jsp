<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<c:if test="${empty sessionScope['loginUser']}">
		<c:redirect url="Login.jsp" />
	</c:if>
	<div id="button">
		<br> <a href="Logout.jsp"><input type="submit"
			value="Logout <c:out value="${sessionScope['loginUser']}" />" /> </a>
	</div>
</body>
</html>