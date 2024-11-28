package com.example.dashboarddemo.service;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.dashboarddemo.Entity.Student;

@Repository
public interface StudentRepository extends JpaRepository<Student, Long> {
	 boolean existsByEmail(String email);
	    boolean existsByMobile(String mobile);
	    boolean existsByAadharno(String aadharno);

}
