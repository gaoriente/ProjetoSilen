package br.com.silen.motoboy;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.RepositoryDefinition;

import br.com.silen.user.User;

@RepositoryDefinition(domainClass = Motoboy.class, idClass = Long.class)
public interface MotoboyRepository {
	
	List<Motoboy> findAll();
	
	Optional<Motoboy> findById(Long id);
	
	void save(Motoboy motoboy);

	void delete(Motoboy motoboy);

	Optional<Motoboy> findByUser(User user);

	@Query(value = "select m.* from motoboy m " +
					" where (select count(1) from entrega e where e.motoboy_id = m.id and e.status = 'INICIADA') = 0 " +
					" order by (select count(1) from entrega e where e.motoboy_id = m.id and e.status = 'ABERTA') DESC", nativeQuery = true)
	List<Motoboy> findAvailableMotoboys();
	
}
