package br.com.silen.app;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.composed.web.Get;
import org.springframework.composed.web.Post;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import br.com.silen.login.UserNotFoundException;
import br.com.silen.security.App;
import br.com.silen.user.User;
import br.com.silen.user.UserRepository;

@App
@RestController
public class LoginAppController {
	
	@Autowired
	private UserRepository userRepository;
	
	@App
	@Post("/app/login")
	public UserAppDTO login(@RequestBody UserAppDTO userAppDTO) {
		User user = userRepository.findByUsername(userAppDTO.getLogin()).orElseThrow(UserNotFoundException::new);
		if(!user.getPassword().equals(userAppDTO.getPassword())) {
			throw new UserNotFoundException();
		}
		
		userAppDTO.setUserId(user.getId());
		return userAppDTO;
	}
	
}
