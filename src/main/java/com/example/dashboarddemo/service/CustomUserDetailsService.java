package com.example.dashboarddemo.service;

//
//import java.util.ArrayList;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//import org.springframework.stereotype.Service;
//
//import com.example.dashboarddemo.Dao.EmoloyeeRepository;
//
//import com.example.dashboarddemo.Entity.Employee;
//
//@Service
//public class CustomUserDetailsService implements UserDetailsService {
//
//    // Replace with actual logic to fetch user from DB
//
//	@Autowired
//	private  EmoloyeeRepository userRepository;
//    @Override
//    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
//        Employee user = userRepository.findByEmail(email);
//        if (user == null) {
//            throw new UsernameNotFoundException("User not found");
//        }
//        return new org.springframework.security.core.userdetails.User(
//            user.getEmail(),
//            user.getPassword(),
//            new ArrayList<>() // You can add roles or authorities here if needed
//        );
//    }
//}


