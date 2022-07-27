package assignment.controllers;

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

import assignment.entities.Categories;
import assignment.repositories.CategoryRepository;

@Controller
@RequestMapping(value = "/admin/categories")
public class CategoryController {
	
	@Autowired
	private CategoryRepository categoryRepository;
	
	@GetMapping(value = "/create")
	public String getCreate(Model model ,@ModelAttribute(name = "category") Categories categories) {
		model.addAttribute("view","/views/admin/categories/create.jsp");
		return "/admin/template";
	}
	
	@PostMapping(value = "/store")
	public String postCreate(@Valid @ModelAttribute(name = "category") Categories categories, BindingResult bindingResult,
			Model model) {
		if (bindingResult.hasErrors()) {
			model.addAttribute("view", "/views/admin/categories/create.jsp");
			return "/admin/template";
		}
		categoryRepository.save(categories);
		return "redirect:/admin/categories/index";
	}
	
	@GetMapping(value = "/index")
	public String getIndex(ModelMap model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "10") int size) {
		model.addAttribute("data",categoryRepository.findAll(PageRequest.of(page, size)));
		model.addAttribute("view","/views/admin/categories/index.jsp");
		return "/admin/template";
	}
	
	@GetMapping(value = "/update/{id}")
	public String getUpdate(@PathVariable(name = "id") int id, ModelMap model) {
		model.addAttribute("category", categoryRepository.findById(id).get());
		model.addAttribute("view","/views/admin/categories/update.jsp");
		return "/admin/template";
	}

	@GetMapping(value = "/delete/{id}")
	public String delete(@PathVariable(name = "id") Categories category) {
		categoryRepository.delete(category);
		return "redirect:/admin/categories/index";
	}
}
