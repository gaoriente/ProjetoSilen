<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav id="mainnav-container">
	<div id="mainnav">
		<div id="mainnav-menu-wrap">
      		<div class="nano">
        		<div class="nano-content">
          			<div id="mainnav-profile" class="mainnav-profile">
            			<div class="profile-wrap">
              				<div class="pad-btm">
                				<img class="img-circle img-sm img-border" src="${pageContext.request.contextPath}/img/profile-photos/1.png" alt="Profile Picture">
              				</div>
              				<a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
                				<span class="pull-right dropdown-toggle"></span>
                				<p class="mnp-name">${loggedUser.username}</p>
              				</a>
            			</div>
          			</div>
					<ul id="mainnav-menu" class="list-group">
						<li class="list-header">Menu</li>
		                <li>
							<a href="/home">
		                    	<i class="demo-psi-home"></i>
		                    	<span class="menu-title"><strong>Inicio</strong></span>
		                  	</a>
		                </li>
						
						<c:if test="${loggedUser.userType == 'ADMIN'}">
			                <li>
								<a href="/clientes">
			                    	<i class="demo-psi-receipt-4"></i>
			                    	<span class="menu-title"><strong>Clientes</strong></span>
			                  	</a>
			                </li>
		                
			                <li>
								<a href="/motoboys">
			                    	<i class="demo-psi-receipt-4"></i>
			                    	<span class="menu-title"><strong>Motoboys</strong></span>
			                  	</a>
			                </li>

			                <li>
								<a href="/usuarios">
			                    	<i class="demo-psi-receipt-4"></i>
			                    	<span class="menu-title"><strong>Usuários</strong></span>
			                  	</a>
			                </li>
			            </c:if>

		                <li>
							<a href="${loggedUser.userType == 'MOTOBOY' ? '/entregas/motoboy' : '/entregas'}">
		                    	<i class="demo-psi-receipt-4"></i>
		                    	<span class="menu-title"><strong>Entregas</strong></span>
		                  	</a>
		                </li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</nav>