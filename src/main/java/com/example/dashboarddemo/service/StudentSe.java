package com.example.dashboarddemo.service;

import java.util.List;

import com.example.dashboarddemo.Entity.Student;

public interface StudentSe {
    List<Student> getAllStudents();
    Student getStudentById(Long sid);
    void updateStudent(Student student);
}