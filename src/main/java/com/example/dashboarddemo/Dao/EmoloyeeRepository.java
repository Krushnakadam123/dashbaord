package com.example.dashboarddemo.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.example.dashboarddemo.Entity.Employee;


@Repository
public interface EmoloyeeRepository extends JpaRepository<Employee, Long> {
    Employee findByEmail(String email);
}
