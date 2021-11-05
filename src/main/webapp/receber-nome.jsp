<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Parametros</title>
</head>
<body>
<%
	String nome = request.getParameter("nome");
	out.println("Nome: " + nome);
	
	String idade = request.getParameter("idade");
	out.println("Idade: " + idade);
%>
</body>
</html>