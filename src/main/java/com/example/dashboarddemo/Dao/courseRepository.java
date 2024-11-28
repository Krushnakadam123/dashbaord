package com.example.dashboarddemo.Dao;


import org.springframework.data.jpa.repository.JpaRepository;

import com.example.dashboarddemo.Entity.Course;



public interface courseRepository extends  JpaRepository<Course, Long>{

}
