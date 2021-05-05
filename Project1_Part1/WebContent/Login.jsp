<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<%@ page errorPage="error.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>
	<div id="main">
		<form method="post" action="LoginAuthenticate.jsp">
			<div id="data">
				<table border="0" cellspacing="2" cellpadding="5">
					<thead>
						<tr>
							<th colspan="2">Login</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td><label>User Name : </label></td>
							<td><input type="text" name="uname" /></td>
						</tr>
						<tr>
							<td><label>Password : </label></td>
							<td><input type="password" name="pw" /></td>
						</tr>
						<tr>
							<td></td>
							<td><div id="buttons">
									<input type="submit" value="Login" />
								</div></td>
						</tr>
						<c:if test="${not empty param.errMsg}">
							<tr>
								<td colspan="2"><font color="red"><c:out
											value="${param.errMsg}" /></font></td>
							</tr>
						</c:if>
					</tbody>
				</table>
			</div>
		</form>
		<table>
			<tr>
				<td><p>New User? Click the button to Register!</p>
					<div id="buttons">
						<a href="Signup.jsp"><input type="submit" value="Register" /></a>
					</div></td>
			</tr>
			<tr>
				<td><p>Forgot Password? Click the button to reset your
						password!</p>
					<div id="buttons">
						<a href="ForgotPassword.jsp"><input type="submit"
							value="Forgot Password" /></a>
					</div></td>
			</tr>
		</table>
	</div>
</body>
</html>