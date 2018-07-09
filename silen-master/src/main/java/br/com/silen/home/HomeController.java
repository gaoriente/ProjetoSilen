package br.com.silen.home;

import org.springframework.composed.web.Get;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {
	
	@Get("/home")
	public ModelAndView home(){
		ModelAndView modelAndView = new ModelAndView("main/home");
		return modelAndView;
	}
}
