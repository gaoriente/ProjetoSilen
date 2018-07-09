function alterarUsuario()
{
	document.cadastroUsu.action = "alteracaoUsuario.do";
  	document.cadastroUsu.submit();	
}

function excluirUsuario()
{
	document.cadastroUsu.action = "exclusaoUsuario.do";
	document.cadastroUsu.submit();
}