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

	<script src="${pageContext.request.contextPath}/js/cliente.js"></script>
</head>

<body>
	<div id="container" class="effect aside-float aside-bright mainnav-lg">
		<%@include file="../header.jsp" %>

		<div class="boxed">
			<div id="content-container">

				<div id="page-title">
					<h1 class="page-header text-overflow">Edição de cliente</h1>
				</div>

				<div id="page-content">
					<div class="row">
						<div class="col-md-12">
							
							<div class="panel">	
								<c:if test="${showClientNotFound}">
					                <div class="alert alert-danger">
					                    <p>Cliente não encontrado!</p>
					                </div>
					            </c:if>
								<form class="form-group" action="/clientes" method="POST">
									<div class="panel-body">
										<div class="row">
											<div class="col-md-1">
												<label class="control-label">ID:</label>
	                                            <input class="form-control" name="id" value="${client.id}" readonly>
	                                        </div>

	                                        <div class="col-md-3">
												<label class="control-label">Nome:</label>
	                                            <input class="form-control" name="nome" value="${client.nome}" maxlength="30">
	                                        </div>

	                                        <div class="col-md-3">
	                                        	<label class="control-label">Email:</label>
												<input type="email" id="field_email" class="form-control" name="email" value="${client.email}" maxlength="30">
											</div>

											<div class="col-md-3">
	                                        	<label class="control-label">CPF/CNPJ:</label>
												<input id="field_cpf" class="form-control" name="cpf" value="${client.cpf}" onkeypress='mascaraMutuario(this,cpfCnpj)' onblur='clearTimeout()' maxlength="18">
											</div>

											<div class="col-md-2">
												<label class="control-label">Sexo:</label>
												<input class="form-control" name="sexo" value="${client.sexo}" maxlength="30">
											</div>
										</div>
										<div class="row" style="margin-top:25px">
											<div class="col-md-2">
												<label class="control-label">Telefone:</label>
												<input class="form-control" id="field_telefone" name="telefone" value="${client.telefone}">
											</div>

											<div class="col-md-4">
												<label type="address" class="control-label">Endereço:</label>
												<input class="form-control" name="endereco" value="${client.endereco}" maxlength="80">
											</div>

											<div class="col-md-1">
												<label class="control-label">Número:</label>
												<input class="form-control" name="enderecoNumero" value="${client.enderecoNumero}" maxlength="10">
											</div>

											<div class="col-md-2">
												<label class="control-label">Complemento:</label>
												<input class="form-control" name="enderecoComplemento" value="${client.enderecoComplemento}" maxlength="20">
											</div>

											<div class="col-md-3">
												<label class="control-label">Bairro:</label>
												<input class="form-control" name="bairro" value="${client.bairro}" maxlength="40">
											</div>
										</div>

										<div class="row" style="margin-top:25px">
											<div class="col-md-3">
												<label class="control-label">CEP:</label>
												<input id="field_cep" class="form-control" name="cep" value="${client.cep}" maxlength="9">
											</div>

											<div class="col-md-3">
												<label class="control-label">Cidade:</label>
												<input class="form-control" name="cidade" value="${client.cidade}" maxlength="30">
											</div>

											<div class="col-md-3">
												<label class="control-label">Estado:</label>
												<input class="form-control" name="estado" value="${client.estado}" maxlength="30">
											</div>
										</div>


										<div class="row" style="margin-top:25px;">
											<input value="Salvar" type="submit" class="btn btn-success pull-right" style="margin-left:10px"/>
											<a href="/clientes" class="btn btn-danger pull-right">Cancelar</a>
										</div>
									</div><!--/panel-body-->
								</form>
							</div><!--/panel-->

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