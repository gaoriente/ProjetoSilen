<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title></title>

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
	<link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/nifty.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/demo/nifty-demo-icons.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/css/demo/nifty-demo.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/plugins/morris-js/morris.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/plugins/magic-check/css/magic-check.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/plugins/pace/pace.min.css" rel="stylesheet">
	<link href="${pageContext.request.contextPath}/plugins/themify-icons/themify-icons.min.css" rel="stylesheet">

	<script src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/bootstrap.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/nifty.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/demo/nifty-demo.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/MascaraValidacao.js"></script>
	<script src="${pageContext.request.contextPath}/js/jquery.mask.min.js"></script>
	<script src="${pageContext.request.contextPath}/js/system.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/pace/pace.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/pace/pace.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/morris-js/raphael-js/raphael.min.js"></script>
	<script src="${pageContext.request.contextPath}/plugins/sparkline/jquery.sparkline.min.js"></script>

	<link href="${pageContext.request.contextPath}/css/system.css" rel="stylesheet">
	
</head>

<body>
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
		<%@include file="../header.jsp" %>

		<div class="boxed">
			<div id="content-container">

				<div id="page-title">
					<h1 class="page-header text-overflow">Edição de motoboy</h1>
				</div>

				<div id="page-content">
					<div class="row">
						<div class="col-md-12">
							<c:if test="${showMotoboyNotFound}">
				                <div class="alert alert-danger">
				                    <p>Motoboy não encontrado!</p>
				                    <a href="/motoboys">Voltar para lista de motoboys</a>
				                </div>
				                
				            </c:if>

				            <c:if test="${showMustCreateUserFirst}">
				            	<div class="alert alert-danger">
				            		<p>Não existe nenhum usuário disponível para associar a um novo motoboy</p>
				            		<p>Cadastre primeiro um usuário do tipo MOTOBOY</p>
				            		<p><a href="/usuario">Ir para o cadastro de usuários</a> ou <p><a href="/motoboys">Voltar para a lista de motoboys</a></p>
				            	</div>
				            </c:if>

				            <c:if test="${empty showMotoboyNotFound && empty showMustCreateUserFirst}">
								<div class="panel">
									<form class="form-group" action="/motoboys" method="POST">
										<div class="panel-body">
											<div class="row">
												<div class="col-md-1">
													<label class="control-label">ID:</label>
		                                            <input class="form-control" name="id" value="${motoboy.id}" readonly>
		                                        </div>

		                                        <div class="col-md-3">
													<label class="control-label">Nome:</label>
		                                            <input class="form-control" name="nome" value="${motoboy.nome}">
		                                        </div>

		                                        <div class="col-md-3">
		                                        	<label class="control-label">Usuário:</label>
													<select class="form-control" name="userId">
														<c:forEach items="${users}" var="user">
															<option value="${user.id}" ${user.id == motoboy.user.id ? 'selected="selected"' : ''}>${user.username}</option>
														</c:forEach>
													</select>
												</div>
											</div>

											<div class="row" style="margin-top:25px;">
												<input value="Salvar" type="submit" class="btn btn-success pull-right" style="margin-left:10px"/>
												<a href="/motoboys" class="btn btn-danger pull-right">Cancelar</a>
											</div>
										</div><!--/panel-body-->
									</form>
								</div><!--/panel-->
							</c:if>
						</div>
					</div>
				</div><!--/page-content-->
			</div><!--/content-container-->
		</div><!--/boxed-->

		<%@include file="../menu_lateral.jsp" %>

		<%@include file="../footer.html" %>
	</div><!--/container-->
</body>
</html>