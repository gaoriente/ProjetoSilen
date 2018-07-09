function habilitaRemetente(){
	$("#txtEnderecoRemetente").prop('readonly', false);
	$("#txtNumeroRemetente").prop('readonly', false);
	$("#txtComplementoRemetente").prop('readonly', false);
	$("#txtBairroRemetente").prop('readonly', false);
	$("#txtCidadeRemetente").prop('readonly', false);
	$("#txtEstadoRemetente").prop('readonly', false);
}

function carregaRemetente(){
	$("#txtEnderecoRemetente").val('Rua taquari');
	$("#txtNumeroRemetente").val('123');
	$("#txtComplementoRemetente").val('São Judas');
	$("#txtBairroRemetente").val('Mooca');
	$("#txtCidadeRemetente").val('São Paulo');
	$("#txtEstadoRemetente").val('SP');
}

function teste(){
	var idRemetente = $("#idRemetente").val();
	var cpfcnpjRemetente = $("#txtCPFRemetente").val();
	var nomeRemetente = $("#txtRemetente").val();
	
	//alert(idRemetente + cpfcnpjRemetente + nomeRemetente);
}	
	
function pesquisarEntrega(){
	var idEntrega = 1;
	$.ajax({
		url:"/dao/EntregasDAO/listarCompleto",
		contentType: "application/json; charset=utf-8",
		type: "POST",
		cache: false,
		data: {"idEntrega": idEntrega},
		success: function(data){
			alert('json ok');	
		}
	});	
}

function Excluir(idCliente){
	$("#modalDelete").modal('show');
}

function CancelarExclusao(){
	$("#modalDelete").modal('hide');
};

function Atualizar(id){
	$("#divAtualizar").show();
	$("#divCancelarAtualizacao").show();
	$("#divPesquisar").hide();
	$("#divCadastrar").hide();
}

function CancelarAtualizacao(){
	$("#divAtualizar").hide();
	$("#divCancelarAtualizacao").hide();
	$("#divPesquisar").show();
	$("#divCadastrar").show();
}
