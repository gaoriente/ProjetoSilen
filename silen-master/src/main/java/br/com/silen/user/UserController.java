package br.com.silen.user;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.composed.web.Get;
import org.springframework.composed.web.Post;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.silen.motoboy.Motoboy;
import br.com.silen.motoboy.MotoboyRepository;
import br.com.silen.security.OnlyAdmin;

@Controller
public class UserController {
	
	@Autowired
	private MotoboyRepository motoboyRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Get("/usuarios")
	@OnlyAdmin
	public ModelAndView listUsers(){
		List<User> users = userRepository.findAll();
		
		ModelAndView modelAndView = new ModelAndView("user/list");
		modelAndView.addObject("users", users);
		
		return modelAndView;
	}
	
	@Get("/usuario/{id}")
	@OnlyAdmin
	public ModelAndView findUserById(@PathVariable Long id) {
		Optional<User> user = userRepository.findById(id);
		
		ModelAndView modelAndView = new ModelAndView("user/edit");
		if (!user.isPresent()) {
			modelAndView.addObject("showUserNotFound", true);
			return modelAndView;
		}
		
		modelAndView.addObject("user", user.get());
		
		return modelAndView;
	}
	
	@Get("/usuario")
	@OnlyAdmin
	public ModelAndView newUser() {
		ModelAndView modelAndView = new ModelAndView("user/edit");
		modelAndView.addObject("userTypes", UserType.values());
		return modelAndView;
	}
	
	@Post("/usuarios")
	@OnlyAdmin
	public ModelAndView updateUser(@ModelAttribute User user){
		Optional<User> optionalUser = userRepository.findByUsername(user.getUsername());
		if(optionalUser.isPresent() && optionalUser.get().getId() != user.getId()) {
			ModelAndView modelAndView = new ModelAndView("user/edit");
			modelAndView.addObject("user", user);
			modelAndView.addObject("showUserNameAlreadyExists", true);
			modelAndView.addObject("userTypes", UserType.values());
			return modelAndView;
		}
		userRepository.save(user);
		return new ModelAndView("redirect:/usuarios");
	}
	
	@Get("/usuario/{id}/excluir")
	@OnlyAdmin
	public ModelAndView deleteUserById(@PathVariable Long id, RedirectAttributes redirectAttributes) {
		Optional<User> user = userRepository.findById(id);
		
		if (user.isPresent()) {
			Optional<Motoboy> motoboy = motoboyRepository.findByUser(user.get());
			if(motoboy.isPresent()){
				ModelAndView modelAndView = new ModelAndView("redirect:/usuarios");
				redirectAttributes.addFlashAttribute("showCannotDeleteUser", true);
				return modelAndView;
			}
			userRepository.delete(user.get());
		}
		return new ModelAndView("redirect:/usuarios");
	}
}
