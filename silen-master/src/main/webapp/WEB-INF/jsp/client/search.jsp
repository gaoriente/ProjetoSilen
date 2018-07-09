<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>
<%@ page import="br.com.silen.model.Cliente" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="pt-br">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>SILEN - Sistema Logística de entrega</title>

<!--STYLESHEET-->
<!--=================================================-->

<!--Open Sans Font [ OPTIONAL ]-->
<link href='https://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700' rel='stylesheet' type='text/css'>

<!--Bootstrap Stylesheet [ REQUIRED ]-->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!--Nifty Stylesheet [ REQUIRED ]-->
<link href="css/nifty.min.css" rel="stylesheet">

<!--Nifty Premium Icon [ DEMONSTRATION ]-->
<link href="css/demo/nifty-demo-icons.min.css" rel="stylesheet">

<!--Demo [ DEMONSTRATION ]-->
<link href="css/demo/nifty-demo.min.css" rel="stylesheet">

<!--Morris.js [ OPTIONAL ]-->
<link href="plugins/morris-js/morris.min.css" rel="stylesheet">

<!--Magic Checkbox [ OPTIONAL ]-->
<link href="plugins/magic-check/css/magic-check.min.css" rel="stylesheet">

<!--JAVASCRIPT-->
<!--=================================================-->

<script src="plugins/pace/pace.min.js"></script>


<!--Pace - Page Load Progress Par [OPTIONAL]-->
<link href="plugins/pace/pace.min.css" rel="stylesheet">
<script src="plugins/pace/pace.min.js"></script>

<!--jQuery [ REQUIRED ]-->
<script src="js/jquery.min.js"></script>

<!--BootstrapJS [ RECOMMENDED ]-->
<script src="js/bootstrap.min.js"></script>

<!--NiftyJS [ RECOMMENDED ]-->
<script src="js/nifty.min.js"></script>

<!--=================================================-->
<!--Demo script [ DEMONSTRATION ]-->
<script src="js/demo/nifty-demo.min.js"></script>

<!--Morris.js [ OPTIONAL ]-->
<script src="plugins/morris-js/raphael-js/raphael.min.js"></script>

<!--Sparkline [ OPTIONAL ]-->
<script src="plugins/sparkline/jquery.sparkline.min.js"></script>

<!--Specify page [ SAMPLE ]-->
<script src="js/MascaraValidacao.js"></script>

<script src="js/jquery.mask.min.js"></script>
<!-- Scripts criados-->
<script src="js/system.js"></script>
<script src="js/cliente.js"></script>

<link href="css/system.css" rel="stylesheet">


<!--Themify Icon-->
<link href="plugins/themify-icons/themify-icons.min.css" rel="stylesheet">
</head>


<body>
    <div id="container" class="effect aside-float aside-bright mainnav-lg">
        <!--NAVBAR-->
        <!--===================================================-->
        <header id="navbar">
          <div id="navbar-container" class="boxed">
            <!--Titulo no menu a esquerda--> 
                <div class="navbar-header">
                  <a href="index.html" class="navbar-brand">
                    <img src="img/logo.png" alt="Silen Logo" class="brand-icon">
                    <div class="brand-title">
                      <span class="brand-text">Silen</span>
                    </div>
                  </a>
                </div>
            <!--================================-->
        
            <!--Navbar Dropdown-->
            <div class="navbar-content clearfix">
              <ul class="nav navbar-top-links pull-left">
                <!--Navigation toogle button-->
                <li class="tgl-menu-btn">
                  <a class="mainnav-toggle" href="#">
                    <i class="demo-pli-view-list"></i>
                  </a>
                </li>
                <!--End Navigation toogle button-->
              </ul>
        
              <ul class="nav navbar-top-links pull-right">
        
                <!--Informções do Usuário-->
                <li id="dropdown-user" class="dropdown">
                  <a href="#" data-toggle="dropdown" class="dropdown-toggle text-right">
                    <span class="pull-right">
                      <i class="demo-pli-male ic-user"></i>
                    </span>
                    <div class="username hidden-xs">Gabriel Oriente</div>
                  </a>
        
                  <div class="dropdown-menu dropdown-menu-md dropdown-menu-right panel-default">
        
                    <!-- User dropdown menu 
                    <ul class="head-list">
                      <li>
                        <a href="#">
                          <i class="demo-pli-male icon-lg icon-fw"></i> Profile
                        </a>
                      </li>
                    </ul>-->
        
                    <!-- Dropdown footer -->
                    <div class="pad-all text-right">
                      <a href="index.html" class="btn btn-primary">
                        <i class="demo-pli-unlock"></i> Logout
                      </a>
                    </div>
                  </div>
                <!--End user dropdown-->
              </ul>
            </div>
            <!--================================-->
            <!--End Navbar Dropdown-->
        
          </div>
        </header>
        <!--===================================================-->
        <!--END NAVBAR-->
        
        <div class="boxed">
        
          <!--CONTENT CONTAINER-->
          <!--===================================================-->
            <div id="content-container">
        
                <!-- Título -->
                <div id="page-title">
                    <h1 class="page-header text-overflow">Cliente</h1>
                </div>
            
                <div id="page-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="panel"> 
                                    <form class="form-horizontal" action="FrontController" method="post">
                                        <div class="panel-body">
                                            <div class="row">
                                                <div class="col-md-1 ">
                                                    <label class="control-label">Id:</label>
                                                    <input class="form-control" type="text" name="idCliente" id="idCliente" maxlength="20">
                                                </div>
                
                                                <div class="col-md-5 ">
                                                    <label class="control-label">Nome Completo:</label>
                                                    <input class="form-control" type="text" name="nomeCliente" id="nomeCliente" maxlength="200" >
                                                </div>
                                                
                                                <div class="col-md-2">
                                                    <label class="control-label">Tipo Pessoa:</label>
                                                    <select class="form-control" name="tipoPessoa" id="tipoPessoa">
                                                        <option value="">Selecione</option>
                                                        <option value="1">Física</option>
                                                        <option value="2">Jurídica</option>
                                                    </select>
                                                </div>
                
                
                                                <div class="col-md-2 ">
                                                    <label class="control-label">CPF/CNPJ:</label>
                                                    <input class="form-control" type="text" name="CPFCNPJ" id="CPFCNPJ" maxlength="20"> 
                                                </div>
                
                                                
                                            </div>
                
                
                                            <div class="row">
                                                <div class="col-md-2">
                                                    <label class="control-label">CEP:</label>
                                                    <input class="form-control" type="text" name="cepCliente" id="cepCliente" maxlength="11" />
                                                </div>                              
                                                <div class="col-md-4">
                                                    <label class="control-label">Endereço:</label>
                                                    <input class="form-control" type="text" name="enderecoCliente" id="enderecoCliente" maxlength="100" >
                                                </div>
                                                <div class="col-md-2">
                                                    <label class="control-label">Número:</label>
                                                    <input class="form-control" type="text" name="numeroCliente" id="numeroCliente" maxlength="10" >
                                                </div>
                                                <div class="col-md-3">
                                                    <label class="control-label">Complemento:</label>
                                                    <input class="form-control" type="text" name="complementoCliente" id="complementoCliente" maxlength="100" >
                                                </div>
                                                
                                                
                                            </div>
                
                                            <div class="row">   
                                                <div class="col-md-2">
                                                    <label class="control-label">Bairro:</label>
                                                    <input class="form-control" type="text" name="bairroCliente" id="bairroCliente" maxlength="100" >
                                                </div>                          
                                                <div class="col-md-2">
                                                    <label class="control-label">Cidade:</label>
                                                    <input class="form-control" type="text" name="cidadeCliente" id="cidadeCliente" maxlength="100" >
                                                </div>
                                                <div class="col-md-2">
                                                    <label class="control-label">Estado:</label>
                                                    <select class="form-control" name="estadoCliente" id="estadoCliente">
                                                        <option value="">Selecione</option>
                                                        <option value="AC">AC</option>
                                                        <option value="AL">AL</option>
                                                        <option value="AM">AM</option>
                                                        <option value="AP">AP</option>
                                                        <option value="BA">BA</option>
                                                        <option value="CE">CE</option>
                                                        <option value="DF">DF</option>
                                                        <option value="ES">ES</option>
                                                        <option value="GO">GO</option>
                                                        <option value="MA">MA</option>
                                                        <option value="MG">MG</option>
                                                        <option value="MS">MS</option>
                                                        <option value="MT">MT</option>
                                                        <option value="PA">PA</option>
                                                        <option value="PB">PB</option>
                                                        <option value="PE">PE</option>
                                                        <option value="PI">PI</option>
                                                        <option value="PR">PR</option>
                                                        <option value="RJ">RJ</option>
                                                        <option value="RN">RN</option>
                                                        <option value="RO">RO</option>
                                                        <option value="RR">RR</option>
                                                        <option value="RS">RS</option>
                                                        <option value="SC">SC</option>
                                                        <option value="SE">SE</option>
                                                        <option value="SP">SP</option>
                                                        <option value="TO">TO</option>
                                                    </select>
                                                </div>                              
                                                
                
                                                <div class="col-md-2">
                                                    <label class="control-label">TipoContrato:</label>
                                                        <select class="form-control" name="tipoContrato" id="tipoContrato">
                                                        <option value="">Selecione</option>
                                                        <option value="1">Avulso</option>
                                                        <option value="2">Diário</option>
                                                        <option value="3">Semanal</option>
                                                        <option value="4">Quinzenal</option>
                                                        <option value="5">Mensal</option>
                                                    </select>
                                                </div>
                                                
                                                
                                            </div>
                
                                            
                                            <div class="row">
                                                <div class="col-md-2 ">
                                                    <label class="control-label">Tel.Celular:</label>
                                                    <input class="form-control demo-msk-phone" type="text" name="telCelular" id="telCelular" maxlength="20" placeholder="(99)99999-9999">
                                                </div>
                
                                                <div class="col-md-2 ">
                                                    <label class="control-label">Tel.Fixo:</label>
                                                    <input class="form-control" type="text" name="telFixo" id="telFixo" maxlength="20" placeholder="(99)9999-9999">
                                                </div>
                
                                                <div class="col-md-2 ">
                                                    <label class="control-label">Tel.Recado:</label>
                                                    <input class="form-control" type="text" name="telRecado" id="telRecado" maxlength="20" placeholder="(99)99999-9999">
                                                </div>
                
                                                <div class="col-md-5">
                                                    <label class="control-label">Email:</label>
                                                    <input class="form-control" type="email" name="email" id="email" maxlength="200" placeholder="Ex.: email@email.com" >
                                                </div>
                                            </div>
                                            
                                        </div>
                                        <div class="panel-footer text-right">
                
                                            <div class="row form-group" >
                                                <div class="col-md-1 pull-right" style="margin-right:10px" id="divCadastrar">
                                                    <button type="submit" name="command" class="btn btn-success" id="btnCadastro" value="Cliente_Inserir">Cadastro</button>
                                                </div>
                                                <div class="col-md-1 pull-right" style="margin-right:10px;display:none" id="divAtualizar">
                                                    <button type="submit" name="command" class="btn btn-warning" id="btnAtualizar" value="Cliente_Atualizar">Atualizar</button>
                                                </div>
                                                
                                                <div class="col-md-1 pull-left" style="margin-left:10px" id="divLimpar">
                                                    <button type="button"  class="btn btn-default" id="btnClear" onclick="limpar()" value="Limpar">Limpar</button>
                                                </div>
                                                <div class="col-md-1 pull-left" style="margin-left:10px;display:none" id="divCancelarAtualizacao">
                                                    <button type="button"  class="btn btn-default" id="btnCancelar" onclick="CancelarAtualizacao()" value="Cancelar"style="">Cancelar</button>
                                                </div>
                                                <div class="col-md-1  pull-left" id="divPesquisar">
                                                    <button type="submit" name="command" class=" btn btn-info" value="Cliente_PesquisarCliente" id="btnSearch" onclick='habilitar()'>Pesquisar</button>
                                               </div>
                                               
                                               
                                            </div>
                                        </div>
                                    </form>
                                    <!--===================================================-->
                
                           </div>
                        </div>
                    </div>
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
                                                        <th class="footable-visible footable-first-column footable-sortable"><font><font></font></font></th>
                                                        <th class="footable-visible footable-first-column footable-sortable"><font><font>ID</font></font></th>
                                                        <th class="footable-visible footable-first-column footable-sortable"><font><font>Nome Cliente</font></font></th>
                                                        <th class="footable-visible footable-first-column footable-sortable"><font><font>CPF/CNPJ</font></font></th>
                                                        <th class="footable-visible footable-first-column footable-sortable"><font><font>E-mail</font></font></th>
                                                        <th class="footable-visible footable-first-column footable-sortable"><font><font>Cidade</font></font></th>
                                                        <th class="footable-visible footable-first-column footable-sortable"><font><font>Estado</font></font></th>
                                                        <th class="footable-visible footable-first-column footable-sortable"><font><font>Tipo Contrato</font></font></th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                <c:forEach items="${cliente}" var="cliente">
                                                    <tr>
                                                        <td class="text-center">
                                                            <!-- <button type="submit" name="command" class="btn btn-hover-warning ti-pencil-alt add-tooltip" data-toggle="tooltip" data-container="body" data-placement="top" data-original-title="Atualizar" value="AtualizarCliente" onclick="Atualizar(${cliente.idCliente})"></button>
                                                            <button type="submit" name="command" class="btn btn-hover-danger ti-trash add-tooltip" data-toggle="tooltip" data-container="body" data-placement="top" data-original-title="Excluir" value="ApagarCliente" onclick="Excluir(${cliente.idCliente})"></button> -->
                                                            
                                                            <button type="submit" name="command" class="btn btn-hover-warning ti-pencil-alt add-tooltip" value="AtualizarCliente" onclick="Atualizar(${cliente.idCliente})"></button>
                                                            <button type="submit" name="command" class="btn btn-hover-danger ti-trash add-tooltip" value="ApagarCliente" onclick="Excluir(${cliente.idCliente})"></button>
                                                            
                                                        </td>
                                                        <td>${cliente.idCliente}</td>
                                                        <td>${cliente.nomeCliente}</td>
                                                        <td>${cliente.CPFCNPJ}</td>
                                                        <td>${cliente.email}</td>
                                                        <td>${cliente.cidadeCliente}</td>
                                                        <td>${cliente.estadoCliente}</td>
                                                        <td>${cliente.idTipoContrato}</td>
                                                    </tr>
                                                </c:forEach>
    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                    
                            </div>
                        </div>
                    </div>
                </div>
            </div>
           

            <!--ASIDE-->
            <!--===================================================-->
            <aside id="aside-container">
                  <div id="aside">
                    <div class="nano">
                      <div class="nano-content">
        
                        <!--Nav tabs-->
                        <!--================================-->
                        <ul class="nav nav-tabs nav-justified">
                          <li class="active">
                            <a href="#demo-asd-tab-1" data-toggle="tab">
                              <i class="demo-pli-speech-bubble-7"></i>
                            </a>
                          </li>
                          <li>
                            <a href="#demo-asd-tab-2" data-toggle="tab">
                              <i class="demo-pli-information icon-fw"></i> Report
                            </a>
                          </li>
                          <li>
                            <a href="#demo-asd-tab-3" data-toggle="tab">
                              <i class="demo-pli-wrench icon-fw"></i> Settings
                            </a>
                          </li>
                        </ul>
                        <!--================================-->
                        <!--End nav tabs-->
        
                      </div>
                    </div>
                  </div>
              </aside>
            <!--===================================================-->
            <!--END ASIDE-->
        
        
            <!--MAIN NAVIGATION-->
            <!--===================================================-->
            <nav id="mainnav-container">
              <div id="mainnav">
        
                <!--Menu-->
                <!--================================-->
                <div id="mainnav-menu-wrap">
                  <div class="nano">
                    <div class="nano-content">
        
                      <!--Profile Widget-->
                      <!--================================-->
                      <div id="mainnav-profile" class="mainnav-profile">
                        <div class="profile-wrap">
                          <div class="pad-btm">
                            <img class="img-circle img-sm img-border" src="img/profile-photos/1.png" alt="Profile Picture">
                          </div>
                          <a href="#profile-nav" class="box-block" data-toggle="collapse" aria-expanded="false">
                            <span class="pull-right dropdown-toggle">
                            </span>
                            <p class="mnp-name">Gabriel Oriente</p>
                            <span class="mnp-desc">silen@gmail.comm</span>
                          </a>
                        </div>
                      </div>
        
                      <ul id="mainnav-menu" class="list-group">
        
                        <!--Category name-->
                        <li class="list-header">Menu</li>
        
                        <!--Menu list item-->
                        <li>
                          <a href="administrador_inicio.html">
                            <i class="demo-psi-home"></i>
                            <span class="menu-title">
                              <strong>Inicio</strong>
                            </span>
                          </a>
                        </li>
        
                        <!--Menu list item-->
                        <li>
                          <a href="adm_entregas.jsp">
                            <i class="demo-psi-receipt-4"></i>
                            <span class="menu-title">
                              <strong>Entregas</strong>
                            </span>
                          </a>
                        </li>
        
                        <!--Menu list item-->
                        <li>
                          <a href="administrador_rastrear.html">
                            <i class="demo-psi-tactic"></i>
                            <span class="menu-title">
                              <strong>Rastrear</strong>
                            </span>
                          </a>
                        </li>
        
                        <!--Menu list item-->
                        <li>
                          <a href="administrador_relatorio.html">
                            <i class="demo-psi-bar-chart"></i>
                            <span class="menu-title">
                              <strong>Relatório</strong>
                            </span>
                          </a>
                        </li>
        
                        <!--Menu list item-->
                        <li class="active-link">
                          <a href="#">
                            <i class="demo-psi-pen-5"></i>
                            <span class="menu-title">
                              <strong>Cadastro</strong>
                            </span>
                            <i class="arrow"></i>
                          </a>
        
                          <!--Submenu-->
                          <ul class="collapse">
                            <li><a href="administrador_funcionario.html">Funcionário</a></li>
                            <li class="active-link"><a href="adm_cliente.jsp">Cliente</a></li>
                          </ul>
                        </li>
        
                        <!--Menu list item-->
                        <li>
                          <a href="administrador_contato.html">
                            <i class="demo-psi-mail"></i>
                            <span class="menu-title">
                              <strong>Contato</strong>
                            </span>
                          </a>
                        </li>
        
                        <!--================================-->
                        <!--End widget-->
        
                        </ul>
                    </div>
                  </div>
                  </div>
                  <!--================================-->
                  <!--End menu-->
        
                </div>
              </nav>
              <!--===================================================-->
              <!--END MAIN NAVIGATION-->
        
            </div>
              
        
        <!-- FOOTER -->
        <!--===================================================-->
        <footer id="footer">
            <div class="hide-fixed pull-right pad-rgt">
                SILEN
            </div>
            <p class="pad-lft">&#0169; 2017</p>
    
        </footer>
    </div>
    <div id="modalDelete" class="bootbox modal fade bootbox-confirm in" tabindex="-1" role="dialog" style="display: none; padding-right: 17px;">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-body">
                    <button type="button" class="close" data-dismiss="modal" style="margin-top: -10px;"><i class="pci-cross pci-circle"></i></button>
                    
                    <div class="bootbox-body">Deseja realmente excluir este cliente?</div>
                </div>
                <div class="modal-footer">
                    <button onclick="CancelarExclusao()" type="button" class="btn btn-default">Cancel</button>
                    <button type="button"  class="btn btn-danger" id="btnClear" value="ClienteApagar">Excluir</button>
                </div>
            </div>
        </div>
    </div>
    
    <script>
        
    </script>
  </body>
</html>
