<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<title>Servlets com JSP e JDBC com SQL e Java</title>

<style type="text/css">
	form {
	position: absolute;
	top: 20%;
	left: 45%;
	right: 45%;
}

	h1 {
		text-align: center;
	}
	
	h4 {
		text-align: center;
		color: red;
	}
</style>

</head>
<body> <br>

	<h1>Login</h1>
	
	<h4>${msg}</h4>
	
	<form class="row g-3" action="ServletLogin" method="POST">
		<input type="hidden" value="<%= request.getParameter("url") %>" name="url">
	
		<div class="mb-3">
			<input name="login" type="text" placeholder="Usuário"> 
		</div>
		
		<div class="mb-3">
			<input name="senha" type="password" placeholder="Senha"> 
		</div>
		
		<div class="col-12">
			<button type="submit" class="btn btn-primary">Entrar</button>
		</div>
	</form>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>