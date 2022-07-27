package assignment.controllers;

import java.util.Optional;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
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
import assignment.repositories.AccountRepository;

@Controller
@RequestMapping(value = "/admin/accounts")
public class AccountController {
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping(value = "/create")
	public String getCreate(Model model,@ModelAttribute(name = "account") Accounts accounts) {
		model.addAttribute("view","/views/admin/accounts/create.jsp");
		return "/admin/template";
	}
	
	@PostMapping(value = "/store")
	public String postCreate(@Valid @ModelAttribute(name = "account") Accounts accounts ,BindingResult result,Model model) {
		if (result.hasErrors()) {
			model.addAttribute("view","/views/admin/accounts/create.jsp");
			return "/admin/template";
		}
		accounts.setPassword(bCryptPasswordEncoder.encode(accounts.getPassword()));
		accountRepository.save(accounts);
		return "redirect:/admin/accounts/index";
	}
	
	@GetMapping(value = "/index")
	public String getIndex(ModelMap model, @RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "10") int size) {
		model.addAttribute("data",accountRepository.findAll(PageRequest.of(page, size)));
		model.addAttribute("view","/views/admin/accounts/index.jsp");
		return "/admin/template";
	}
	
	@GetMapping(value = "/update/{id}")
	public String getUpdate(@PathVariable(name = "id") int id, ModelMap model) {
		model.addAttribute("account", accountRepository.findById(id).get());
		model.addAttribute("view","/views/admin/accounts/update.jsp");
		return "/admin/template";
	}

	@GetMapping(value = "/delete/{id}")
	public String delete(@PathVariable(name = "id") Accounts accounts) {
		accountRepository.delete(accounts);
		return "redirect:/admin/accounts/index";
	}
}
