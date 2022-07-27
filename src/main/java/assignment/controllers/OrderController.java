package assignment.controllers;

import java.util.Date;

import javax.persistence.criteria.Order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import assignment.entities.OrderDetails;
import assignment.entities.Orders;
import assignment.repositories.OrderRepository;
import assignment.repositories.ProductRepository;

@Controller
@RequestMapping(value = "/admin/orders")
public class OrderController {
	@Autowired
	private ProductRepository productRepository;

	@Autowired
	private OrderRepository orderRepository;
	
	@GetMapping(value = "/index")
	public String getIndex(@RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "10") int size, Model model) {
		model.addAttribute("data", orderRepository.findAllOrderReport(PageRequest.of(page, size)));
		model.addAttribute("view", "/views/admin/orders/index.jsp");
		return "/admin/template";
	}

	@GetMapping(value = "/index/pending")
	public String getPending(@RequestParam(name = "page", defaultValue = "0") int page,
			@RequestParam(name = "size", defaultValue = "10") int size, Model model) {
		model.addAttribute("data", orderRepository.findAllOrderReport(PageRequest.of(page, size)));
		model.addAttribute("view", "/views/admin/orders/index.jsp");
		return "/admin/template";
	}

	@GetMapping(value = "/create")
	public String getCreateForm(@ModelAttribute(name = "order") Order order, Model model) {
		model.addAttribute("view", "/views/admin/orders/create.jsp");
		return "/admin/template";
	}

	@GetMapping(value = "/{id}")
	public String getOrderById(@PathVariable(name = "id") int id, Model model) {
		model.addAttribute("order", orderRepository.findById(id).get());
		model.addAttribute("view", "/views/admin/orders/indexdetail.jsp");
		return "/admin/template";
	}

	@ResponseBody
	@GetMapping(value = "/add-to-cart/{id}")
	public ResponseEntity<?> addToCart(@PathVariable(name = "id") int id) {
		OrderDetails orderDetail = new OrderDetails();
		orderDetail.setProduct(productRepository.findById(id).get());
		orderDetail.setQuantity(1);
		orderDetail.setPrice(orderDetail.getProduct().getPrice());
		return ResponseEntity.ok(orderDetail);
	}

	@ResponseBody
	@PostMapping(value = "/create")
	public ResponseEntity<?> store(@RequestBody Orders orders) {
		orders.getOrderDetails().forEach(orderDetail -> {
			orderDetail.setPrice(orderDetail.getProduct().getPrice());
			orderDetail.setOrder(orders);
		});
		orders.setCreateDate(new Date());
		orderRepository.save(orders);
		return ResponseEntity.noContent().build();
	}

	@GetMapping(value = "/delete/{id}")
	public String getDelete(@PathVariable(name = "id") Orders orders) {
		orderRepository.delete(orders);
		return "redirect:/admin/orders/index";
	}

}
