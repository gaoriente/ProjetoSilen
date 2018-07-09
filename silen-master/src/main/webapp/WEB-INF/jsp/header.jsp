<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<header id="navbar">
	<div id="navbar-container" class="boxed">
		<div class="navbar-header">
			<a href="index.html" class="navbar-brand">
				<img src="${pageContext.request.contextPath}/img/logo.png" alt="Silen Logo" class="brand-icon" />
        		<div class="brand-title">
          			<span class="brand-text">Silen</span>
        		</div>
          	</a>
        </div>
		    
    	<div class="navbar-content clearfix">
			<ul class="nav navbar-top-links pull-left">
	        	<li class="tgl-menu-btn">
	          		<a class="mainnav-toggle" href="#">
	            		<i class="demo-pli-view-list"></i>
	          		</a>
	        	</li>
	      	</ul>
			<ul class="nav navbar-top-links pull-right">
        		<li id="dropdown-user" class="dropdown">
          			<a href="#" data-toggle="dropdown" class="dropdown-toggle text-right">
            			<span class="pull-right">
              				<i class="demo-pli-male ic-user"></i>
            			</span>
            			<div class="username hidden-xs">${loggedUser.username}</div>
          			</a>

          			<div class="dropdown-menu dropdown-menu-md dropdown-menu-right panel-default">
            			<div class="pad-all text-right">
              				<a href="/logout" class="btn btn-primary">
                				<i class="demo-pli-unlock"></i>Logout
              				</a>
            			</div>
          			</div>
          		</li>
			</ul>
    	</div>
  	</div><!--/navbar-->
</header>