package assignment.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/admin")
public class MainController {
	@GetMapping
	public String home() {
		return "/admin/template";
	}
}
