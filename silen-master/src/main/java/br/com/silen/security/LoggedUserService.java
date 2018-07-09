package br.com.silen.security;

import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import br.com.silen.user.User;

@Service
public class LoggedUserService {
	
	public static final String TOKEN_COOKIE_NAME = "token";
	
	@Autowired
	private TokenAuthenticationService tokenService;
	
	@Autowired
	private HttpServletRequest request;
	
	public Optional<User> getLoggedUser() {		
		String token = getTokenFromCookie(request);
		
		return tokenService.getUserFromToken(token);
	}
	
	private String getTokenFromCookie(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if(TOKEN_COOKIE_NAME.equals(cookie.getName())) {
				return cookie.getValue();
			}
		}
		return "";
	}
	
}
