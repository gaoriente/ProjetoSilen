function limpar(){
	$("input[type=text]").val("");
	$('select').val('');
    $("input[type=number]").val('');
	$("input[type=radio]").attr('checked', false);
	$("input[type=checkbox]").attr('checked', false);
	if ($("input[type=checkbox]").prop( "checked")) 
        $(this).attr("checked", false);
}

function Atualizar(id){
	alert(id);
}

$('#btnSearch').click(function(){
	$('#page-content').css('display','block');
});

function habilitar(){
	$('#teste').show();
}

$('#tipoPessoa').change(function(){
	$('#CPFCNPJ').val('');
	if($('#tipoPessoa').val() ==1){
		$('#CPFCNPJ').mask('999.999.999-99');
		$('#CPFCNPJ').focus();
	}
	if($('#tipoPessoa').val() == 2){
		$('#CPFCNPJ').mask('99.999.999/9999-99');
		$('#CPFCNPJ').focus();
	}
})
