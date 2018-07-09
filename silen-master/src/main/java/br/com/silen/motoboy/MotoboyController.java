package br.com.silen.motoboy;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.composed.web.Get;
import org.springframework.composed.web.Post;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import br.com.silen.security.OnlyAdmin;
import br.com.silen.user.User;
import br.com.silen.user.UserRepository;

@Controller
public class MotoboyController {
	
	@Autowired
	private MotoboyRepository motoboyRepository;
	
	@Autowired
	private UserRepository userRepository;
	
	@Get("/motoboys")
	@OnlyAdmin
	public ModelAndView listMotoboys(){
		List<Motoboy> motoboys = motoboyRepository.findAll();
		
		ModelAndView modelAndView = new ModelAndView("motoboy/list");
		modelAndView.addObject("motoboys", motoboys);
		
		return modelAndView;
	}
	
	@Get("/motoboy/{id}")
	@OnlyAdmin
	public ModelAndView findMotoboyById(@PathVariable Long id) {
		Optional<Motoboy> motoboy = motoboyRepository.findById(id);
		
		ModelAndView modelAndView = new ModelAndView("motoboy/edit");
		if (!motoboy.isPresent()) {
			modelAndView.addObject("showMotoboyNotFound", true);
			return modelAndView;
		}
		
		List<User> users = userRepository.findAvailableMotoboys();
		users.add(motoboy.get().getUser());
		
		modelAndView.addObject("motoboy", motoboy.get());
		modelAndView.addObject("users", users);
		return modelAndView;
	}
	
	@Get("/motoboy")
	@OnlyAdmin
	public ModelAndView newMotoboy() {
		List<User> users = userRepository.findAvailableMotoboys();
		ModelAndView modelAndView = new ModelAndView("motoboy/edit");
		if(users.isEmpty()) {
			modelAndView.addObject("showMustCreateUserFirst", true);
		}
		
		modelAndView.addObject("users", users);
		return modelAndView;
	}
	
	@Post("/motoboys")
	@OnlyAdmin
	public ModelAndView updateMotoboy(@ModelAttribute MotoboyDTO motoboyDTO){
		Optional<User> user = userRepository.findById(motoboyDTO.getUserId());
		
		Motoboy motoboy = new Motoboy(motoboyDTO.getId(), motoboyDTO.getNome(), user.get());
		motoboy.setNome(motoboyDTO.getNome());
		motoboy.setUser(user.get());
		motoboyRepository.save(motoboy);
		
		return new ModelAndView("redirect:/motoboys");
	}
	
	@Get("/motoboy/{id}/excluir")
	@OnlyAdmin
	public ModelAndView deleteClientById(@PathVariable Long id) {
		Optional<Motoboy> motoboy = motoboyRepository.findById(id);
		
		if (motoboy.isPresent()) {
			motoboyRepository.delete(motoboy.get());
		}
		return new ModelAndView("redirect:/motoboys");
	}
	
}	
