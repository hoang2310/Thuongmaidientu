package assignment.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import assignment.repositories.CategoryRepository;
import assignment.repositories.ProductRepository;

@Controller
public class UserHomeController {
	@Autowired
	public ProductRepository productRepository;
	
	@Autowired
	public CategoryRepository categoryRepository;
	
	@GetMapping()
	public String getIndex(ModelMap model) {
		model.addAttribute("data",productRepository.findAll(PageRequest.of(0, 8,Sort.by("createdDate").ascending())));
		model.addAttribute("cate",categoryRepository.findAll());
		model.addAttribute("view","/views/user/home.jsp");
		return "/user/template";
	}
}
