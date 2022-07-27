package assignment.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/user")
public class HomeController {
	@GetMapping
	public String home() {
		return "/user/home";
	}
}
