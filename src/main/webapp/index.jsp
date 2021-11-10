<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Servlets com JSP e JDBC com SQL e Java</title>
</head>
<body style="text-align: center;"> <br>

	<h1>Login</h1>
	
	<h4>${msg}</h4>
	
	<form action="ServletLogin" method="POST">
		<input type="hidden" value="<%= request.getParameter("url") %>" name="url">
	
		<label>Login:</label><br>
		<input name="login" type="text"> <br><br>
		
		<label>Senha:</label><br>
		<input name="senha" type="password"> <br><br>
		<input type="submit" value="Enviar">
	</form>

</body>
</html>