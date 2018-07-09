package br.com.silen.motoboy;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;

import br.com.silen.user.User;

@Entity
@Table(name = "motoboy")
public class Motoboy {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Column(name = "nome")
	private String nome;
	
	public Motoboy(Long id, String nome, User user) {
		this.id = id;
		this.nome = nome;
		this.user = user;
	}
	
	@Deprecated // Hibernate eyes only
	Motoboy() {
	}
	
	public Long getId() {
		return id;
	}

	public User getUser() {
		return user;
	}

	public String getNome() {
		return nome;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

}
