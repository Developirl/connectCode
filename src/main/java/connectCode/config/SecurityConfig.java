package connectCode.config;

import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import connectCode.config.handler.CustomAccessDeniedHandler;
import connectCode.config.handler.CustomAuthenticationSuccessHandler;

@EnableWebSecurity
public class SecurityConfig {
    
	private final UserDetailsService userDetailsService;

    public SecurityConfig(UserDetailsService userDetailsService) {
        this.userDetailsService = userDetailsService;
    }
	
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            .authorizeRequests()
            	.antMatchers("/").permitAll()
	            .antMatchers("/public/**").permitAll() 
	            .antMatchers("/member/**").permitAll() 
	            .antMatchers("/findMentor/**").permitAll() 
	            .antMatchers("/master/**").hasAuthority("ROLE_11")
	            .antMatchers("/mentee/**").hasAuthority("ROLE_12") 
	            .antMatchers("/mentor/**").hasAuthority("ROLE_13")
	            .anyRequest().authenticated()
	            .and()
            .exceptionHandling()
                .accessDeniedHandler(accessDeniedHandler()) // 접근 거부 핸들러 설정
                .and()
            .formLogin()
	            .loginPage("/member/loginform") 
	            .permitAll()
	            .loginProcessingUrl("/member/login") 
	            .usernameParameter("id")
	            .passwordParameter("password")
	            .successHandler(authenticationSuccessHandler())
	            .failureUrl("/member/login?error=true") 
	            .and()
            .logout()
	            .logoutUrl("/member/logout")
	            .logoutSuccessUrl("/member/loginform") 
	            .invalidateHttpSession(true) 
	            .deleteCookies("JSESSIONID") 
	            .and()
            .httpBasic()
        		.and()
        	.userDetailsService(userDetailsService)
        	.headers().frameOptions().sameOrigin();
        
        return http.build();
    }
    
    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    public AccessDeniedHandler accessDeniedHandler() {
        return new CustomAccessDeniedHandler();
    }
    
    @Bean
    public AuthenticationSuccessHandler authenticationSuccessHandler() {
        return new CustomAuthenticationSuccessHandler();
    }
    
}


















