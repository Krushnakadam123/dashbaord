package com.example.dashboarddemo.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.example.dashboarddemo.Dao.StudentDao;
import com.example.dashboarddemo.Dao.courseRepository;
import com.example.dashboarddemo.Entity.Course;

import com.example.dashboarddemo.Entity.Registrationallocation;
import com.example.dashboarddemo.Entity.Student;

import jakarta.persistence.EntityNotFoundException;

@Service
public class StudentService {

	 private final StudentDao studentDao;

	    // Constructor to inject StudentDao dependency
	    public StudentService() {
	        this.studentDao = new StudentDao();  // Dependency injection (can be changed to DI framework later)
	    }

	    // Service method to handle student registration
	    public boolean registerStudent(Student student) {
	        boolean isRegistered = false;
	        //  Check if the email, mobile, or Aadhaar number already exists
	        if (isStudentExists(student.getEmail(), student.getMobile(), student.getAadharno())) {
	        	  System.out.println("Email, mobile number, or Aadhaar number already exists!");
	            return  isRegistered;  // Return to the form page if validation fails
	        }
	        
	        try {
	            // Call the DAO method to register the student
	            int result = studentDao.registerStudent(student);
	            
	            if (result > 0) {
	                isRegistered = true;  // Student was successfully registered
	                System.out.println("Student registration successful.");
	            } else {
	                System.out.println("Failed to register the student.");
	            }
	        } catch (SQLException e) {
	            System.err.println("Error occurred during student registration: " + e.getMessage());
	        }
	        return isRegistered;
	    }
	    
	    public boolean isStudentExists(String email, String mobile, String aadharno) {
	        return studentRepository.existsByEmail(email) || 
	               studentRepository.existsByMobile(mobile) || 
	               studentRepository.existsByAadharno(aadharno);
	    }

	    // not use
	    public boolean registerpage(Registrationallocation registrationallocation) {
	    	 boolean isRegistered = false;
	    	 
	            try {
	            	int result = studentDao.registerdate(registrationallocation);
	            if (result > 0) {
	                isRegistered = true;  // Student was successfully registered
	                System.out.println("Student registration successful.");
	            } else {
	                System.out.println("Failed to register the student.");
	            }
	        } catch (SQLException e) {
	            System.err.println("Error occurred during student registration: " + e.getMessage());
	        }
	        return isRegistered; 
	    	
	    }

	    
	    
    public boolean updateStudent(Long sid,Student student) throws SQLException {
    	 boolean isRegistered = false;
    	 
         try {
         	int result = studentDao.updateStudent(sid,student);
         if (result > 0) {
             isRegistered = true;  // Student was successfully registered
             System.out.println("Student registration successful.");
         }
         }
         catch (SQLException e) {
	            System.err.println("Error occurred during student registration: " + e.getMessage());
	        }

         return isRegistered; 
    }

    public void deleteStudent(Long id) throws SQLException {
        studentDao.deleteStudent(id);
    }

    
    public boolean loginStudent(String email, String password) throws SQLException {
    	  // Check if the student exists and the password matches
        Student student = studentDao.validateStudent(email);
       
        if (student != null) {
        	
            return student.getPassword().equals(password); 
            // You might want to use a hashed password in a real application
        }
        return false;
    }
    	//return studentDao.validateStudent(email, password);
    private courseRepository CourseRepository;
    @Autowired
    public void CourseService(courseRepository CourseRepository) {
        this.CourseRepository = CourseRepository;
    }

    public Course getCourseById(Long cid) throws EntityNotFoundException {
        return CourseRepository.findById(cid)
                               .orElseThrow(() -> new EntityNotFoundException("Course not found"));
    }

    ///getting infroMTION
	public List<Student> getinfromation(String email) {
		
		return studentDao.getdata(email);
	}

	public List<Registrationallocation> getempl() {
		
	
			return	studentDao.getdata2();
	}
	
	 // Enum for status values
    public enum Status {
        Active, Inactive
    }

	public boolean  updatesatust(Long sid,String status) throws SQLException {
		return studentDao.updateStudentStatus(sid, status);
	}
   
	@Autowired
    private StudentRepository studentRepository;

	  public void updateStatus(Long sid, String status) {
	        Optional<Student> studentOpt = studentRepository.findById(sid);
	        if (studentOpt.isPresent()) {
	            Student student = studentOpt.get();
	            student.setStatus(status);
	            studentRepository.save(student);  // Update status in the database
	           
	        }
	       
	    }
    
}
