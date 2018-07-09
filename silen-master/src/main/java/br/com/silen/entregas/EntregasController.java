package br.com.silen.entregas;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.composed.web.Get;
import org.springframework.composed.web.Post;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;

import br.com.silen.caixa.Caixa;
import br.com.silen.caixa.CaixaRepository;
import br.com.silen.clientes.Client;
import br.com.silen.clientes.ClientRepository;
import br.com.silen.motoboy.MotoboyRepository;
import br.com.silen.security.LoggedUserService;
import br.com.silen.security.OnlyAdmin;

@Controller
public class EntregasController {
	
	@Autowired
	private EntregaRepository entregaRepository;
	@Autowired
	private ClientRepository clientRepository;
	@Autowired
	private CaixaRepository caixaRepository;
	@Autowired
	private MotoboyRepository motoboyRepository;
	@Autowired
	private LoggedUserService loggedUserService;
	@Autowired
	private EntregaFacade entregaFacade;
	
	@Value("${company.latitude}")
	private Double companyLatitude;
	@Value("${company.longitude}")
	private Double companyLongitude;
	
	@Get("/entregas")
	@OnlyAdmin
	public ModelAndView listClients(){
		List<Entrega> entregas = entregaRepository.findAll();
		
		ModelAndView modelAndView = new ModelAndView("entrega/list");
		modelAndView.addObject("entregas", entregas);
		
		return modelAndView;
	}
	
	@Get("/entrega/{id}")
	@OnlyAdmin
	public ModelAndView findEntregaById(@PathVariable Long id) {
		List<Client> clientes = clientRepository.findAll();
		List<Caixa> caixas = caixaRepository.findAll();
		Optional<Entrega> entrega = entregaRepository.findById(id);
		
		ModelAndView modelAndView = new ModelAndView("entrega/edit");
		if (!entrega.isPresent()) {
			modelAndView.addObject("showEntregaNotFound", true);
			return modelAndView;
		}
		
		modelAndView.addObject("clientes", clientes);
		modelAndView.addObject("caixas", caixas);
		modelAndView.addObject("entrega", entrega.get());
		return modelAndView;
	}
	

	@OnlyAdmin
	@Get("/entrega")
	public ModelAndView newEntrega() {
		List<Client> clients = clientRepository.findAll();
		List<Caixa> caixas = caixaRepository.findAll();
		ModelAndView modelAndView = new ModelAndView("entrega/new");
		
		if(motoboyRepository.findAvailableMotoboys().size() <= 0) {
			modelAndView.addObject("showNoMotoboyAvailable", true);
			return modelAndView;
		} 
		
		modelAndView.addObject("clientes", clients);
		modelAndView.addObject("caixas", caixas);
		 
		return modelAndView;
	}
	
	@Get("/entregas/motoboy")
	public ModelAndView getEntregas() {
		Long userId = loggedUserService.getLoggedUser().get().getId();		
		List<Entrega> entregas = entregaRepository.findAllByMotoboyUserId(userId);
		
		ModelAndView modelAndView = new ModelAndView("motoboy/entregas");
		modelAndView.addObject("entregas", entregas);
		
		return modelAndView;
	}
	
	@Get("/entrega/{id}/start")
	public ModelAndView startEntrega(@PathVariable Long id) {
		Entrega entrega = entregaRepository.findById(id).get();
		
		entrega.markAsStarted();
		entregaRepository.save(entrega);
			
		return new ModelAndView("redirect:/entregas/motoboy");
	}
	
	@Get("/entrega/{id}/finish")
	public ModelAndView finishEntrega(@PathVariable Long id) {
		Entrega entrega = entregaRepository.findById(id).get();
		
		entrega.markAsFinished();
		entregaRepository.save(entrega);
			
		return new ModelAndView("redirect:/entregas/motoboy");
	}
	
	@Get("/entrega/{entregaId}/mapa")
	public ModelAndView getEntregaMap(@PathVariable Long entregaId) {
		Entrega entrega = entregaRepository.findById(entregaId).get();
		
		ModelAndView modelAndView = new ModelAndView("entrega/map");
		modelAndView.addObject("entrega", entrega);
		modelAndView.addObject("companyInfo", new CompanyInfo(companyLatitude, companyLongitude));
		
		return modelAndView;
	}
	
	@OnlyAdmin
	@Post("/entregas")
	public ModelAndView createEntrega(@ModelAttribute EntregaDTO entregaDTO){
		try {
			entregaFacade.create(entregaDTO);
		} catch(Exception e) {
			ModelAndView modelAndView = new ModelAndView("entrega/new");
			modelAndView.addObject("showNoMotoboyAvailable", true);
			return modelAndView;
		}
		
		return new ModelAndView("redirect:/entregas");
	}
	
	@OnlyAdmin
	@Get("entrega/{entregaId}/excluir")
	public ModelAndView deleteEntrega(@PathVariable Long entregaId) {
		entregaRepository.deleteById(entregaId);
		return new ModelAndView("redirect:/entregas");
	}
}
