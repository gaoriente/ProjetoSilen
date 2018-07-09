package br.com.silen.user;

import java.util.List;
import java.util.Optional;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.RepositoryDefinition;

@RepositoryDefinition(domainClass = User.class, idClass = Long.class)
public interface UserRepository {
	
	Optional<User> findByUsernameAndPassword(String username, String password);

	Optional<User> findById(Long userId);
	
	@Query(value = "select u.* from user u left join motoboy b on b.user_id = u.id where b.id is null and u.type = 'MOTOBOY'", nativeQuery = true)
	List<User> findAvailableMotoboys();

	List<User> findAll();

	void save(User user);

	void delete(User user);

	Optional<User> findByUsername(String username);
	
}
