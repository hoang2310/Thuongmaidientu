package assignment.controllers;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.stream.Collectors;

import javax.mail.MessagingException;
import javax.servlet.http.HttpSession;
import javax.validation.constraints.NotNull;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import assignment.entities.Accounts;
import assignment.entities.OrderDetails;
import assignment.entities.Orders;
import assignment.repositories.MailerService;
import assignment.repositories.OrderRepository;

@Controller
@RequestMapping(value = "/orders")
public class UserOrderController {
	
	@Autowired
	private OrderRepository orderRepository;
	
//	@Autowired
//	private MailerService mailerService;
	
	@PostMapping(value = "/create")
	public String create(@ModelAttribute(name = "order") Orders orders,HttpSession session) throws MessagingException {
		orders.setAccount((@NotNull Accounts) session.getAttribute("User"));  //lấy acc 
		HashMap<Integer, OrderDetails> cart = (HashMap<Integer, OrderDetails>) session.getAttribute("cart");
//		List<OrderDetails> orderDetails = cart.values().stream().map(o ->{ //lấy cart.value từ hashmap list ordetails  
//			o.setOrder(orders);
//			o.setPrice(o.getProduct().getPrice());
//			return o;
//		}).collect(Collectors.toList());
		
		List<OrderDetails> orderDetails = new ArrayList<OrderDetails>(cart.values());
		for (OrderDetails o : orderDetails) {
			o.setOrder(orders);
			o.setPrice(o.getProduct().getPrice());
		}
		
		orders.setOrderDetails(orderDetails);
		orders.setCreateDate(new Date());
		orderRepository.save(orders);
		
//		mailerService.send(
//				"hoanghtph13294@fpt.edu.vn", 
//				"Thông báo đặt hàng Thành Công từ ASSIGNMENT3021", 
//				"<h3>Chúc mừng bạn đã đặt hàng thành công từ FPT Shop ASSSOF3021</h3> <br>"
//				+ "Xem chi tiết Order: "
//				+ "<a href='http://localhost:6901/myAcc/historyOrder/"+ orders.getAccount().getUsername() +"'>tại đây</a>" );
		
		//xóa các sản phẩm trong cart
		session.removeAttribute("cart");
		return "redirect:/orders/orderindex";
	}
	
	@GetMapping(value = "/orderindex")
	public String getPurchase(HttpSession session, Model model) {
		Accounts account = (Accounts) session.getAttribute("User");
		model.addAttribute("orders", orderRepository.findAllOrderByAccount(account));
		model.addAttribute("view", "/views/user/orderindex.jsp");
		return "/user/template";
	}
	
	@GetMapping(value = "/cancel/{id}")
	public String getCancel(@PathVariable(name = "id") int id, HttpSession session, Model model) {
		Accounts account = (Accounts) session.getAttribute("User");
		Orders order = orderRepository.findById(id).get();
		if (order.getAccount().getId() != account.getId()) {
			model.addAttribute("view", "/views/");
			return "/user/template";
		}
		orderRepository.save(order);
		return "redirect:/orders/orderindex";
	}
}
