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
                                    
                                    <div class="pcoded-inner-content">
                        <div class="main-body">
                            <div class="page-wrapper">
                                <div class="page-body">
                                    <div class="row">
                                        <div class="col-sm-12">
                                            <div class="card">
                                                <div class="card-header">
                                                    <h5>Aviso</h5>
                                                    <span>Informações sobre o sistema desenvolvido no curso</span>
                                                    <div class="card-header-right">
                                                        <ul class="list-unstyled card-option">
<!--                                                             <li><i class="fa fa-chevron-left"></i></li> -->
                                                            <li><i class="fa fa-window-maximize full-card"></i></li>
<!--                                                             <li><i class="fa fa-minus minimize-card"></i></li> -->
<!--                                                             <li><i class="fa fa-refresh reload-card"></i></li> -->
<!--                                                             <li><i class="fa fa-times close-card"></i></li> -->
                                                        </ul>
                                                    </div>
                                                </div>
                                                <div class="card-block">
                                                    <p>
                                                        Seguindo nos estudos do Ecossistema JAVA , em acompanhamento ao curso de formação em JAVA WEB FULL STACK do JDev Treinamento , foi desenvolvida uma aplicação Web em JSP conectada a um banco de dados postgresql que permite um CRUD de usuários no sistema. O sistema trabalha com validação de login e carrega os dados conforme a sessão do usuário logado , no formulário de cadastro é possível fazer o upload e download da foto do usuário e inserir o tipo de perfil dele conforme a regra de negócio estabelecida . Além disso o sistema gera relatórios de usuários pela data em formato xls e pdf e também um gráfico comparando a renda conforme o perfil do usuário cadastrado.
														<br>
														<br>
														<br>
														Durante o desenvolvimento desse projeto , ficou muito evidente a interação do front-end e back-end e persistência no banco de dados de uma mesma aplicação.
														<br>														
														<br>														
														<br>														
														Tecnologias utilizadas : html , css , bootstrap , javascript , ajax , java, postgres.
														<br>		
														<br>		
														<br>	
														<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3 outer-ellipsis"><i class="ti-github"></i>
															 <a href="https://github.com/jopaulomendes/servlets-com-jsp-e-jdbc" target="_blank">
															 	Código fonte
														 	</a> 
                                                   		</div>
                                                   		<br>
                                                   		<div class="col-sm-12 col-md-6 col-lg-4 col-xl-3 outer-ellipsis"><i class="ti-linkedin"></i>
                                                   			<a href="http://www.linkedin.com/in/joãopaulo-damatamendes" target="_blank">
															 	linkedin
														 	</a> 
                                                    	</div>
                                                    </p>
                                                </div>
                                            </div>
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
</body>

</html>
