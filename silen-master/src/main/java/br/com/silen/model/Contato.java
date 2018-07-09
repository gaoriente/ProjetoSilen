package br.com.silen.model;

public class Contato {
	
	private String nomeContato;
	private String emailContato;
	private String comentario;

	
	public Contato(String nomeContato, String emailContato, String comentario){
		setNomeContato(nomeContato);
		setEmailContato(emailContato);
		setComentario(comentario);
	}
	
	public Contato() {

	}

	
	public String getNomeContato() {
		return nomeContato;
	}
	public void setNomeContato(String nomeContato) {
		this.nomeContato = nomeContato;
	}
	public String getEmailContato() {
		return emailContato;
	}
	public void setEmailContato(String emailContato) {
		this.emailContato = emailContato;
	}
	public String getComentario() {
		return comentario;
	}
	public void setComentario(String comentario) {
		this.comentario = comentario;
	}
	
	
}