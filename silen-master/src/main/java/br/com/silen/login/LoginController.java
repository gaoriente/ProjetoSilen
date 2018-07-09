package br.com.silen.login;

import static br.com.silen.security.LoggedUserService.TOKEN_COOKIE_NAME;

import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.composed.web.Get;
import org.springframework.composed.web.Post;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.silen.security.TokenAuthenticationService;
import br.com.silen.user.User;
import br.com.silen.user.UserRepository;

@Controller
public class LoginController {
	
	@Autowired
	private UserRepository userRepository;
	@Autowired
	private TokenAuthenticationService tokenService;
	
	@Get("/")
	public String index() {
		return "login/index";
	}
	
	@Get("/logout")
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) {
		Cookie[] cookies = request.getCookies();
		for (Cookie cookie : cookies) {
			if(TOKEN_COOKIE_NAME.equals(cookie.getName())) {
				cookie.setMaxAge(0);
				cookie.setPath("/");
				response.addCookie(cookie);
				break;
			}
		}
		
		return new ModelAndView("redirect:/");
	}
	
	@Post("/login")
	public ModelAndView login(@RequestParam String username, @RequestParam String password,
			RedirectAttributes redirectAttributes, HttpServletResponse response) {
		
		Optional<User> user = userRepository.findByUsernameAndPassword(username, password);
		
		if (!user.isPresent()) {
			redirectAttributes.addFlashAttribute("showInvalidLoginMessage", true);
			return new ModelAndView("redirect:/");
		}
		
		createTokenCookie(response, user);
		return new ModelAndView("redirect:/home");
	}

	private void createTokenCookie(HttpServletResponse response, Optional<User> user) {
		tokenService.createTokenFor(user.get());
		Cookie cookie = new Cookie(TOKEN_COOKIE_NAME, user.get().getToken());
		response.addCookie(cookie);
	}

}
