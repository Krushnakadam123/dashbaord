package com.example.dashboarddemo.Entity;

import java.util.List;



import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long empid;

    @Column(name = "empname", nullable = false)
    private String empname;

    @Column(name = "mobile", nullable = false, unique = true)
    private String mobile;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "role", nullable = false)
    private String role;

    @Column(name = "password", nullable = false) // Adding the password field
    private String password;

    @OneToMany(mappedBy = "employee", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Registrationallocation> register;

    // Default constructor
    public Employee() {}

    // Constructor with parameters
    public Employee(String empname, String mobile, String email, String role, String password) {
        this.empname = empname;
        this.mobile = mobile;
        this.email = email;
        this.role = role;
        this.password = password; // Initialize password in the constructor
    }

    // Getters and Setters
    public Long getEmpId() {
        return empid;
    }

    public void setEmpId(Long empid) {
        this.empid = empid;
    }

    public String getName() {
        return empname;
    }

    public void setName(String empname) {
        this.empname = empname;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public List<Registrationallocation> getTasks() {
        return register;
    }

    public void setTasks(List<Registrationallocation> register) {
        this.register = register;
    }

    @Override
    public String toString() {
        return "Employee{" +
                "empid=" + empid +
                ", empname='" + empname + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", role='" + role + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
