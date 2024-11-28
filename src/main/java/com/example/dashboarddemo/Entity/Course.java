package com.example.dashboarddemo.Entity;

import java.util.List;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "courses")
public class Course {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY) // Automatically generates unique IDs
    private Long cid;

    @Column(name = "course_name", nullable = false) // Column name in DB with constraints
    private String courseName;

    @Column(nullable = false) // Duration of the course (in weeks/months)
    private String duration;

    @Column(nullable = false) // Mode of course (e.g., Online, Offline)
    private String mode;

    @Column(nullable = false) // Price of the course
    private Double price;

    @Column(nullable = false) // Status (e.g., Active, Inactive)
    private String status;

    // Establishing a One-to-Many relationship with students
    @OneToMany(mappedBy = "course", cascade = CascadeType.ALL, orphanRemoval = true)
   
    @JsonIgnore 
    private List<Student> students;
//    
//    @OneToMany(mappedBy = "course",cascade=CascadeType.ALL,orphanRemoval = true)
//    private List<Registrationallocation> register;
//     
    

    // Constructors
    public Course() {}

    public Course(String courseName, String duration, String mode, Double price, String status) {
        this.courseName = courseName;
        this.duration = duration;
        this.mode = mode;
        this.price = price;
        this.status = status;
    }

    // Getters and Setters
    public Long getCId() {
        return cid;
    }

    public void setCId(Long cid) {
        this.cid = cid;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getMode() {
        return mode;
    }

    public void setMode(String mode) {
        this.mode = mode;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

//    public List<Registrationallocation> getregister() {
//		return register;
//    	
//		
//	}
//    public void setregister(List<Registrationallocation> register) {
//    	this.register=register;
//    }
    public List<Student> getStudents() {
        return students;
    }

    public void setStudents(List<Student> students) {
        this.students = students;
    }

    @Override
    public String toString() {
        return "Course{" +
                "cid=" + cid +
                ", courseName='" + courseName + '\'' +
                ", duration='" + duration + '\'' +
                ", mode='" + mode + '\'' +
                ", price=" + price +
                ", status='" + status + '\'' +
                '}';
    }
}
