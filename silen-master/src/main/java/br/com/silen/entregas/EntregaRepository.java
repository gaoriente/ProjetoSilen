package br.com.silen.entregas;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.RepositoryDefinition;
import org.springframework.data.repository.query.Param;


@RepositoryDefinition(domainClass = Entrega.class, idClass = Long.class)
public interface EntregaRepository {

	List<Entrega> findAll();

	Optional<Entrega> findById(Long id);

	Entrega save(Entrega entrega);

	List<Entrega> findAllByMotoboyUserId(Long userId);
	
	@Query(value = "select e.* from entrega e where e.status = 'ABERTA' and e.motoboy_id = :motoboyId", nativeQuery = true)
	List<Entrega> findOpenEntregasByMotoboyId(@Param("motoboyId") Long motoboyId);
	
	@Query(value = "select e.* from entrega e where e.`motoboy_id` in (:motoboyIds) and e.status = 'ABERTA'", nativeQuery = true)
	List<Entrega> findAllByMotoboyIds(@Param("motoboyIds") List<Long> motoboyIds);
	
	@Modifying
	@Transactional
	@Query(value = "delete from entrega where id = :entregaId", nativeQuery = true)
	void deleteById(@Param("entregaId") Long entregaId);	
}
