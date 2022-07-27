package assignment.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import assignment.repositories.CategoryRepository;
import assignment.repositories.ProductRepository;

@Controller
public class UserProductController {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@GetMapping(value = "/collections")
	public String getCate(Model model) {
		
		return "user/template";
	}
	
	
}
