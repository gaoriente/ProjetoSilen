package br.com.silen.security;

import java.util.Calendar;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.silen.user.User;

@Service
public class TokenAuthenticationService {
	
	private final static int ONE_DAY_IN_MINUTES_EXPIRATION_TIME = 60*24;

	private TokenHandler tokenHandler;
	
	@Autowired
	public TokenAuthenticationService(TokenHandler tokenHandler) {
		this.tokenHandler = tokenHandler;
	}

	public void createTokenFor(User user){
		Calendar expirationDate = Calendar.getInstance();
		expirationDate.add(Calendar.MINUTE, ONE_DAY_IN_MINUTES_EXPIRATION_TIME);
		String token = tokenHandler.createTokenFor(user, expirationDate.getTime());
		user.setToken(token);
	}
	
	public Optional<User> getUserFromToken(String token) {
		return tokenHandler.parseUserFromToken(token);
	}
	
}
