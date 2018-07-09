package br.com.silen.app;

import java.util.LinkedHashSet;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.composed.web.Get;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import br.com.silen.entregas.Entrega;
import br.com.silen.entregas.EntregaFacade;
import br.com.silen.entregas.EntregaRepository;
import br.com.silen.security.App;

@RestController
public class MotoboyAppController {
		
	@Autowired
	private EntregaRepository entregaRepository;
	
	@Value("${company.latitude}")
	private Double companyLatitude;
	
	@Value("${company.longitude}")
	private Double companyLongitude;
	
	@App
	@Get("/app/minhas-entregas/{userId}")
	public LinkedHashSet<Entrega> getEntregas(@PathVariable Long userId) {
		List<Entrega> entregas = entregaRepository.findAllByMotoboyUserId(userId);
		LinkedHashSet<Entrega> entregasOrdenadas = new LinkedHashSet<>();
		
		if(entregas.isEmpty()) {
			return entregasOrdenadas;
		}
		
		do {
			Entrega entrega = findNearstEntrega(companyLatitude, companyLongitude, entregas);
			entregasOrdenadas.add(entrega);
			
			entregas.remove(entregas.indexOf(entrega));
		} while(!entregas.isEmpty());
		
		return entregasOrdenadas;
	}
	
	private Entrega findNearstEntrega(double latitudeStart, double longitudeStart, List<Entrega> entregas) {
		Entrega nearstEntrega = null;
		Double bestDistance = null;
		
		for (Entrega entrega : entregas) {
			double distance = EntregaFacade.calculateDistance(latitudeStart, longitudeStart, entrega.getLatitude(), entrega.getLongitude());
			if(bestDistance == null || distance < bestDistance) {
				nearstEntrega = entrega;
				bestDistance = distance;
			}
		}
		return nearstEntrega;
	}
		
	@App
	@Get("/app/entrega/{id}/start")
	public void startEntrega(@PathVariable Long id) {
		Entrega entrega = entregaRepository.findById(id).get();
		
		entrega.markAsStarted();
		entregaRepository.save(entrega);			
	}
	
	@App
	@Get("/app/entrega/{id}/finish")
	public void finishEntrega(@PathVariable Long id) {
		Entrega entrega = entregaRepository.findById(id).get();
		
		entrega.markAsFinished();
		entregaRepository.save(entrega);
	}
}
