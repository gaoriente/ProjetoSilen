package br.com.silen.motoboy;

import javax.persistence.Column;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

import br.com.silen.user.User;

public class MotoboyDTO {
	private Long id;
	private Long userId;
	private String nome;

	public Long getId() {
		return id;
	}

	public Long getUserId() {
		return userId;
	}

	public String getNome() {
		return nome;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
