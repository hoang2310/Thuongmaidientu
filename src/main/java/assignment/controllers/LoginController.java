package assignment.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import assignment.controllers.service.MailerServiceImpl;
import assignment.controllers.service.SessionService;
import assignment.entities.Accounts;
import assignment.repositories.AccountRepository;

@Controller
public class LoginController {
	@Autowired
	SessionService session;
	
	@Autowired
	private AccountRepository accountRepository;
	
	@Autowired
	JavaMailSender sender;
	
	@Autowired
	MailerServiceImpl mailer;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;
	
	@GetMapping(value = "/login")
	public String getFormLogin(
			Model model
			) {
		model.addAttribute("TitlePage", "Đăng Nhập");
		model.addAttribute("views", "/views/signin.jsp");
		session.remove("User");
		return "/login";
	}
	
	@PostMapping(value = "/login")
	public String login(
			HttpSession sess,
			@ModelAttribute("acc") Accounts account,
			@RequestParam("username") String un,
			@RequestParam("password") String pw, 
			BindingResult result
			) {
		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			sess.setAttribute("errors", errors);
			return "redirect:/login";
		}else {
			account = accountRepository.findByUsernameAndPassword(un, pw);

			if(account != null) {
				if(account.getActivated()==0) {
					session.set("User", account);
					if(account.getAdmin()==1) {
						sess.setAttribute("errorMessage", "");
						return "redirect:/admin";
					}else {
						sess.setAttribute("errorMessage", "");
						return "redirect:/";
					}
				}else {
					sess.setAttribute("errorMessage", "Bạn không được đăng nhập với tài khoản này!");
					return "redirect:/login";
				}	
			}else {				
						
				if(un.length()==0 || pw.length()==0) {
					sess.setAttribute("errorMessage", "Bạn vui lòng nhập tài khoản và mật khẩu!");						
				}
				else {
					System.out.println(un);
					System.out.println(pw);
					sess.setAttribute("errorMessage", "Tài khoản hoặc mật khẩu nhập không đúng!");	
				}
				return "redirect:/login";
			}
		}
	}

	@GetMapping(value = "/signup")
	public String getFormsignup(
			Model model,
			@ModelAttribute("user") Accounts user,
			HttpSession sess
			) {
		model.addAttribute("TitlePage", "Đăng Ký");
		model.addAttribute("views", "/views/signup.jsp");
		sess.setAttribute("errorMessagesignup", "");
		return "/login";
	}
	
	@PostMapping(value =  "/signup")
	public String signup(Model model,
			HttpSession sess,
			@ModelAttribute("user") Accounts user,
			@RequestParam(value = "username") String un, 
			@RequestParam("fullname") String fn, 
			@RequestParam("email") String email,
			@RequestParam("password") String pwd,  
			@RequestParam("cfpwd") String cfpwd, 
			BindingResult result) {

		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			model.addAttribute("errors", errors);

			return "redirect:/signup";
		}else {		

				Accounts newAcc = accountRepository.findByUsername(un);
//				System.out.println(user);
				if(newAcc == null) {					
					if (un.length() == 0) {
						sess.setAttribute("errorMessagesignup", "Không được để trống Username");
					} else if (fn.length() == 0) {
						sess.setAttribute("errorMessagesignup", "Không được để trống Fullname");
					} else if (email.length() == 0) {
						sess.setAttribute("errorMessagesignup", "Không được để trống Email");
					} else if (pwd.length() == 0) {
						sess.setAttribute("errorMessagesignup", "Không được để trống Password");
					} else if (cfpwd.length() == 0) {
						sess.setAttribute("errorMessagesignup", "Không được để trống Confirm Password");
					} else if (!pwd.equalsIgnoreCase(cfpwd)) {
						sess.setAttribute("errorMessagesignup", "Confirm Password không giống với password");
					} else {
						 if(!accountRepository.equals(un)) { 
							sess.setAttribute("errorMessagesignup", "");
							sess.setAttribute("errorMessage", "");
							user.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
							accountRepository.save(user);
							return "redirect:/login";
						}
						throw new RuntimeException("Ma tai khoan da ton tai!");
					}
					System.out.println("User == Null");
					return "redirect:/signup";		
				}else {
					System.out.println("User != null");
					sess.setAttribute("errorMessagesignup", "Username này đã tồn tại, vui lòng chọn username khác!");
					return "redirect:/signup";		
				}
		}
	}
	
	@PostMapping(value = "/forgotpassword")
	public String forgotPassword(
			HttpSession sess,
			@ModelAttribute("fpAccount") Accounts account,
			@RequestParam("usernameF") String un,
			@RequestParam("emailF") String em, 
			BindingResult result
			) {
		
		if(result.hasErrors()) {
			List<ObjectError> errors = result.getAllErrors();
			
			System.out.println("message err: " + errors.get(0).getDefaultMessage());
			
			sess.setAttribute("errors", errors);

			return "redirect:/login";
		}else {
			try {
				Accounts acc = accountRepository.findByUsername(un);
				
				if(acc != null) {
					mailer.send(
							em, 
							"Mail ForgotPassword từ Assignment", 
							"<h3>"
							+"Username: " + un +"<br>"
							+"Password: " + acc.getPassword()
							+ "</h3>");
				}
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "redirect:/login";
		}
	}
}
