package assignment.config;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import assignment.interceptor.AdminInterceptor;
import assignment.interceptor.AuthenticateInterceptor;
import assignment.interceptor.LoginInterceptor;

@Configuration
public class InterceptorConfig implements WebMvcConfigurer{
	
	@Autowired
	AuthenticateInterceptor authenticateInterceptor;
	
	@Autowired
	AdminInterceptor adminInterceptor;
	
	@Autowired
	LoginInterceptor loginInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(loginInterceptor)
			.addPathPatterns("/**");

		registry.addInterceptor(authenticateInterceptor)
			.addPathPatterns("/admin/**", "/cart/checkout", "/myAcc/**")
			.excludePathPatterns("/login");

		registry.addInterceptor(adminInterceptor)
			.addPathPatterns("/admin/**")
			.excludePathPatterns("/hello");
	}
}
