package br.com.silen.clientes;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.RepositoryDefinition;

@RepositoryDefinition(domainClass = Client.class, idClass = Long.class)
public interface ClientRepository {
	
	List<Client> findAll();

	Optional<Client> findById(Long id);

	void save(Client client);

	void delete(Client client);
}
