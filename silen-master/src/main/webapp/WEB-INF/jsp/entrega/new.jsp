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
                    <h1 class="page-header text-overflow">Cadastro de entrega</h1>
                </div>

                <div id="page-content">
                    <div class="row">
                        <div class="col-md-12">
                            <c:if test="${showNoMotoboyAvailable}">
                                <div class="alert alert-danger">
                                    <p>Nenhum motoboy disponivel</p>
                                    <a href="/entregas">Voltar para lista de entregas</a>
                                </div>
                            </c:if>
                            <c:if test="${empty showNoMotoboyAvailable}">
                                <div class="panel">
                                    <form class="form-group" action="/entregas" method="POST">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-3">
                                                    <label class="control-label">Cliente:</label>
                                                    <select class="form-control" name="clienteId">
                                                        <c:forEach items="${clientes}" var="cliente">
                                                            <option value="${cliente.id}">${cliente.nome}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="control-label">Caixa:</label>
                                                    <select class="form-control" name="caixaId">
                                                        <c:forEach items="${caixas}" var="caixa">
                                                            <option value="${caixa.id}">${caixa.nome}</option>
                                                        </c:forEach>
                                                    </select>
                                                </div>

                                                <div class="col-md-3">
                                                    <label class="control-label">Quantidade:</label>
                                                    <input class="form-control" name="quantidadeCaixa">
                                                </div>
                                            </div>

                                            <div class="row" style="margin-top:25px;">
                                                <input value="Salvar" type="submit" class="btn btn-success pull-right" style="margin-left:10px"/>
                                                <a href="/entregas" class="btn btn-danger pull-right">Cancelar</a>
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