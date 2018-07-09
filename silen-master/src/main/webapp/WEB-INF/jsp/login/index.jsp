<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<title>Acesso - Sistema</title>
<meta name="viewport" content="width-device-width, initial-scale=1  maximum-scale=1, user-scalable=no" />
<meta charset="utf-8" />

<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/nifty.min.css" rel="stylesheet">
<link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">
<link href="css/demo/nifty-demo.min.css" rel="stylesheet">
<link href="plugins/morris-js/morris.min.css" rel="stylesheet">
<link href="plugins/magic-check/css/magic-check.min.css" rel="stylesheet">
<link href="plugins/pace/pace.min.css" rel="stylesheet">

<script src="plugins/pace/pace.min.js"></script>
<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/nifty.min.js"></script>
<script src="js/demo/nifty-demo.min.js"></script>
<script src="plugins/morris-js/morris.min.js"></script>
<script src="plugins/morris-js/raphael-js/raphael.min.js"></script>
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>
<script src="js/demo/dashboard.js"></script>

<link href="css/estiloLogin.css" rel="stylesheet" media="screen" />
<script src="js/acesso.js"></script>
<script src="js/main.js"></script>

</head>

<body>

    <div class="container-fluid" id="form-container">
        <div class="panel " id="form-box">
            <c:if test="${showInvalidLoginMessage}">
                <div class="alert alert-danger">
                    <p>Usuario ou senha incorretos</p>
                </div>
            </c:if>
            <form class="form-group" action="/login" method="POST">
                <h3 class="text-center">
                    <img class="text-center" src="img/silen/logo2.jpg">
                </h3>

                <div class="form-group">
                    <label class="sr-only" for="login">UsuÃ¡rio</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <span class="glyphicon glyphicon-user"></span>
                        </div>
                        <input id="login" type="text" name="username" class="form-control" placeholder="Seu login de usuário" maxlength="50">
                    </div>
                </div>

                <div class="form-group">
                    <label class="sr-only" for="senha">Senha</label>
                    <div class="input-group">
                        <div class="input-group-addon">
                            <span class="glyphicon glyphicon-lock"></span>
                        </div>
                        <input id="password" type="password" name="password" class="form-control" placeholder="Digite sua senha" maxlength="50">
                    </div>
                </div>

                <input value="Entrar" type="submit" class="btn btn-success form-control"/>
            </form>
        </div>
    </div>
</body>
</html>
