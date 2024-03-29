<%@page import="model.ModelLogin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<!-- Meta -->
<jsp:include page="head.jsp"></jsp:include>

<body>
	<jsp:include page="theme-loader.jsp"></jsp:include>

	<div id="pcoded" class="pcoded">
		<div class="pcoded-overlay-box"></div>
		<div class="pcoded-container navbar-wrapper">

			<!--    barra de navegação -->
			<jsp:include page="navbar.jsp"></jsp:include>

			<div class="pcoded-main-container">
				<div class="pcoded-wrapper">

					<jsp:include page="navbar-main-menu.jsp"></jsp:include>

					<div class="pcoded-content">
						<jsp:include page="page-header.jsp"></jsp:include>

						<div class="pcoded-inner-content">
							<div class="main-body">
								<div class="page-wrapper">
									<div class="page-body">

										<span id="msg" class="card-block success-breadcrumb">${msg}</span>

										<div class="row">
											<div class="col-md-12">
												<div class="card">
													
													<div class="card-header">
														<h2>Cadastro de usuário</h2>
													</div>
													
													<div class="card-block">
														<form 
															class="form-material"															
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="post" 
															id="formUser"
															enctype="multipart/form-data"
														>

															<input type="hidden" name="acao" id="acao" value="">

															<div class="form-group form-default">
																<input 
																	type="hidden" 
																	name="id" 
																	id="id"
																	class="form-control" 
																	readonly="readonly"
																	value="${modelLogin.id}"
																>
															</div>

															<div class="form-group form-default input-group mb-4">
																<div class="input-group-prepend">
																	<c:if test="${modelLogin.foto != '' && modelLogin.foto != null}">
																		<a 
																			href="<%=request.getContextPath()%>
																			/ServletUsuarioController?acao=downloadFoto&id=${modelLogin.id}"
																			title="Dawnload da foto"
																		>															
																			<img 
																				id="fotobase64"
																				alt="Foto do usuário" 
																				src="${modelLogin.foto}" 
																				width="200px"
																			>
																		</a>
																	</c:if>
																	<c:if test="${modelLogin.foto == '' || modelLogin.foto == null}">
																		<img 
																			id="fotobase64"
																			alt="Foto do usuário" 
																			src="assets/images/Usuario.png" 
																			width="100px"
																		>
																	</c:if>
																</div>
																<input 
																	type="file" 
																	id="filefoto"
																	name="filefoto"
																	accept="image/*"
																	onchange="visualizarImg('fotobase64', 'filefoto');"
																	class="form-control-file" 
																	style="margin-top: 15px; margin-left: 10px;"
																>
															</div>
															
															<fieldset>
																<legend>Dados Pessoais</legend>																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="nome" 
																		id="nome"
																		class="form-control" 
																		value="${modelLogin.nome}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Nome</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="cpf" 
																		id="cpf"
																		class="form-control" 
																		value="${modelLogin.cpf}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">CPF</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="rg" 
																		id="rg"
																		class="form-control" 
																		value="${modelLogin.rg}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">RG</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="nascimento" 
																		id="nascimento"
																		class="form-control" 
																		value="${modelLogin.nascimento}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Nascimento</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="salario" 
																		id="salario"
																		class="form-control" 
																		value="${modelLogin.salario}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Salário</label>
																</div>
																
																<p>Sexo</p>
																<div class="form-group form-default" style="margin-left: 30px;">
																	<div class="form-check">
																		<input 
																			class="form-check-input" 
																			type="radio" 
																			name="sexo" 
																			checked
																			value="MASCULINO"
																			<%
																			ModelLogin modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																			if (modelLogin != null && modelLogin.getSexo().equals("MASCULINO")) {
																				out.print(" ");
																				out.print("checked=\"checked\"");
																				out.print(" ");
																			}
																			%>
																		>
																		<label class="form-check-label" for="sexo">Masculino</label>
																	</div>
																	<div class="form-check">
																		<input 
																			class="form-check-input" 
																			type="radio" 
																			name="sexo" 
																			value="FEMININO"
																			<%
																			modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																			if (modelLogin != null && modelLogin.getSexo().equals("FEMININO")) {
																				out.print(" ");
																				out.print("checked=\"checked\"");
																				out.print(" ");
																			}
																			%>
																		>
																		<label class="form-check-label" for="sexo">Feminino</label>
																	</div>
																</div>
															</fieldset>
															
															<fieldset>
																<legend>Online</legend>																
																<div class="form-group form-default">
																	<input 
																		type="email" 
																		name="email" 
																		id="email"
																		class="form-control" 
																		value="${modelLogin.email}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Email</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="login" 
																		id="login"
																		class="form-control" 
																		value="${modelLogin.login}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Login</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="password" 
																		name="senha" 
																		id="senha"
																		class="form-control" 
																		value="${modelLogin.senha}"
																		maxlength="10" 
																		required="required"
																	> 
																	<span class="form-bar"></span> 
																	<label class="float-label">Senha</label>
																</div>
															</fieldset>
															
															<fieldset>
																<legend>Endereço</legend>
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="cep" 
																		id="cep"
																		class="form-control" 
																		value="${modelLogin.cep}"
																		required="required"
																		onblur="pesquisaCep();"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">CEP</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="logradouro" 
																		id="logradouro"
																		class="form-control" 
																		value="${modelLogin.logradouro}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Rua</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="numero" 
																		id="numero"
																		class="form-control" 
																		value="${modelLogin.numero}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Número</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="complemento" 
																		id="complemento"
																		class="form-control" 
																		value="${modelLogin.complemento}"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Complemento</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="bairro" 
																		id="bairro"
																		class="form-control" 
																		value="${modelLogin.bairro}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Bairro</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="localidade" 
																		id="localidade"
																		class="form-control" 
																		value="${modelLogin.localidade}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Cidade</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="uf" 
																		id="uf"
																		class="form-control" 
																		value="${modelLogin.uf}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Estado</label>
																</div>
															</fieldset>
															
															<fieldset>
																<legend>Telefones</legend>
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="foneUm" 
																		id="foneUm"
																		class="form-control" 
																		value="${modelLogin.foneUm}"
																		required="required"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Telefone1</label>
																</div>
																
																<div class="form-group form-default">
																	<input 
																		type="text" 
																		name="foneDois" 
																		id="foneDois"
																		class="form-control" 
																		value="${modelLogin.foneDois}"
																	> 
																	<span class="form-bar"></span>
																	<label class="float-label">Telefone2</label>
																</div>
															</fieldset>
															<br>

															<div class="form-group form-default">
																<select 
																	class="form-control" 
																	aria-label="Default select example" 
																	name="perfil"
																>
																	<option selected disabled="disabled">Perfil</option>
																	<option 
																		value="ADMIN"
																		<% 
																		modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																		if (modelLogin != null && modelLogin.getPerfil().equals("ADMIN")) {
																			out.print(" ");
																			out.print("selected=\"selected\"");
																			out.print(" ");
																		} 
																		%>
																	>
																		Administrador
																	</option>
																	<option 
																		value="AUX"																		
																		<% 
																		modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																		if (modelLogin != null && modelLogin.getPerfil().equals("AUX")) {
																			out.print(" ");
																			out.print("selected=\"selected\"");
																			out.print(" ");
																		} 
																		%>
																	>
																		Auxiliar
																	</option>
																	<option 
																		value="CAIXA"
																		<% 
																		modelLogin = (ModelLogin) request.getAttribute("modelLogin");
																		if (modelLogin != null && modelLogin.getPerfil().equals("CAIXA")) {
																			out.print(" ");
																			out.print("selected=\"selected\"");
																			out.print(" ");
																		} 
																		%>
																	>
																		Caixa
																	</option>
																</select>
																<span class="form-bar"></span>
																<label class="float-label">Perfil</label>
															</div>
															
															

															<button class="btn btn-success waves-effect waves-light">Salvar</button>
															<button 
																type="button" 
																onclick="limparForm()"
																class="btn btn-primary waves-effect waves-light">Novo
															</button>
															<button 
																type="button" 
																onclick="excluirAjax()"
																class="btn btn-danger waves-effect waves-light">Excluir
															</button>
															<!-- Button trigger modal -->
															<button 
																type="button" 
																class="btn btn-info"
																data-toggle="modal" 
																data-target="#exampleModalCenter">Pesquisar
															</button>
														</form>
													</div>
												</div>
											</div>											
										</div>
										
										<!-- Lista de usuários cadastrados -->
										<div 
											class="col-md-12" 
											style="height: 300px; 
											overflow: scroll;"
										>
											<table 
												class="table table-bordered"
												id="tabelaresultadosview"
											>
												<thead>
													<tr>
														<th scope="col">Código</th>
														<th scope="col">Nome</th>
														<th scope="col">E-mail</th>
														<th scope="col">Detalhar</th>
													</tr>
												</thead>
												<tbody>
													<c:forEach items="${logins}" var="lists">
														<tr>
															<td><c:out value="${lists.id }"></c:out></td>
															<td><c:out value="${lists.nome }"></c:out></td>
															<td><c:out value="${lists.email }"></c:out></td>
															<td>
																<a class="btn btn-info" 
																		shref="<%=request.getContextPath()%>/ServletUsuarioController?acao=buscarEditar&id=${lists.id }">
																	Detalhar
																</a>
															</td>
														</tr>
													</c:forEach>
												</tbody>
											</table>
										</div>

										<nav aria-label="Page navigation example">
											<ul class="pagination">
												<%
													int totalPagina = (int) request.getAttribute("totalPagina");
													
													for(int p = 0; p < totalPagina; p++){
														String url = request.getContextPath() + "/ServletUsuarioController?acao=paginar&pagina=" + (p * 5);
														out.print("<li class=\"page-item\"><a class=\"page-link\" href=\""+ url +"\">"+(p + 1)+"</a></li>");
													}
												%>
											</ul>
										</nav>
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
	<div 
		class="modal fade" 
		id="exampleModalCenter" 
		tabindex="-1"
		role="dialog" 
		aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true"
	>
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLongTitle">
						Pesquisar usuário
					</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>

				<div class="modal-body">
					<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="Pesquisar..."
							aria-label="pesquisar" id="nomeBusca"
							aria-describedby="basic-addon2">
						<button 
							type="button" 
							class="btn btn-primary"
							onclick="pesquisarUsuario();"
						>
							Pesquisar
						</button>
					</div>
				</div>

				<div style="height: 300px; overflow: scroll;">
					<table class="table table-bordered" id="tabelaresultadoslista">
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
				
				<nav aria-label="Page navigation example">
					<ul class="pagination" id="paginacaoAjax">
					</ul>
				</nav>
				
				<span id="totalResultados"></span>

				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Fechar</button>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
	
		function pesquisaCep() {
			
			var cep = $("#cep").val();
			
			//Verifica se campo cep possui valor informado.
            if (cep != "") {
            	
            	//Expressão regular para validar o CEP.
                var validacep = /^[0-9]{8}$/;
                
             	 //Valida o formato do CEP.
                if(validacep.test(cep)) {
                	
                	//Preenche os campos com "..." enquanto consulta webservice.
                    $("#cep").val("...");
		            $("#rua").val("...");
		            $("#complemento").val("...");
		            $("#bairro").val("..");
		            $("#cidade").val("...");
		            $("#uf").val("...");
			
					//Consulta o webservice viacep.com.br/
		            $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
		            	
		            	if (!("erro" in dados)) {
		                    //Atualiza os campos com os valores da consulta.
		                    $("#cep").val(dados.cep);
		                    $("#logradouro").val(dados.logradouro);
		                    $("#complemento").val(dados.complemento);
		                    $("#bairro").val(dados.bairro);
		                    $("#localidade").val(dados.localidade);
		                    $("#uf").val(dados.uf);
		                } //end if.
		                else {
		                    //CEP pesquisado não foi encontrado.
		                    limpa_formulário_cep();
		                    alert("CEP não encontrado.");
		                }
		            });
		        }
                else {
                    //cep é inválido.
                    limpa_formulário_cep();
                    alert("Formato de CEP inválido.");
                }
            }
            else {
                //cep sem valor, limpa formulário.
                limpa_formulário_cep();
            }
		}
		
		function limpa_formulário_cep() {
            // Limpa valores do formulário de cep.
			$("#cep").val("");
            $("#rua").val("");
            $("#complemento").val("");
            $("#bairro").val("");
            $("#cidade").val("");
            $("#uf").val("");
        }
	
		function visualizarImg(fotobase64, filefoto) {
			var preview = document.getElementById(fotobase64);
			var fileUser = document.getElementById(filefoto).files[0];
			var reader = new FileReader();
			
			reader.onloadend = function () {
				preview.src = reader.result; /*Carrega a foto na tela*/
			}
			
			if (fileUser) {
				reader.readAsDataURL(fileUser);
			}
			
			preview.src = '';
		}
		
		function buscarUsuarioPagAjax(url) {
			var urlAction = document.getElementById('formUser').action;
		    var nomeBusca = document.getElementById('nomeBusca').value;
		    
			$.ajax({
				method : "get",
				url : urlAction,
				data : url,
				success : function(response, textStatus, xhr) {		
					
					var json = JSON.parse(response);
					
					$('#tabelaresultadoslista > tbody > tr').remove();
					$('#paginacaoAjax > li').remove();
					
					
					for (var i = 0; i < json.length; i++) {
						$('#tabelaresultadoslista > tbody')
							.append(
								'<tr> <td>'
									+ json[i].id
									+ '</td> <td>'
									+ json[i].nome
									+ '</td> <td><button onclick="visualizarEditar('+json[i].id+')" type="button" class="btn btn-info">Detalhar</button></td> </tr>');
					}

					document.getElementById('totalResultados').textContent = 'Total: ' + json.length;
					
					var totalPagina = xhr.getResponseHeader("totalPagina");
					
					for (var p = 0; p < totalPagina; p++) {
						var url = 'nomeBusca=' + nomeBusca + '&acao=buscarUserAjaxPage&pagina='+(p*5);
						$("#paginacaoAjax").append('<li class="page-item"><a class="page-link" href="#" onclick="buscarUsuarioPagAjax(\''+url+'\')">'+(p+1)+'</a></li>');
					}
					
				}
			
			}).fail(
			function(xhr, status, errorThrown) {
				alert('Erro ao pesquisar usuário: '	+ xhr.responseText);
			});
		}
	
		function pesquisarUsuario() {

			var nomeBusca = document.getElementById('nomeBusca').value;

			if (nomeBusca != null && nomeBusca != '' && nomeBusca.trim() != '') {

				var urlAction = document.getElementById('formUser').action;

				$.ajax({
					method : "get",
					url : urlAction,
					data : "nomeBusca=" + nomeBusca + '&acao=buscarUserAjax',
					success : function(response, textStatus, xhr) {		
						
						var json = JSON.parse(response);
						
						$('#tabelaresultadoslista > tbody > tr').remove();
						$('#paginacaoAjax > li').remove();						
						
						for (var i = 0; i < json.length; i++) {
							$('#tabelaresultadoslista > tbody')
								.append(
									'<tr> <td>'
										+ json[i].id
										+ '</td> <td>'
										+ json[i].nome
										+ '</td> <td><button onclick="visualizarEditar('+json[i].id+')" type="button" class="btn btn-info">Detalhar</button></td> </tr>');
						}

						document.getElementById('totalResultados').textContent = 'Total: ' + json.length;
						
						var totalPagina = xhr.getResponseHeader("totalPagina");
						
						for (var p = 0; p < totalPagina; p++) {
							var url = 'nomeBusca=' + nomeBusca + '&acao=buscarUserAjaxPage&pagina='+(p*5);
							$("#paginacaoAjax").append('<li class="page-item"><a class="page-link" href="#" onclick="buscarUsuarioPagAjax(\''+url+'\')">'+(p+1)+'</a></li>');
						}
						
					}
				
				}).fail(
				function(xhr, status, errorThrown) {
					alert('Erro ao pesquisar usuário: '	+ xhr.responseText);
				});
			}
		}

		function limparForm() {
			var elementos = document.getElementById("formUser").elements;
			for (var p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
			
			var campoFoto = document.getElementById('filefoto');
			campoFoto.value = '';
			console.log(campoFoto);
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
		
       // Não permite digitos
		$("#cpf").keypress(function (event) {
			return /\d/.test(String.fromCharCode(event.keyCode));
		});		
		$("#cep").keypress(function (event) {
			return /\d/.test(String.fromCharCode(event.keyCode));
		});		
		$("#numero").keypress(function (event) {
			return /\d/.test(String.fromCharCode(event.keyCode));
		});		
		$("#foneUm").keypress(function (event) {
			return /\d/.test(String.fromCharCode(event.keyCode));
		});		
		$("#foneDois").keypress(function (event) {
			return /\d/.test(String.fromCharCode(event.keyCode));
		});
		
		$( function() {			  
		  $("#nascimento").datepicker({
			    dateFormat: 'dd/mm/yy',
			    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
			    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
			    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
			    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
			    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
			    nextText: 'Próximo',
			    prevText: 'Anterior'
				});
			});
		
		$("#salario").maskMoney({showSymbol:true, symbol:"R$ ", decimal:",", thousands:"."});
		
		const formatter = new Intl.NumberFormat('pt-BR', {
			currency : 'BRL', 
			minimumFractionDigits : 2
		});
		
		$("#salario").val(formatter.format($("#salario").val()));
		
		$(document).ready(function(){
		    $('#foneUm').mask('(00) 0000-0000');
		    $('#foneDois').mask('(00) 0000-0000');
		    $('#cpf').mask('000.000.000-00', {reverse: true});
		});

		
// 		$("#salario").focus();
		
	</script>
</body>

</html>
