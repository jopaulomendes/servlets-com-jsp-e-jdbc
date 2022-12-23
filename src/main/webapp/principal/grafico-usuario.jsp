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
														<h2>Gráfico de Salário dos Usuários</h2>
													</div>
													
													<div class="card-block">
														<form 
															class="form-material"															
															action="<%=request.getContextPath()%>/ServletUsuarioController"
															method="get" 
															id="formUsuario"
														>
															<input 
																id="acaoRelatorioImprimir" 
																type="hidden" 
																name="acao" 
																value="imprimirRelatorioUsuario"
															>
															<div class="form-row align-items-center">
																<div class="col-sm-3 my-1">																
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
																<div class="col-sm-3 my-1">																	
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
																<div class="col-auto my-1">
																	<button 
																		type="button" 
																		onclick="gerarGrafico();"
																		class="btn btn-primary">
																		Gerar Gráfico
																	</button>
																</div>
															</div>
															<br>
														</form>															
														<div>
													  		<canvas id="myChart"></canvas>
														</div>															
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
    
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    
    <script type="text/javascript">
    
	    myChart = new Chart(
			    document.getElementById('myChart')		    
			);
	    
	    function gerarGrafico() {    	
	    	
		     var urlAction = document.getElementById('formUsuario').action;
		     var dataInicial = document.getElementById('dataInicial').value;
		     var dataFinal = document.getElementById('dataFinal').value;
		     
			 $.ajax({		    
				 method: "get",
			     url : urlAction,
			     data : "dataInicial=" +dataInicial+ '&dataFinal=' +dataFinal+ '&acao=graficoSalario',		     
			     success: function (response) {
			    	 
		   			var json = JSON.parse(response); // pega uma string json e passar o valor para JS
					    
				    myChart.destroy();
					
				    myChart = new Chart(
					    document.getElementById('myChart'),
					    {
						  type: 'line',
						  data: {
						      labels: json.perfils,
						      datasets: [{
						        label: 'Gráfico de média salarial por tipo',
						        backgroundColor: 'rgb(255, 99, 132)',
						        borderColor: 'rgb(255, 99, 132)',
						        data: json.salarios,
						      }]
						    },
						  options: {}
						}
					);
				  
		     	}		     
			 }).fail(function(xhr, status, errorThrown){
			    alert('Erro ao buscar dados para o grafico ' + xhr.responseText);
			 });
	    }
	    
	    
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
