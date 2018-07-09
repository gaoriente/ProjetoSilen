package br.com.silen.app;

public class UserAppDTO {
	
	private Long userId;
	private String login;
	private String password;
	
	public UserAppDTO(){}
	
	public UserAppDTO(String login, String password) {
		this.login = login;
		this.password = password;
	}
	
	public Long getUserId() {
		return userId;
	}
	
	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getLogin() {
		return login;
	}

	public String getPassword() {
		return password;
	}

	public void setLogin(String login) {
		this.login = login;
	}

	public void setPassword(String password) {
		this.password = password;
	}

}
