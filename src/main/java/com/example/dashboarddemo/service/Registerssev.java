package com.example.dashboarddemo.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dashboarddemo.Dao.Register;
import com.example.dashboarddemo.Entity.Registrationallocation;

@Service
public class Registerssev {

	@Autowired
	private Register rr;
	 // Method to register a student
    public int registerStudent(Registrationallocation registrationallocation) throws SQLException {
        try {
            // Call the repository method to insert student registration
            int result = rr.registerStudent(registrationallocation);
            System.out.println("date"+result);
            return result; // Return the result of the registration (affected rows)
        } catch (SQLException e) {
            // Handle any exceptions thrown from the repository layer
            throw new SQLException("Error occurred while registering the student", e);
        }
    }
}
