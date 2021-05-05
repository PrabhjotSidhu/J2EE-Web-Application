<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page errorPage="error.jsp" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<c:if test="${ empty param.uname or empty param.pw}">
		<c:redirect url="Login.jsp">
			<c:param name="errMsg" value="Please Enter UserName and Password" />
		</c:redirect>

	</c:if>

	<c:if test="${not empty param.uname and not empty param.pw}">
		<s:setDataSource var="ds" driver="com.mysql.jdbc.Driver"
			url="jdbc:mysql://localhost/project1_part1" user="root"
			password="1234" />

		<s:query dataSource="${ds}" var="selectQ">
        select count(*) as kount from users
        where username=? and BINARY password=?
        	<s:param value="${param.uname}" />
			<s:param value="${param.pw}" />
		</s:query>

		<c:forEach items="${selectQ.rows}" var="r">
			<c:choose>
				<c:when test="${r.kount gt 0}">
					<c:set scope="session" var="loginUser" value="${param.uname}" />
					<c:choose>
						<c:when
							test="${fn:contains(param.uname, 'admin') && fn:contains(param.pw, 'admin')}">
							<c:redirect url="indexadmin.jsp" />
						</c:when>
						<c:otherwise>
							<c:redirect url="indexcustomer.jsp" />
						</c:otherwise>
					</c:choose>
				</c:when>
				<c:otherwise>
					<c:redirect url="Login.jsp">
						<c:param name="errMsg" value="Username/password does not match" />
					</c:redirect>
				</c:otherwise>
			</c:choose>
		</c:forEach>
	</c:if>
</body>
</html>