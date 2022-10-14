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
                                        
                                        <!-- Início do relatório -->
                                        <div class="row">
											<div class="col-md-12">
												<div class="card">
													
													<div class="card-header">
														<h2>Relatório de Usuários</h2>
													</div>
													
													<div class="card-block">
														<form 
															class="form-material"															
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="get" 
															id="formUser"
														>
															<input type="hidden" name="acao" value="imprimirRelatorioUsuario">
															<div class="row">
																<div class="col">																
																	<label for="exampleInputEmail1">
																		Data Inicial
																	</label> 
																	<input
																		type="text" 
																		class="form-control"
																		aria-describedby="emailHelp"
																		id="dataInicial" 
																		name="dataInicial" 
																		value="${dataInicial}"
																	> 
																</div>
																<div class="col">																	
																	<label for="exampleInputEmail1">
																		Data Final
																	</label> 
																	<input
																		type="text" 
																		class="form-control"
																		aria-describedby="emailHelp"
																		id="dataFinal" 
																		name="dataFinal"
																		value="${dataFinal}"
																	> 
																</div>
															</div>
															<br>
															<button type="submit" class="btn btn-primary">Imprimir</button>
															<br>
															<br>
														</form>
														
														<!-- Lista usuário -->
														<table 
															class="table table-bordered"
															id="tabelaresultadosview"
														>
														<thead>
															<tr>
																<th scope="col">Código</th>
																<th scope="col">Nome</th>
																<th scope="col">E-mail</th>
															</tr>
														</thead>
														<tbody>
															<c:forEach items="${listarUsuariosRelatorio}" var="lists">
																<tr>
																	<td><c:out value="${lists.id }"></c:out></td>
																	<td><c:out value="${lists.nome }"></c:out></td>
																	<td><c:out value="${lists.email }"></c:out></td>
																</tr>
															</c:forEach>
														</tbody>
													</table>
													</div>
												</div>
											</div>											
										</div>
                                        
                                    </div>
                                    <!-- Page-body end -->
                                </div>
                                <div id="styleSelector"> </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <jsp:include page="javascript.jsp"></jsp:include>
    
    <script type="text/javascript">
    
    $( function() {			  
	  $("#dataInicial").datepicker({
		    dateFormat: 'dd/mm/yy',
		    dayNames: ['Domingo','Segunda','Terça','Quarta','Quinta','Sexta','Sábado'],
		    dayNamesMin: ['D','S','T','Q','Q','S','S','D'],
		    dayNamesShort: ['Dom','Seg','Ter','Qua','Qui','Sex','Sáb','Dom'],
		    monthNames: ['Janeiro','Fevereiro','Março','Abril','Maio','Junho','Julho','Agosto','Setembro','Outubro','Novembro','Dezembro'],
		    monthNamesShort: ['Jan','Fev','Mar','Abr','Mai','Jun','Jul','Ago','Set','Out','Nov','Dez'],
		    nextText: 'Próximo',
		    prevText: 'Anterior'
		});
	  $("#dataFinal").datepicker({
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
    
    </script>
</body>

</html>
