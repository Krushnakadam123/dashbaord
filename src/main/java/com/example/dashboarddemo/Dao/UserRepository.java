package com.example.dashboarddemo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.dashboarddemo.Entity.Student;


@Repository
public interface UserRepository extends JpaRepository<Student, Long> {
    Student findByEmail(String email);
}
