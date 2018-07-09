package br.com.silen.entregas;

public class EntregaDTO {

	private Long clienteId;
	private Long caixaId;
	private Integer quantidadeCaixa;

	public Long getClienteId() {
		return clienteId;
	}

	public Long getCaixaId() {
		return caixaId;
	}

	public Integer getQuantidadeCaixa() {
		return quantidadeCaixa;
	}

	public void setClienteId(Long clienteId) {
		this.clienteId = clienteId;
	}

	public void setCaixaId(Long caixaId) {
		this.caixaId = caixaId;
	}

	public void setQuantidadeCaixa(Integer quantidadeCaixa) {
		this.quantidadeCaixa = quantidadeCaixa;
	}

}
