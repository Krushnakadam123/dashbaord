package com.example.dashboarddemo.Entity;

import java.sql.Date;
import java.util.List;


import jakarta.persistence.CascadeType;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;@Entity
@Table(name = "students")
public class Student {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long sid; // Replaced id with sid

    @Column(nullable = false)
    private String name;

    @Column(nullable = false, unique = true)
    private String mobile;

    @Column(nullable = false, unique = true)
    private String email;

    @Column(nullable = false, unique = true)
    private String aadharno;
    
    @Column(nullable = false)
    private Date date_registered;

    @Column(nullable = false)
    private String password;

    @Column(nullable = false)
    private String address; // Added address

    @Column(name = "parent_no", nullable = false)
    private String parentNo; // Added parentNo

    @Column(name = "college_name", nullable = false)
    private String collegeName; // Added collegeName

    @Column(nullable = false)
    private String stream; // Added stream

    @Column(nullable = false)
    private String trainer; // Added trainer

    @Column(name = "consultant_name", nullable = false)
    private String consultantName; // Added consultantName

    // New payamount column
    @Column(name = "payamount", nullable = false)
    private Double payamount; // Added payamount

    // Many-to-One relationship with Course entity
    @ManyToOne
    @JoinColumn(name = "cid", nullable = false)
    private Course course;

    @OneToMany(mappedBy = "student", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Registrationallocation> register;

    @Column(nullable = false)
    private String paymode;

    @Column(nullable = false)
    private String status;
    
    @Column(nullable = false)
    private String gender;

    @Column(nullable = false)
    private Double total;

    @Column(name = "remaining_total", nullable = false)
    private Double remainingTotal;

    @Column(name = "course_name", nullable = false)
    private String courseName;
    

    // Constructors
    public Student() {}

    public Student(String name, String trainer,Date date_registered, String consultantName, String mobile, String email, String aadharno,
                   String password, String address, String parentNo, String collegeName, String stream, Course course,
                   String paymode,String gender, String status, Double total, Double remainingTotal, String courseName, Double payamount) {
        this.name = name;
        this.trainer = trainer;
        this.consultantName = consultantName;
        this.mobile = mobile;
        this.date_registered= date_registered;
        this.email = email;
        this.aadharno = aadharno;
        this.password = password;
        this.address = address;
        this.parentNo = parentNo;
        this.collegeName = collegeName;
        this.stream = stream;
        this.course = course;
        this.paymode = paymode;
        this.gender= gender;
        this.status = status;
        this.total = total;
        this.remainingTotal = remainingTotal;
        this.courseName = courseName;
        this.payamount = payamount; // Set payamount in constructor
    }

    // Getters and Setters for all fields, including payamount
    public Long getSid() {
        return sid;
    }

    public void setSid(Long sid) {
        this.sid = sid;
    }

    public String getTrainer() {
        return trainer;
    }

    public void setTrainer(String trainer) {
        this.trainer = trainer;
    }

    public String getConsultantName() {
        return consultantName;
    }

    public void setConsultantName(String consultantName) {
        this.consultantName = consultantName;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
    
    public Date getDate_registered() {
    	return date_registered;
    }
    
    public void setDate_registered(Date date_registered) {
    	this.date_registered = date_registered;
    }
    
    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
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

    public String getAadharno() {
        return aadharno;
    }

    public void setAadharno(String aadharno) {
        this.aadharno = aadharno;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getParentNo() {
        return parentNo;
    }

    public void setParentNo(String parentNo) {
        this.parentNo = parentNo;
    }

    public String getCollegeName() {
        return collegeName;
    }

    public void setCollegeName(String collegeName) {
        this.collegeName = collegeName;
    }

    public String getStream() {
        return stream;
    }

    public void setStream(String stream) {
        this.stream = stream;
    }

    public Course getCourse() {
        return course;
    }

    public void setCourse(Course course) {
        this.course = course;
    }

    public String getPaymode() {
        return paymode;
    }

    public void setPaymode(String paymode) {
        this.paymode = paymode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Double getTotal() {
        return total;
    }

    public void setTotal(Double total) {
        this.total = total;
    }

    public Double getRemainingTotal() {
        return remainingTotal;
    }

    public void setRemainingTotal(Double remainingTotal) {
        this.remainingTotal = remainingTotal;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Double getPayamount() {
        return payamount;
    }

    public void setPayamount(Double payamount) {
        this.payamount = payamount;
    }

    public List<Registrationallocation> getRegister() {
        return register;
    }

    public void setRegister(List<Registrationallocation> register) {
        this.register = register;
    }

    @Override
    public String toString() {
        return "Student{" +
                "sid=" + sid +
                ", name='" + name + '\'' +
                ", trainer='" + trainer + '\'' +
                ", date_registered='" + date_registered + '\'' +
                ", consultantName='" + consultantName + '\'' +
                ", mobile='" + mobile + '\'' +
                ", email='" + email + '\'' +
                ", aadharno='" + aadharno + '\'' +
                ", password='" + password + '\'' +
                ", address='" + address + '\'' +
                ", parentNo='" + parentNo + '\'' +
                ", collegeName='" + collegeName + '\'' +
                ", stream='" + stream + '\'' +
                 ", gender='" + gender + '\'' +
                ", course=" + course +
                ", paymode='" + paymode + '\'' +
                ", status='" + status + '\'' +
                ", total=" + total +
                ", remainingTotal=" + remainingTotal +
                ", courseName='" + courseName + '\'' +
                ", payamount=" + payamount +
                '}';
    }
}
