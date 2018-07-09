package br.com.silen.model;

public class Cliente2 {
	
	private int idCliente;
	private String nomeCliente;
	private String CPFCNPJ;
	private int tipoPessoa;
	private String telCelular;
	private String telFixo;
	private String telRecado;
	private String email;
	private String enderecoCliente;
	private String numeroCliente;
	private String complementoCliente;
	private String bairroCliente;
	private String cidadeCliente;
	private String estadoCliente;
	private String cepCliente;
	private int idTipoContrato;

	
	public Cliente2(int idCliente, String nomeCliente, String CPFCNPJ, int tipoPessoa, String telCelular, String telFixo, String telRecado, String email, String enderecoCliente, String numeroCliente, String complementoCliente, String bairroCliente, String cidadeCliente, String estadoCliente, String cepCliente, int idTipoContrato, int usuarioCriacao, String dataCriacao, int usuarioModificacao, String dataModificacao){
		setIdCliente( idCliente);
		setNomeCliente( nomeCliente);
		setCPFCNPJ( CPFCNPJ);
		setTipoPessoa( tipoPessoa);
		setTelCelular(telCelular);
		setTelFixo(telFixo);
		setTelRecado(telRecado);
		setEmail(email);
		setEnderecoCliente( enderecoCliente);
		setNumeroCliente(numeroCliente);
		setComplementoCliente( complementoCliente);
		setBairroCliente( bairroCliente);
		setCidadeCliente( cidadeCliente);
		setEstadoCliente( estadoCliente);
		setCepCliente( cepCliente);
		setIdTipoContrato( idTipoContrato);
	}
	
	public Cliente2() {

	}

	public int getIdCliente() {
		return idCliente;
	}
	public void setIdCliente(int idCliente) {
		this.idCliente = idCliente;
	}
	public String getNomeCliente() {
		return nomeCliente;
	}
	public void setNomeCliente(String nomeCliente) {
		this.nomeCliente = nomeCliente;
	}
	public String getCPFCNPJ() {
		return CPFCNPJ;
	}
	public void setCPFCNPJ(String cPFCNPJ) {
		CPFCNPJ = cPFCNPJ;
	}
	public int getTipoPessoa() {
		return tipoPessoa;
	}
	public void setTipoPessoa(int tipoPessoa) {
		this.tipoPessoa = tipoPessoa;
	}
	public String getTelCelular() {
		return telCelular;
	}
	public void setTelCelular(String telCelular) {
		this.telCelular = telCelular;
	}
	public String getTelFixo() {
		return telFixo;
	}
	public void setTelFixo(String telFixo) {
		this.telFixo = telFixo;
	}
	public String getTelRecado() {
		return telRecado;
	}
	public void setTelRecado(String telRecado) {
		this.telRecado = telRecado;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getEnderecoCliente() {
		return enderecoCliente;
	}
	public void setEnderecoCliente(String enderecoCliente) {
		this.enderecoCliente = enderecoCliente;
	}
	public String getNumeroCliente() {
		return numeroCliente;
	}
	public void setNumeroCliente(String numeroCliente) {
		this.numeroCliente = numeroCliente;
	}
	public String getComplementoCliente() {
		return complementoCliente;
	}
	public void setComplementoCliente(String complementoCliente) {
		this.complementoCliente = complementoCliente;
	}
	public String getBairroCliente() {
		return bairroCliente;
	}
	public void setBairroCliente(String bairroCliente) {
		this.bairroCliente = bairroCliente;
	}
	public String getCidadeCliente() {
		return cidadeCliente;
	}
	public void setCidadeCliente(String cidadeCliente) {
		this.cidadeCliente = cidadeCliente;
	}
	public String getEstadoCliente() {
		return estadoCliente;
	}
	public void setEstadoCliente(String estadoCliente) {
		this.estadoCliente = estadoCliente;
	}
	public String getCepCliente() {
		return cepCliente;
	}
	public void setCepCliente(String cepCliente) {
		this.cepCliente = cepCliente;
	}
	public int getIdTipoContrato() {
		return idTipoContrato;
	}
	public void setIdTipoContrato(int idTipoContrato) {
		this.idTipoContrato = idTipoContrato;
	}
	
}