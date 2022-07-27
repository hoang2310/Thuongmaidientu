package assignment.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import assignment.entities.Accounts;

@Repository
public interface AccountRepository extends JpaRepository<Accounts, Integer>{
	
//	Optional<Accounts> findByUsername(String username);
	
	@Query("SELECT acc FROM Accounts acc WHERE username = ?1 AND password = ?2")
	Accounts findByUsernameAndPassword(String username, String password);
	
	Accounts findByUsername(String username);
	
}
