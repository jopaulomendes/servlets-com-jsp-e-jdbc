<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

	<!DOCTYPE html>
<html lang="en">

<head>
    <title>Mega Able bootstrap admin template by codedthemes </title>
      <meta charset="utf-8">
      <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimal-ui">
      <meta http-equiv="X-UA-Compatible" content="IE=edge" />
      <meta name="description" content="Mega Able Bootstrap admin template made using Bootstrap 4 and it has huge amount of ready made feature, UI components, pages which completely fulfills any dashboard needs." />
      <meta name="keywords" content="bootstrap, bootstrap admin template, admin theme, admin dashboard, dashboard template, admin template, responsive" />
      <meta name="author" content="codedthemes" />
      <!-- Favicon icon -->

      <link rel="icon" href="assets/images/favicon.ico" type="image/x-icon">
      <!-- Google font-->     
      <link href="https://fonts.googleapis.com/css?family=Roboto:400,500" rel="stylesheet">
      <!-- Required Fremwork -->
      <link rel="stylesheet" type="text/css" href="assets/css/bootstrap/css/bootstrap.min.css">
      <!-- waves.css -->
      <link rel="stylesheet" href="assets/pages/waves/css/waves.min.css" type="text/css" media="all">
      <!-- themify-icons line icon -->
      <link rel="stylesheet" type="text/css" href="assets/icon/themify-icons/themify-icons.css">
      <!-- ico font -->
      <link rel="stylesheet" type="text/css" href="assets/icon/icofont/css/icofont.css">
      <!-- Font Awesome -->
      <link rel="stylesheet" type="text/css" href="assets/icon/font-awesome/css/font-awesome.min.css">
      <!-- Style.css -->
      <link rel="stylesheet" type="text/css" href="assets/css/style.css">
  </head>

  <body themebg-pattern="theme1">
	  <!-- Pre-loader start -->
	  <div class="theme-loader">
	      <div class="loader-track">
	          <div class="preloader-wrapper">
	              <div class="spinner-layer spinner-blue">
	                  <div class="circle-clipper left">
	                      <div class="circle"></div>
	                  </div>
	                  <div class="gap-patch">
	                      <div class="circle"></div>
	                  </div>
	                  <div class="circle-clipper right">
	                      <div class="circle"></div>
	                  </div>
	              </div>
	              <div class="spinner-layer spinner-red">
	                  <div class="circle-clipper left">
	                      <div class="circle"></div>
	                  </div>
	                  <div class="gap-patch">
	                      <div class="circle"></div>
	                  </div>
	                  <div class="circle-clipper right">
	                      <div class="circle"></div>
	                  </div>
	              </div>
	            
	              <div class="spinner-layer spinner-yellow">
	                  <div class="circle-clipper left">
	                      <div class="circle"></div>
	                  </div>
	                  <div class="gap-patch">
	                      <div class="circle"></div>
	                  </div>
	                  <div class="circle-clipper right">
	                      <div class="circle"></div>
	                  </div>
	              </div>
	            
	              <div class="spinner-layer spinner-green">
	                  <div class="circle-clipper left">
	                      <div class="circle"></div>
	                  </div>
	                  <div class="gap-patch">
	                      <div class="circle"></div>
	                  </div>
	                  <div class="circle-clipper right">
	                      <div class="circle"></div>
	                  </div>
	              </div>
	          </div>
	      </div>
	  </div>
	  <!-- Pre-loader end -->
	
	    <section class="login-block">
	        <!-- Container-fluid starts -->
	        <div class="container">
	            <div class="row">
	                <div class="col-sm-12">
	                    <!-- Authentication card start -->
                        <form 
                        	class="md-float-material form-material"
							action="<%=request.getContextPath() %>/ServletLogin" 
							method="POST" 
							novalidate
						>
                            
                            <div class="auth-box card">
                                <div class="card-block">
                                    <div class="row m-b-20">
                                        <div class="col-md-12">
                                            <h2 class="text-center">Login</h2>
                                            <h4 class="text-center alert-danger">${msg}</h4>
                                        </div>
                                    </div>
                                    
                                    <input 
										type="hidden" 
										value="<%= request.getParameter("url") %>" 
										name="url"
									>
                                   
                                    <div class="invalid-feedback">Usuário!</div>                                    
                                    <div class="form-group form-primary">
                                        <input 
											class="form-control" 
											name="login" 
											type="text" 
											required="required" 
										>
                                        <label class="float-label">Usuário</label>
                                    </div>
                                    
                                    <div class="invalid-feedback">Senha obrigatória!</div>
                                    <div class="form-group form-primary">
                                        <input 
											class="form-control" 
											name="senha" 
											type="password" 
											required="required"
										>
                                        <label class="float-label">Senha</label>
                                    </div>
                                    
                                    <div class="row m-t-30">
                                        <div class="col-md-12">
                                            <button 
                                            	type="submit" 
                                            	class="btn btn-primary btn-md btn-block waves-effect waves-light text-center m-b-20">
                                            	Entrar
                                           	</button>
                                        </div>
                                    </div>
                                    
                                    <hr/>
                                    <div class="row">
                                        <div class="col-md-10">
                                            <p class="text-inverse text-left m-b-0">Desenvolvido por <strong>João Paulo Mendes</strong>.</p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
	                        <!-- end of form -->
	                </div>
	                <!-- end of col-sm-12 -->
	            </div>
	            <!-- end of row -->
	        </div>
	        <!-- end of container-fluid -->
	    </section>
	    
	    <script type="text/javascript" src="assets/js/jquery/jquery.min.js"></script>     <script type="text/javascript" src="assets/js/jquery-ui/jquery-ui.min.js "></script>     <script type="text/javascript" src="assets/js/popper.js/popper.min.js"></script>     <script type="text/javascript" src="assets/js/bootstrap/js/bootstrap.min.js "></script>
	<!-- waves js -->
	<script src="assets/pages/waves/js/waves.min.js"></script>
	<!-- jquery slimscroll js -->
	<script type="text/javascript" src="assets/js/jquery-slimscroll/jquery.slimscroll.js "></script>
	<!-- modernizr js -->
	    <script type="text/javascript" src="assets/js/SmoothScroll.js"></script>     <script src="assets/js/jquery.mCustomScrollbar.concat.min.js "></script>
	<!-- i18next.min.js -->
	<script type="text/javascript" src="bower_components/i18next/js/i18next.min.js"></script>
	<script type="text/javascript" src="bower_components/i18next-xhr-backend/js/i18nextXHRBackend.min.js"></script>
	<script type="text/javascript" src="bower_components/i18next-browser-languagedetector/js/i18nextBrowserLanguageDetector.min.js"></script>
	<script type="text/javascript" src="bower_components/jquery-i18next/js/jquery-i18next.min.js"></script>
	<script type="text/javascript" src="assets/js/common-pages.js"></script>
</body>

</html>
	