package com.umi.authentication;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.dao.DaoAuthenticationProvider;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.Http403ForbiddenEntryPoint;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

@Configuration
@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
    private UserPrincipalDetailsService userPrincipalDetailsService;

    public SecurityConfiguration(UserPrincipalDetailsService userPrincipalDetailsService) {
        this.userPrincipalDetailsService = userPrincipalDetailsService;
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) {
        auth.authenticationProvider(authenticationProvider());
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {

    	
    	http.csrf()
        .disable()
        .exceptionHandling()
        .authenticationEntryPoint(new Http403ForbiddenEntryPoint() {}).and()
        .authenticationProvider(authenticationProvider())
        .authorizeRequests()
            
        	.antMatchers("/").permitAll()
        	.antMatchers("/login").permitAll()
        	.antMatchers("/logout").permitAll()
        	.antMatchers("/signin").permitAll()
        	.antMatchers("/prof/**").hasRole("PROF")
        	.antMatchers("/responsable/**").hasRole("ADMIN")
        	.antMatchers("/resp/**").hasRole("RESPONSABLE")
        	.antMatchers("/delib/**").hasAnyRole("PROF", "RESPONSABLE", "ADMIN")
	        .antMatchers("/student/**").hasRole("ADMIN")
	        .antMatchers("/filiere/**").hasRole("ADMIN")
	        .antMatchers("/historique/**").hasRole("ADMIN")
	        .antMatchers("/inscription/**").hasRole("ADMIN")
	        .antMatchers("/note/**").hasAnyRole("PROF", "RESPONSABLE", "ADMIN")
	        .antMatchers("/foobar/**").hasRole("ADMIN")
            .antMatchers("/module/**").hasRole("ADMIN")
        	.anyRequest().permitAll()
            .and()
            .formLogin()
            .loginProcessingUrl("/signin").permitAll()
            .loginPage("/login").permitAll()
            .successHandler(mySimpleUrlAuthenticationHandler())
            .failureUrl("/login?error=true")
            .usernameParameter("username")
            .passwordParameter("password")
            .and()
            .logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")).logoutSuccessUrl("/login")
            .and()
            .rememberMe().tokenValiditySeconds(30000).key("mySecret!")
            .userDetailsService(userPrincipalDetailsService).rememberMeParameter("checkRememberMe");
    }

    @Bean
    DaoAuthenticationProvider authenticationProvider(){
        DaoAuthenticationProvider daoAuthenticationProvider = new DaoAuthenticationProvider();
        daoAuthenticationProvider.setPasswordEncoder(passwordEncoder());
        daoAuthenticationProvider.setUserDetailsService(this.userPrincipalDetailsService);

        return daoAuthenticationProvider;
    }

    @Bean
    PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }
    
    @Bean
    MySimpleUrlAuthenticationHandler mySimpleUrlAuthenticationHandler() {
    	return new MySimpleUrlAuthenticationHandler();
    }
}
