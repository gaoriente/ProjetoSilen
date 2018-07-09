package br.com.silen.security;

import java.util.Date;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import br.com.silen.user.User;
import br.com.silen.user.UserRepository;
import io.jsonwebtoken.JwtException;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.SignatureAlgorithm;

@Component
class TokenHandler {
	
	private static final String SECRET = "silen";
	@Autowired
	private UserRepository userRepository;

	public String createTokenFor(User user, Date expirationDate){
		return Jwts.builder().setSubject(user.getUsername())
							 .signWith(SignatureAlgorithm.HS256, SECRET)
							 .setExpiration(expirationDate)
							 .compact();
	}

	public Optional<User> parseUserFromToken(String jwtToken) {
		String username = "";
		try {
			username = Jwts.parser().setSigningKey(SECRET)
								 .parseClaimsJws(jwtToken)
								 .getBody()
								 .getSubject();
		} catch (JwtException | IllegalArgumentException e) {
			return Optional.empty();
		}

		return userRepository.findByUsername(username);
	}
}
