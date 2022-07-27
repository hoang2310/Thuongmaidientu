package assignment.controllers;

import java.util.Date;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import assignment.entities.Accounts;
import assignment.entities.Products;
import assignment.repositories.CategoryRepository;
import assignment.repositories.ProductRepository;

@Controller
@RequestMapping(value = "/admin/products")
public class ProductController {
	
	@Autowired
	private ProductRepository productRepository;
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@GetMapping(value = "/create")
	public String getCreate(ModelMap model,@ModelAttribute(name = "product") Products products) {
		model.addAttribute("categories",categoryRepository.findAll());
		model.addAttribute("view","/views/admin/products/create.jsp");
		return "/admin/template";
	}
	
	@PostMapping(value = "/store")
	public String postCreate(@Valid @ModelAttribute(name = "product") Products products,BindingResult result,Model model) {
		if (result.hasErrors()) {
			model.addAttribute("view", "/views/admin/products/create.jsp");
			model.addAttribute("categories", categoryRepository.findAll());
			return "/admin/template";
		}
		products.setCreatedDate(new Date());
		productRepository.save(products);
		return "redirect:/admin/products/index";
	}
	
	@GetMapping(value = "/index")
	public String getIndex(ModelMap model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "10") int size) {
		model.addAttribute("data",productRepository.findAll(PageRequest.of(page, size)));
		model.addAttribute("view","/views/admin/products/index.jsp");
		return "/admin/template";
	}
	
	@GetMapping(value = "/update/{id}")
	public String getUpdate(@PathVariable(name = "id") int id, ModelMap model) {
		model.addAttribute("product", productRepository.findById(id).get());
		model.addAttribute("categories",categoryRepository.findAll());
		model.addAttribute("view","/views/admin/products/update.jsp");
		return "/admin/template";
	}

	@GetMapping(value = "/delete/{id}")
	public String delete(@PathVariable(name = "id") Products products) {
		productRepository.delete(products);
		return "redirect:/admin/products/index";
	}
}
