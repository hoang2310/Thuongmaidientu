package assignment.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import assignment.entities.OrderDetails;
import assignment.repositories.OrderDetailRepository;

@Controller
@RequestMapping(value = "/admin/orderdetails")
public class OrderDetailController {

	@Autowired
	private OrderDetailRepository orderDetailRepository;
	
	@GetMapping(value = "/update/{id}")
	public String getUpdateForm(@PathVariable(name = "id") int id, Model model) {
		model.addAttribute("orderDetail", orderDetailRepository.findById(id).get());
		model.addAttribute("view", "/views/admin/orderdetails/update.jsp");
		return "/admin/template";
	}

	@PostMapping(value = "/update")
	public String postUpdate(@ModelAttribute(name = "orderDetail") OrderDetails orderDetail, Model model) {
		OrderDetails od = orderDetailRepository.findById(orderDetail.getId()).get();
		od.setQuantity(orderDetail.getQuantity());
		orderDetailRepository.save(od);
		return "redirect:/admin/orders/" + od.getOrder().getId();
	}

	@GetMapping(value = "/delete/{id}")
	public String getDelete(@PathVariable(name = "id") OrderDetails od, @RequestParam(name = "o") int oid) {
		orderDetailRepository.delete(od);
		return "redirect:/admin/orders/" + oid;
	}
}
