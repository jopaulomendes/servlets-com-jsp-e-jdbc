<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<!-- Meta -->
<jsp:include page="head.jsp"></jsp:include>

<body>
	<!-- Pre-loader start -->
	<jsp:include page="theme-loader.jsp"></jsp:include>

	<!-- Pre-loader end -->
	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<!--    barra de navegação -->
			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbar-main-menu.jsp"></jsp:include>

					<div class="pcoded-content">
						<!-- Page-header start -->
						<jsp:include page="page-header.jsp"></jsp:include>

						<!-- Page-header end -->
						<div class="pcoded-inner-content">
							<!-- Main-body start -->
							<div class="main-body">
								<div class="page-wrapper">
									<!-- Page-body start -->
									<div class="page-body">

										<span id="msg" class="card-block success-breadcrumb">${msg}</span>

										<div class="card-header">
											<h2>LIsta de usuário</h2>
										</div>

										<!-- Lista de usuários cadastrados -->
										<div class="col-md-10" style="height: 300px; overflow: scroll;">
											<table class="table table-bordered"
												id="tabelaresultadoslista">
												<thead>
													<tr>
														<th scope="col">Código</th>
														<th scope="col">Nome</th>
														<th scope="col">E-mail</th>
														<th scope="col">Detalhar</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${list}" var="lists">
														<tr>
															<td><c:out value="${lists.id }"></c:out></td>
															<td><c:out value="${lists.nome }"></c:out></td>
															<td><c:out value="${lists.email }"></c:out></td>
															<td>
																<a class="btn btn-info" href="<%=request.getContextPath()%>/ServletUsuarioController?acao=buscarEditar&id=${lists.id }">Detalhar</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>
									</div>
									<!-- Page-body end -->
								</div>
								<div id="styleSelector"></div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<jsp:include page="javascript.jsp"></jsp:include>

	<!-- Modal -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">Pesquisar
						usuário</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Pesquisar..."
							aria-label="pesquisar" id="pesquisar"
							aria-describedby="basic-addon2">
						<button type="button" class="btn btn-primary"
							onclick="pesquisarUsuario();">Pesquisar</button>
					</div>
				</div>

				<div style="height: 300px; overflow: scroll;">
					<table class="table table-bordered" id="tabelaresultados">
						<thead>
							<tr>
								<th scope="col">Código</th>
								<th scope="col">Nome</th>
								<th scope="col">Detalhar</th>
							</tr>
						</thead>
						<tbody>
	
						</tbody>
					</table>
				</div>
				<span id="totalResultados"></span>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		function pesquisarUsuario() {

			var pesquisar = document.getElementById('pesquisar').value;

			if (pesquisar != null && pesquisar != '' && pesquisar.trim() != '') {

				var urlAction = document.getElementById('formUser').action;

				$.ajax({
					method : "get",
					url : urlAction,
					data : "pesquisar=" + pesquisar + '&acao=pesquisar',
					success : function(response) {		
						
						var json = JSON.parse(response);
						
						$('#tabelaresultados > tbody > tr').remove();
						
						
						for (var i = 0; i < json.length; i++) {
															$('#tabelaresultados > tbody')
																	.append(
																			'<tr> <td>'
																					+ json[i].id
																					+ '</td> <td>'
																					+ json[i].nome
																					+ '</td> <td><button onclick=visualizarEditar('+json[i].id+') type="button" class="btn btn-info">Detalhar</button></td> </tr>');
														}

										document.getElementById('totalResultados').textContent = 'Total: ' + json.length;

									}
				
								}).fail(
								function(xhr, status, errorThrown) {
									alert('Erro ao pesquisar usuário: '
											+ xhr.responseText);
								});
			}
		}

		function limparForm() {
			var elementos = document.getElementById("formUser").elements;
			for (var p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}

		function excluirAjax() {
			if (confirm('Deseja realmente excluir esse usuário?')) {

				var urlAction = document.getElementById('formUser').action;
				var idUser = document.getElementById('id').value;

				$.ajax({
					method : "get",
					url : urlAction,
					data : "id=" + idUser + '&acao=excluirajax',
					success : function(response) {
						limparForm();
						document.getElementById('msg').textContent = response;
					}
				}).fail(function(xhr, status, errorThrown) {
					alert('Erro ao deletar usuário: ' + xhr.responseText);
				});
			}
		}

		function excluir() {
			if (confirm('Deseja realmente excluir esse usuário?')) {
				document.getElementById("formUser").method = 'get';
				document.getElementById("acao").value = 'excluir';
				document.getElementById("formUser").submit();
			}

		}
		
		function visualizarEditar(id) {
			var urlAction = document.getElementById('formUser').action;
			window.location.href = urlAction + '?acao=buscarEditar&id='+id;
		}
	</script>
</body>

</html>
