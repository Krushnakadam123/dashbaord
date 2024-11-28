package com.example.dashboarddemo.service;

import java.sql.SQLException;
import java.util.List;

import com.example.dashboarddemo.Entity.Student;


public interface studentser {
	
	List<Student> getAllStudents() throws SQLException;

}