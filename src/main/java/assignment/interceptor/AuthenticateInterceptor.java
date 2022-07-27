package assignment.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
public class AuthenticateInterceptor implements HandlerInterceptor{
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if (session.getAttribute("User") == null) {
			session.setAttribute("errorMessage", "Vui lòng đăng nhập");
			response.sendRedirect(
				request.getContextPath() + "/login"
			);
			return false;
		}
		
		return true;
	}
}
