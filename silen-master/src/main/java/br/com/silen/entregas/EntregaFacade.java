package br.com.silen.entregas;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

import br.com.silen.caixa.Caixa;
import br.com.silen.caixa.CaixaRepository;
import br.com.silen.clientes.Client;
import br.com.silen.clientes.ClientRepository;
import br.com.silen.motoboy.Motoboy;
import br.com.silen.motoboy.MotoboyRepository;

@Component
public class EntregaFacade {
	
	private static int MAX_BOX_SIZE = 40;
	
	@Autowired
	private EntregaRepository entregaRepository;
	
	@Autowired
	private ClientRepository clientRepository;
	
	@Autowired
	private CaixaRepository caixaRepository;
	
	@Autowired
	private MotoboyRepository motoboyRepository;
	
	@Value("${company.latitude}")
	private Double companyLatitude;
	
	@Value("${company.longitude}")
	private Double companyLongitude;
	
	public void create(EntregaDTO entregaDTO) {
		Client client = clientRepository.findById(entregaDTO.getClienteId()).get();		
		Caixa caixa = caixaRepository.findById(entregaDTO.getCaixaId()).get();
		
		Motoboy motoboy = findBestMotoboy(caixa, entregaDTO.getQuantidadeCaixa(), client);
		
		Entrega entrega = new Entrega(client, motoboy, caixa, entregaDTO.getQuantidadeCaixa());
		entregaRepository.save(entrega);
	}
	
	
	private Motoboy findBestMotoboy(Caixa caixa, Integer quantidadeCaixa, Client cliente) {
		Integer tamanhoNovaEntrega = quantidadeCaixa * caixa.getTamanho();
		
		List<Motoboy> motoboysWithSizeAvailable = findMotoboysWithAvailableSize(tamanhoNovaEntrega);
		
		double distanceFromCompany = calculateDistance(companyLatitude, companyLongitude, cliente.getLatitude(), cliente.getLongitude());
		
		Motoboy bestMotoboy = null;
		for (Motoboy motoboy : motoboysWithSizeAvailable) {
			List<Entrega> entregas = entregaRepository.findOpenEntregasByMotoboyId(motoboy.getId());
			
			for (Entrega entrega : entregas) {
				double distanceFromEntregaToNewEntrega = calculateDistance(entrega.getLatitude(), entrega.getLongitude(), cliente.getLatitude(), cliente.getLongitude());
				if(distanceFromEntregaToNewEntrega < distanceFromCompany) {
					bestMotoboy = entrega.getMotoboy();
				}
			}
			
			if(bestMotoboy == null && entregas.size() == 0) {
				bestMotoboy = motoboy;
			}
		}
		
		if(bestMotoboy == null && motoboysWithSizeAvailable.size() > 0) {
			bestMotoboy = motoboysWithSizeAvailable.get(0);
		}
		
		if(bestMotoboy == null) {
			throw new RuntimeException("Nenhum motoboy disponível");
		}
		
		return bestMotoboy;
	}

	private List<Motoboy> findMotoboysWithAvailableSize(Integer tamanhoNovaEntrega) {
		List<Motoboy> motoboys = motoboyRepository.findAvailableMotoboys();
		List<Motoboy> motoboysWithSizeAvailable = new ArrayList<>();
		
		for (Motoboy motoboy : motoboys) {
			List<Entrega> entregas = entregaRepository.findOpenEntregasByMotoboyId(motoboy.getId());
			
			int totalTamanho = 0;
			for (Entrega entrega : entregas) {
				totalTamanho += (entrega.getCaixa().getTamanho() * entrega.getQuantidadeCaixa());
			}
			
			if((totalTamanho + tamanhoNovaEntrega) <= MAX_BOX_SIZE) {
				motoboysWithSizeAvailable.add(motoboy);
			}
		}
		
		return motoboysWithSizeAvailable;
	}
	
	public static double calculateDistance(double startLatitude, double startLongitude, double finishLatitude, double finishLongitude) {
	    double earthRadius = 6371.0;

	    double dLat = Math.toRadians(finishLatitude - startLatitude);
	    double dLng = Math.toRadians(finishLongitude - startLongitude);

	    double sindLat = Math.sin(dLat / 2);
	    double sindLng = Math.sin(dLng / 2);

	    double a = Math.pow(sindLat, 2) + Math.pow(sindLng, 2) 
	    	* Math.cos(Math.toRadians(startLatitude)) * Math.cos(Math.toRadians(finishLatitude));

	    double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1-a));

	    return earthRadius * c;
	}
	 
}
