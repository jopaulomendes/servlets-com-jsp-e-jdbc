<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set 
	scope="session" 
	var="perfil"
	value='<%=request.getSession().getAttribute("perfil")%>'>
</c:set>

<nav class="pcoded-navbar">
	<div class="sidebar_toggle">
		<a href="#"><i class="icon-close icons"></i></a>
	</div>
	
	<div class="pcoded-inner-navbar main-menu">
		<div class="">
			<div class="main-menu-header">
				
				<c:if test="${imagemUsuario != '' && imagemUsuario != null}">
					<img 
						class="img-80 img-radius"
						src="${imagemUsuario}"
						alt="User-Profile-Image"
					>
				</c:if>				
				<c:if test="${imagemUsuario == '' || imagemUsuario == null}">
					<img 
						class="img-80 img-radius"
						src="<%=request.getContextPath()%>/assets/images/avatar-4.jpg"
						alt="User-Profile-Image"
					>
				</c:if>
				
				<div class="user-details">
<!-- 					 mostra usuário logado -->
					<span id="more-details"><%=session.getAttribute("usuario")%> 
						<i class="fa fa-caret-down"></i>
					</span> 
				</div>
			</div>

			<div class="main-menu-content">
				<ul>
					<li class="more-details"> 
						<a	href="<%=request.getContextPath()%>/ServletLogin?acao=sair">
							<i class="ti-layout-sidebar-left"></i>
							Sair
						</a>
					</li>
				</ul>
			</div>
		</div>
		
		<div 
			class="pcoded-navigation-label"
			data-i18n="nav.category.navigation"
		>
			Menu lateral
		</div>
		
		<ul class="pcoded-item pcoded-left-item">
			<li class="active">
				<a 
					href="<%=request.getContextPath() %>/principal/home.jsp"
					class="waves-effect waves-dark"
				> 
					<span class="pcoded-micon">
						<i class="ti-home"></i>
						<b>D</b>
					</span> 
					<span 
						class="pcoded-mtext"
						data-i18n="nav.dash.main"
					>
						Home
					</span> 
					<span class="pcoded-mcaret"></span>
				</a>
			</li>
			
			<li class="pcoded-hasmenu">
				<a 
					href="javascript:void(0)"
					class="waves-effect waves-dark"
				>
					<span class="pcoded-micon">
						<i class="ti-layout-grid2-alt"></i>
					</span> 
					<span 
						class="pcoded-mtext"
						data-i18n="nav.basic-components.main"
					>
						Menu
					</span> 
					<span class="pcoded-mcaret"></span>
				</a>
			
				<ul class="pcoded-submenu">					
					<li class=" ">
						<a 
							href="ServletUsuarioController?acao=listarUsuario" 
							class="waves-effect waves-dark"
						> 
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span> 
							<span class="pcoded-mtext"
								data-i18n="nav.basic-components.alert">Usuário
							</span> 
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
					
					<c:if test="${perfil == 'ADMIN'}">
						<li class=" ">
							<a 
								href="ServletUsuarioController?acao=listarUsuario"
								class="waves-effect waves-dark"
							> 
								<span class="pcoded-micon">
									<i class="ti-angle-right"></i>
								</span> 
								<span 
									class="pcoded-mtext"
									data-i18n="nav.basic-components.alert"
								>
									Lista de Usuários
								</span>
								<span class="pcoded-mcaret"></span>
							</a>
						</li>
					</c:if>
				 </ul>
			</li>
		</ul>
<!-- 		Relatórios -->
		<ul class="pcoded-item pcoded-left-item">			
			<li class="pcoded-hasmenu">
				<a 
					href="javascript:void(0)"
					class="waves-effect waves-dark"
				>
					<span class="pcoded-micon">
						<i class="ti-layout-grid2-alt"></i>
					</span> 
					<span 
						class="pcoded-mtext"
						data-i18n="nav.basic-components.main"
					>
						Relatórios
					</span> 
					<span class="pcoded-mcaret"></span>
				</a>			
				<ul class="pcoded-submenu">					
					<li class=" ">
						<a 
							href="<%=request.getContextPath() %>/principal/relatorio-usuario.jsp"
							class="waves-effect waves-dark"
						> 
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span> 
							<span class="pcoded-mtext"
								data-i18n="nav.basic-components.alert">Relatório de Usuários
							</span> 
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
				 </ul>
			</li>
		</ul>
<!-- 		Gráficos -->
		<ul class="pcoded-item pcoded-left-item">			
			<li class="pcoded-hasmenu">
				<a 
					href="javascript:void(0)"
					class="waves-effect waves-dark"
				>
					<span class="pcoded-micon">
						<i class="ti-layout-grid2-alt"></i>
					</span> 
					<span 
						class="pcoded-mtext"
						data-i18n="nav.basic-components.main"
					>
						Gráficos
					</span> 
					<span class="pcoded-mcaret"></span>
				</a>			
				<ul class="pcoded-submenu">					
					<li class=" ">
						<a 
							href="<%=request.getContextPath() %>/principal/grafico-usuario.jsp"
							class="waves-effect waves-dark"
						> 
							<span class="pcoded-micon">
								<i class="ti-angle-right"></i>
							</span> 
							<span class="pcoded-mtext"
								data-i18n="nav.basic-components.alert">Gráfico de Salário
							</span> 
							<span class="pcoded-mcaret"></span>
						</a>
					</li>
				 </ul>
			</li>
		</ul>	
	</div>
</nav>