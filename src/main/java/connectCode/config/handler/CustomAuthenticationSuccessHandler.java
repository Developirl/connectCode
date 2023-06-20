package connectCode.config.handler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

public class CustomAuthenticationSuccessHandler implements AuthenticationSuccessHandler{

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		List<String> role = new ArrayList<>();
		
		authentication.getAuthorities().forEach(authority -> {
			role.add(authority.getAuthority());
		});
		
		if(role.contains("ROLE_12")) {
			response.sendRedirect("/");
			return;
		}
		
		if(role.contains("ROLE_13")) {
			response.sendRedirect("/");
		}
		
		if(role.contains("ROLE_11")) {
			response.sendRedirect("/master/masterMainPage");
			return;
		}
		
	}

}
