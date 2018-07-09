package br.com.silen.caixa;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "caixa")
public class Caixa {
	
	@Id
	@GeneratedValue
	private long id;
	
	@Column(name = "nome")
	private String nome;
	
	@Column(name = "tamanho")
	private Integer tamanho;
	
	@Column(name = "peso")
	private Double peso;

	@Deprecated
	Caixa() {
	}
	
	public Caixa(long id, String nome, Integer tamanho, Double peso) {
		this.id = id;
		this.nome = nome;
		this.tamanho = tamanho;
		this.peso = peso;
	}

	public long getId() {
		return id;
	}
	
	public String getNome() {
		return nome;
	}

	public Integer getTamanho() {
		return tamanho;
	}

	public Double getPeso() {
		return peso;
	}

	public void setId(long id) {
		this.id = id;
	}
	
	public void setNome(String nome) {
		this.nome = nome;
	}

	public void setTamanho(Integer tamanho) {
		this.tamanho = tamanho;
	}

	public void setPeso(Double peso) {
		this.peso = peso;
	}

}
