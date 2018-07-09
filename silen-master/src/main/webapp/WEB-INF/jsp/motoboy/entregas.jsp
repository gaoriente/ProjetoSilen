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
					<h1 class="page-header text-overflow">Minhas Entregas</h1>
				</div>

				<div id="page-content" >
					<div class="row">
						<div class="col-sm-12">
							<div class="panel">
								<div class="panel-body">
									<div class="table-responsive">
										<table class="table toggle-circle tablet breakpoint no-paging footable-loaded footable">
											<thead>
												<tr>
													<th class="footable-visible footable-first-column footable-sortable"><font><font>ID</font></font></th>
													<th class="footable-visible footable-first-column footable-sortable"><font><font>Cliente</font></font></th>
													<th class="footable-visible footable-first-column footable-sortable"><font><font>Motoboy</font></font></th>
													<th class="footable-visible footable-first-column footable-sortable"><font><font>Inicio</font></font></th>
													<th class="footable-visible footable-first-column footable-sortable"><font><font>Fim</font></font></th>
													<th class="footable-visible footable-first-column footable-sortable"><font><font>Status</font></font></th>
													<th class="footable-visible footable-first-column footable-sortable"><font><font>Mapa</font></font></th>
													<th class="footable-visible footable-first-column footable-sortable"><font><font></font></font></th>
												</tr>
											</thead>
											<tbody>
												<c:forEach items="${entregas}" var="entrega">
												<tr>
													<td>${entrega.id}</td>
													<td>${entrega.cliente.nome}</td>
													<td>${entrega.motoboy.nome}</td>
													<td>${entrega.startedAt}</td>
													<td>${entrega.finishedAt}</td>
													<td>${entrega.status}</td>
													<td><a href="/entrega/${entrega.id}/mapa">Abrir mapa</a></td>
													<td>
														<c:choose>
															<c:when test="${entrega.status == 'ABERTA'}">
																<a href="/entrega/${entrega.id}/start" class="btn btn-info pull-right" style="margin-left: 10px">INICIAR</a>	
															</c:when>
															<c:when test="${entrega.status == 'INICIADA'}">
																<a href="/entrega/${entrega.id}/finish" class="btn btn-info pull-right">FINALIZAR</a>	
															</c:when>
														</c:choose>
													</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
									<!--<a href="/entrega" class="btn btn-info pull-right">Cadastrar nova entrega</a>-->
								</div>
							</div>
						</div>
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