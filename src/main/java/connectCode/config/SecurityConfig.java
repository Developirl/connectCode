package connectCode.config;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.access.AccessDeniedHandler;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.security.web.authentication.rememberme.JdbcTokenRepositoryImpl;
import org.springframework.security.web.authentication.rememberme.PersistentTokenRepository;

import connectCode.config.handler.CustomAccessDeniedHandler;
import connectCode.config.handler.CustomAuthenticationSuccessHandler;
import lombok.Setter;

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
            	.antMatchers("/academy").permitAll()
	            .antMatchers("/public/**").permitAll() 
	            .antMatchers("/member/**").permitAll() 
	            .antMatchers("/findMentor/**").permitAll()
	            .antMatchers("/freeMentoring/**").permitAll()
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
	           .rememberMe()
	            .key("connectCode")
	            .tokenRepository(persistentTokenRepository())
	            .tokenValiditySeconds(604800)
	            .and()
            .logout()
	            .logoutUrl("/member/logout")
	            .logoutSuccessUrl("/member/loginform") 
	            .invalidateHttpSession(true) 
	            .deleteCookies("remember-me","JSESSION_ID") 
	            .and()
            .httpBasic()
        		.and()
        	.userDetailsService(userDetailsService)
        	.headers().frameOptions().sameOrigin();
        
        return http.build();
    }
    
    @Setter(onMethod_ = {@Autowired})
    private DataSource dataSource;
    
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
    
    @Bean
    public PersistentTokenRepository persistentTokenRepository() {
    	JdbcTokenRepositoryImpl repo = new JdbcTokenRepositoryImpl();
    	repo.setDataSource(dataSource);
    	return repo;
    }
}


















