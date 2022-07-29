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
	left: 40%;
	right: 40%;
}

	h1 {
		text-align: center;
	}
	
	h4 {
		text-align: center;
		position: absolute;
		left: 40%;
		right: 40%;
	    color: #842029;
	    background-color: #f8d7da;
	    border-color: #f5c2c7;
}
	}
</style>

</head>
<body> <br>

	<h1>Login</h1>
	
	<h4>${msg}</h4>
	
	<form 
		class="row g-3 needs-validation" 
		action="<%=request.getContextPath() %>/ServletLogin" 
		method="POST" 
		novalidate
	>
		<input 
			type="hidden" 
			value="<%= request.getParameter("url") %>" 
			name="url"
		>

		<div class="invalid-feedback">Usuário!</div>
		<div class="col-12">
			<input 
				class="form-control" 
				name="login" 
				type="text" 
				placeholder="Usuário" 
				required="required" 
				autofocus="autofocus"
			> 
		</div> 
		
		<div class="invalid-feedback">Senha obrigatória!</div>
		<div class="mb-3">
			<input 
				class="form-control" 
				name="senha" 
				type="password" 
				placeholder="Senha" 
				required="required"
			> 
		</div>
		
		<div class="col-12">
			<button type="submit" class="btn btn-primary">Entrar</button>
		</div>
	</form>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>

	<script type="text/javascript">
		// Example starter JavaScript for disabling form submissions if there are invalid fields
		(function() {
			'use strict'

			// Fetch all the forms we want to apply custom Bootstrap validation styles to
			var forms = document.querySelectorAll('.needs-validation')

			// Loop over them and prevent submission
			Array.prototype.slice.call(forms).forEach(function(form) {
				form.addEventListener('submit', function(event) {
					if (!form.checkValidity()) {
						event.preventDefault()
						event.stopPropagation()
					}

					form.classList.add('was-validated')
				}, false)
			})
		})()
	</script>
</body>
</html>