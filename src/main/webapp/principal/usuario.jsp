<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                                    
                                    	<span>${msg}</span>
                                    
                                        <div class="row"">
                                            <div class="col-md-10">
                                                <div class="card">
                                                    <div class="card-header">
                                                        <h2>Cadastro de usuário</h2>
                                                    </div>
                                                    <div class="card-block">
                                                        <form class="form-material" action="<%= request.getContextPath() %>/ServletUsuarioController" method="post" id="formUser">
                                                        
                                                        	<input type="hidden" name="acao" id="acao" value="">
                                                        
                                                        	<div class="form-group form-default">
                                                                <input type="hidden" name="id" id="id" class="form-control" readonly="readonly" value="${modelLogin.id}">
<!--                                                                 <span class="form-bar"></span> -->
<!--                                                                 <label class="float-label">Código</label> -->
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="nome" id="nome" class="form-control"  value="${modelLogin.nome}" required="required">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Nome</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="email" name="email" id="email" class="form-control" value="${modelLogin.email}" required="required">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Email</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="text" name="login" id="login" class="form-control" value="${modelLogin.login}" required="required">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Login</label>
                                                            </div>
                                                            <div class="form-group form-default">
                                                                <input type="password" name="senha" id="senha" class="form-control" value="${modelLogin.senha}"  maxlength="6" required="required	">
                                                                <span class="form-bar"></span>
                                                                <label class="float-label">Senha</label>
                                                            </div>
                                                      		
                                                      		<button class="btn btn-success waves-effect waves-light">Salvar</button>
                                                      		<button type="button" onclick="limparForm()" class="btn btn-primary waves-effect waves-light">Novo</button>
                                                      		<button type="button" onclick="excluir()" class="btn btn-danger waves-effect waves-light">Excluir</button>
                                                        </form>
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
    	function limparForm() {
			var elementos = document.getElementById("formUser").elements;
			for (var p = 0; p < elementos.length; p++) {
				elementos[p].value = '';
			}
		}
    	
    	function excluir() {
    		if (confirm('Deseja realmente excluir esse usuário?')) {
    		document.getElementById("formUser").method = 'get';
    		document.getElementById("acao").value = 'excluir';
    		document.getElementById("formUser").submit();				
			}
    		
		}
    </script>
</body>

</html>
