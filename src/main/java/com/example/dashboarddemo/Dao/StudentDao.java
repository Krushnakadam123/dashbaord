package com.example.dashboarddemo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.dashboarddemo.Entity.Course;

import com.example.dashboarddemo.Entity.Registrationallocation;
import com.example.dashboarddemo.Entity.Student;


@Repository
public class StudentDao {

   
    // Insert student data into the database
    public int registerStudent(Student student) throws SQLException {
    	  Connection conn = null;
    	    int result = 0;
    	    PreparedStatement psItem = null;

    	    try {
    	        conn = DBUtil.getConnection();
    	        conn.setAutoCommit(false); // Start transaction

    	        String sql = "INSERT INTO students (name, mobile, email,trainer,payamount,consultant_name,date_registered, aadharno, password, address, parent_no, college_name, stream, cid, paymode, status, total, remaining_total, course_name,gender) " +
    	                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?, ?, ?,?,?,?,?)";
    	        psItem = conn.prepareStatement(sql);
    	        
    	        psItem.setString(1, student.getName());
    	        psItem.setString(2, student.getMobile());
    	        psItem.setString(3, student.getEmail());
    	        
    	        psItem.setString(4, student.getTrainer());
    	        psItem.setDouble(5, student.getPayamount());
    	        psItem.setString(6, student.getConsultantName());
    	        psItem.setDate(7, student.getDate_registered());
    	        psItem.setString(8, student.getAadharno());
    	        psItem.setString(9, student.getPassword());
    	        psItem.setString(10, student.getAddress());
    	        psItem.setString(11, student.getParentNo());
    	        psItem.setString(12, student.getCollegeName());
    	        psItem.setString(13, student.getStream());
    	        psItem.setLong(14, student.getCourse().getCId()); 
    	        psItem.setString(15, student.getPaymode());
    	        psItem.setString(16, student.getStatus());
    	        psItem.setDouble(17, student.getTotal());
    	        psItem.setDouble(18, student.getRemainingTotal());
    	        psItem.setString(19, student.getCourseName());
    	        psItem.setString(20, student.getGender());
    	       

    	        result = psItem.executeUpdate(); // Update result with the number of affected rows
    	        conn.commit(); // Commit transaction if successful
    	        System.out.println(result);

    	    } catch (SQLException e) {
    	        if (conn != null) {
    	            try {
    	                conn.rollback(); // Rollback transaction on error
    	            } catch (SQLException rollbackEx) {
    	                throw new SQLException("Rollback failed", rollbackEx);
    	            }
    	        }
    	        throw e; // Re-throw the original exception
    	    } finally {
    	        // Close resources
    	        if (psItem != null) {
    	            psItem.close();
    	        }
    	        if (conn != null) {
    	            conn.close(); // Ensure the connection is closed
    	        }
    	    }

    	    return result;
    	   }
    
 // Insert register data into the database
    public int registerdate(Registrationallocation registrationallocation) throws SQLException {
    	  Connection conn = null;
    	    int result = 0;
    	    PreparedStatement psItem = null;

    	    try {
    	        conn = DBUtil.getConnection();
    	        conn.setAutoCommit(false); // Start transaction

    	      String sql="INSERT INTO registrationallocation( date_registered )"+  "VALUES (?)";
    	      psItem = conn.prepareStatement(sql);
  	        
  	        psItem.setDate(1, registrationallocation.getDateRegistered());
  	       // psItem.setLong(2, registrationallocation.getCourse().getCId());
  	       // psItem.setLong(3, registrationallocation.getStudent().getSid());
  	        
  	        result = psItem.executeUpdate(); // Update result with the number of affected rows
  	        conn.commit(); // Commit transaction if successful
  	        System.out.println(result);
    	    }catch (SQLException e) {
    	        if (conn != null) {
    	            try {
    	                conn.rollback(); // Rollback transaction on error
    	            } catch (SQLException rollbackEx) {
    	                throw new SQLException("Rollback failed", rollbackEx);
    	            }
    	        }
    	    }
			return result;
    }
    
 // Update student data
    public int updateStudent(Long sid,Student student ) throws SQLException {
    	String sql = "UPDATE students SET name = ?, mobile = ?, email = ?, password = ?, cid = ?, paymode = ?, status = ?, total = ?, remaining_total = ?, " +
                "aadharno = ?, address = ?, payamount = ?, consultant_name = ?, course_name = ?, parent_no = ?, trainer = ?, gender = ?, stream = ?, date_registered = ?, cid = ? " + // Space added here
                "WHERE sid = ?";

        int result = 0;	
        //Student student =new Student();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
        
            ps.setString(1, student.getName());
            ps.setString(2, student.getMobile());
            ps.setString(3, student.getEmail());
            ps.setString(4, student.getPassword());
            ps.setLong(5, student.getCourse().getCId()); // Assuming course has a CId field
            ps.setString(6, student.getPaymode());
            ps.setString(7, student.getStatus());
            ps.setDouble(8, student.getTotal());
            ps.setDouble(9, student.getRemainingTotal());
            ps.setString(10, student.getAadharno());
            ps.setString(11, student.getAddress());
            ps.setDouble(12, student.getPayamount());
            ps.setString(13, student.getConsultantName());
            ps.setString(14, student.getCourseName());
            ps.setString(15, student.getParentNo());
            ps.setString(16, student.getTrainer());
            ps.setString(17, student.getGender());
            ps.setString(18, student.getStream());
            ps.setDate(19, student.getDate_registered());
            ps.setLong(20, student.getCourse().getCId()); 

            // Set the sid for the WHERE clause
            ps.setLong(21, sid);

            // Execute the update query
          result=  ps.executeUpdate();
        }
		return result;
        
    }


    // Delete student data
    public void deleteStudent(Long sid) throws SQLException {
        String sql = "DELETE FROM students WHERE sid=?";
        try (Connection conn = DBUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(sql)) {

               ps.setLong(1, sid);
               ps.executeUpdate();
           }
    }

    
    

    // Validate student login
    public Student validateStudent(String email) throws SQLException {
    	 String sql = "SELECT * FROM students WHERE email = ?";
         Student user = null;

         try (Connection conn = DBUtil.getConnection();
              PreparedStatement ps = conn.prepareStatement(sql)) {

             ps.setString(1, email);
             ResultSet rs = ps.executeQuery();

             if (rs.next()) {
                 user = new Student();
                 user.setSid(rs.getLong("Sid"));
                 user.setEmail(rs.getString("email"));
                 user.setPassword(rs.getString("password"));
               
             }
            
         }
         return user;
     }
       
    // Method to fetch the Course by ID (Implement according to your logic)
//    private Course fetchCourseById() {
//        // Logic to fetch course object from the database by ID
//        // You may need to create a CourseDao to handle this
//        return null; // Placeholder
    //}
    
//    public static void main(String[] args) {
//        // Create a new Course object (assuming you have the course ID, cid)
//        Course course = new Course();
//        course.setCId(4L); // Assign a valid course ID
//        
//        // Create a new Student object
//        Student student = new Student();
//        student.setName("Sachin Agrwal");
//        student.setMobile("1234567890");
//        student.setEmail("john.doe@example.com");
//        student.setAadharno("123456789012");
//        student.setPassword("password123");
//        student.setAddress("123 Main Street");
//        student.setParentNo("9876543210");
//        student.setCollegeName("ABC College");
//        student.setStream("Computer Science");
//        student.setCourse(course); // Associate with the Course entity
//        student.setPaymode("Online");
//        student.setStatus("Active");
//        student.setTotal(5000.00);
//        student.setRemainingTotal(2000.00);
//        student.setCourseName("CProgramming");
//
//        // Create the DAO instance
//        StudentDao studentDao = new StudentDao();
//
//        // Register the student in the database
//        try {
//            int result = studentDao.registerStudent(student);
//            if (result > 0) {
//                System.out.println("Student registered successfully!");
//            } else {
//                System.out.println("Failed to register student.");
//            }
//        } catch (SQLException e) {
//            System.err.println("Error occurred while registering student: " + e.getMessage());
//        }
//    }

   

        // Method to fetch all student data from the database
        public List<Student> getdata(String email) {
            // SQL query to select all records from the 'students' table
            String sql = "SELECT * FROM students WHERE email = ?";
            List<Student> studentList = new ArrayList<>();
            
            // Try-with-resources for managing the connection, statement, and result set
            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement ps = conn.prepareStatement(sql)){
                	 ps.setString(1, email);
                	 
                     ResultSet rs = ps.executeQuery();
                // Loop through the result set and add each student to the list
                while (rs.next()) {
                    Student students = new Student();
                    students.setName(rs.getString("name"));
                    students.setMobile(rs.getString("mobile"));
                    students.setEmail(rs.getString("email"));
                    students.setAadharno(rs.getString("aadharno"));
                    students.setParentNo(rs.getString("parent_no"));
                    students.setAddress(rs.getString("address"));
                    students.setGender(rs.getString("gender"));
                    students.setCourseName(rs.getString("course_name"));
                    students.setTotal(rs.getDouble("total"));
                    students.setRemainingTotal(rs.getDouble("remaining_total"));
                    students.setConsultantName(rs.getString("consultant_name"));
                    students.setTrainer(rs.getString("trainer"));
                    students.setPayamount(rs.getDouble("payamount"));
                    students.setCollegeName(rs.getString("college_name"));
                    students.setStream(rs.getString("stream"));
                    students.setDate_registered(rs.getDate("date_registered"));
                    // Add the student to the list
                    studentList.add(students);
                }
            } catch (SQLException e) {
                // Log the error (can be replaced with a logging framework)
                System.err.println("Error fetching student data: " + e.getMessage());
            }
            
            // Return the list of students
            return studentList;
        }
    

    	public List<Registrationallocation> getdata2() {
    	
    		 List<Registrationallocation>List = new ArrayList<>();
             
    	String sql="SELECT * FROM registrationallocation";
    	

        try (Connection conn = DBUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
        		 ResultSet rs = ps.executeQuery()) {
        	
        	 while (rs.next()) {
        		 Registrationallocation rep=new Registrationallocation();
        		 rep.setDateRegistered(rs.getDate("date_registered"));
        		 
        		 
        	
        		 
        		 List.add(rep);
        	
        	 }
        	
        	
        }catch (SQLException e) {
        	System.err.println("Error fetching student data: " + e.getMessage());
    	}
        	return List;
    	}

    	
    	// Update student status by SID
    	public boolean updateStudentStatus(Long sid, String status) throws SQLException {
    	    String sql = "UPDATE students SET status = ? WHERE sid = ?";
    	    boolean isUpdated = false;

    	    try (Connection conn = DBUtil.getConnection();
    	         PreparedStatement ps = conn.prepareStatement(sql)) {

    	        // Set the status and sid for the query
    	        ps.setString(1, status);
    	        ps.setLong(2, sid);

    	        // Execute the update query
    	        int rowsUpdated = ps.executeUpdate();
    	        isUpdated = rowsUpdated > 0;

    	        if (isUpdated) {
    	           // System.out.println("Student status updated successfully.");
    	        } 
    	    } catch (SQLException e) {
    	        System.err.println("Error while updating student status: " + e.getMessage());
    	        throw e; // Re-throwing for the caller to handle if needed
    	    }

    	    return isUpdated;
    	}


//
//	public List<Employee> getdata1() {
//	
//		 List<Employee>List = new ArrayList<>();
//         
//	String sql="SELECT * FROM employee";
//	
//
//    try (Connection conn = DBUtil.getConnection();
//         PreparedStatement ps = conn.prepareStatement(sql);
//    		 ResultSet rs = ps.executeQuery()) {
//    	
//    	 while (rs.next()) {
//    		 Employee emp=new Employee();
//    		 emp.setName(rs.getString("empname"));
//    		 
//    		 List.add(emp);
//    	
//    	 }
//    	
//    	
//    }catch (SQLException e) {
//    	System.err.println("Error fetching student data: " + e.getMessage());
//	}
//    	return List;
//	}

}
