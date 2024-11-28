package com.example.dashboarddemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.dashboarddemo.Entity.Student;

@Service
public class StudentServiceImpl implements StudentSe {

    @Autowired
    private StudentRepository studentRepository; // Replace with your actual repository

    @Override
    public List<Student> getAllStudents() {
        return studentRepository.findAll(); // Fetch all students from the database
    }

    @Override
    public Student getStudentById(Long sid) {
        return studentRepository.findById(sid).orElse(null); // Fetch student by ID
    }
    @Override
    public void updateStudent(Student student) {
        studentRepository.save(student); // Save the updated student information
    }
    
}