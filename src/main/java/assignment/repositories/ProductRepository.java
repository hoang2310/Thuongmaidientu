package assignment.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import assignment.entities.Products;

@Repository
public interface ProductRepository extends JpaRepository<Products, Integer>{

}
