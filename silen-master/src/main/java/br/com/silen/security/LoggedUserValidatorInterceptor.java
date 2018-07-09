package br.com.silen.security;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import br.com.silen.user.User;

@Component
public class LoggedUserValidatorInterceptor extends HandlerInterceptorAdapter{
	
	@Autowired
	private LoggedUserService loggedUserService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		
		if (handler instanceof HandlerMethod) {
			HandlerMethod handlerMethod = (HandlerMethod) handler;
			boolean onlyAdminCanPass = handlerMethod.getMethod().isAnnotationPresent(OnlyAdmin.class);
			boolean isAppRoute = handlerMethod.getMethod().isAnnotationPresent(App.class) || 
					handler.getClass().isAnnotationPresent(App.class);
			
			boolean isLoginPath = StringUtils.equals("/", request.getServletPath())
					|| StringUtils.equals("/login", request.getServletPath())
					|| StringUtils.equals("/logout", request.getServletPath())
					|| StringUtils.equals("/teste", request.getServletPath())
					|| isAppRoute;
			boolean isErrorPath = StringUtils.equals("/error", request.getServletPath());
			
			if(isLoginPath || isErrorPath || isAppRoute) {
				return true;
			}
			
			Optional<User> user = loggedUserService.getLoggedUser();
			if(!user.isPresent()) {
				response.sendRedirect("/");
				return false;
			}
			
			request.setAttribute("loggedUser", user.get());
			boolean isAdmin = user.get().isAdmin();
			
			if(onlyAdminCanPass && !isAdmin) {
				response.sendRedirect("/home");
				return false;
			}
		}
		
		return true;
	}
}
