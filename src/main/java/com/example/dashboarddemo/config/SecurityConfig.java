package com.example.dashboarddemo.config;


//
//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.authentication.AuthenticationManager;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
//import org.springframework.security.config.http.SessionCreationPolicy;
//import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
//import org.springframework.security.crypto.password.PasswordEncoder;
//import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
//
//import com.example.dashboarddemo.service.CustomUserDetailsService;
//
//@Configuration
//@EnableWebSecurity
//public class SecurityConfig {
//
//    private final JwtFilter jwtFilter;
//    private final CustomUserDetailsService userDetailsService;
//
//    public SecurityConfig(JwtFilter jwtFilter, CustomUserDetailsService userDetailsService) {
//        this.jwtFilter = jwtFilter;
//        this.userDetailsService = userDetailsService;
//    }
//
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
//    }
//
//    @SuppressWarnings("removal")
//	@Bean
//    public AuthenticationManager authenticationManagerBean(HttpSecurity http) throws Exception {
//        return http.getSharedObject(AuthenticationManagerBuilder.class)
//                   .userDetailsService(userDetailsService)
//                   .passwordEncoder(passwordEncoder())
//                   .and()
//                   .build();
//    }
//
//    @Bean
//    public PasswordEncoder passwordEncoder() {
//        return new BCryptPasswordEncoder();
//    }
//
//    @SuppressWarnings({ "deprecation", "removal" })
//    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable()
//            .authorizeRequests()
//            .requestMatchers("adminlogin", "dash").permitAll() // Adjust this based on your requirements
//            .anyRequest().authenticated() // Ensure other requests require authentication
//            .and()
//            .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS);
//
//        http.addFilterBefore(jwtFilter, UsernamePasswordAuthenticationFilter.class);
//    }
//
//}
//

//import org.springframework.context.annotation.Bean;
//import org.springframework.context.annotation.Configuration;
//import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
//import org.springframework.security.config.annotation.web.builders.HttpSecurity;
//import org.springframework.security.core.userdetails.User;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.provisioning.InMemoryUserDetailsManager;
//import org.springframework.security.web.SecurityFilterChain;
//
//@Configuration
//public class SecurityConfig {
//
//    @Bean
//    public UserDetailsService userDetailsService() {
//        var user1 = User.withUsername("admin")
//                .password("{noop}admin123")  // {noop} is used for plain text password
//                .roles("ADMIN")
//                .build();
//
//        var user2 = User.withUsername("slogin")
//                .password("{noop}user123")
//                .roles("USER")
//                .build();
//
//        return new InMemoryUserDetailsManager(user1, user2);
//    }
//
//    @Bean
//    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
//        http
//            .authorizeRequests()
             //.formLogin("/Adminlogin")
//                .requestMatchers("/admin/**").hasRole("Employee")  // Admin role can access "/admin" URL
//                .requestMatchers("/slogin/**").hasRole("Studnet")    // User role can access "/user" URL
//               // .requestMatchers("/login").permitAll()  // Allow access to login page
//                .anyRequest().authenticated()   // Other pages require authentication
//            .and()
//            .formLogin("/slogin")
//                .loginPage("/new")  // Specify custom login page
//                .loginProcessingUrl("/new")  // Define the URL where form data is submitted
//                // Redirect after successful login
//            .and()
//            .logout()
//                .logoutSuccessUrl("/slogin?logout");  // Redirect to login after logout
//           
//
//        return http.build();
//    }
//}




