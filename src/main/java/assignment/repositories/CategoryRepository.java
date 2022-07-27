package assignment.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import assignment.entities.Categories;

@Repository
public interface CategoryRepository extends JpaRepository<Categories, Integer>{

}
