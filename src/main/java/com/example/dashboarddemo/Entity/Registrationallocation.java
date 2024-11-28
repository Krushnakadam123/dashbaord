package com.example.dashboarddemo.Entity;

import java.sql.Date;



import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "registrationallocation")  // Define the table name
public class Registrationallocation {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;  // Primary Key

    @Column(nullable = false)
    private String status;

    @Column(name = "date_registered", nullable = false)
    private Date dateRegistered;

    // Foreign Key for Student
    @ManyToOne
    @JoinColumn(name = "sid", nullable = false)
    private Student student;

//    // Foreign Key for Course
//    @ManyToOne
//    @JoinColumn(name = "cid",  nullable = false)
//    private Course course;

    // Foreign Key for Employee
    @ManyToOne
    @JoinColumn(name = "empid", nullable = false)
    private Employee employee;

    // Getters and Setters
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDateRegistered() {
        return dateRegistered;
    }

    public void setDateRegistered(Date dateRegistered) {
        this.dateRegistered = dateRegistered;
    }

    public Student getStudent() {
        return student;
    }

    @Override
	public String toString() {
		return "Registrationallocation [id=" + id + ", status=" + status + ", dateRegistered=" + dateRegistered
				+ ", student=" + student + ", course="  + ", employee=" + employee + "]";
	}

	public void setStudent(Student student) {
        this.student = student;
    }

//    public Course getCourse() {
//        return course;
//    }
//
//    public void setCourse(Course course) {
//        this.course = course;
//    }

    public Employee getEmployee() {
        return employee;
    }

    public void setEmployee(Employee employee) {
        this.employee = employee;
    }
}

