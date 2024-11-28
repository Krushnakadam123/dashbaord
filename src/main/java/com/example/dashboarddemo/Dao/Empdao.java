package com.example.dashboarddemo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.example.dashboarddemo.Entity.Employee;
import com.example.dashboarddemo.Entity.Student;


@Repository
public class Empdao {

	public Employee validateadmin(String email) throws SQLException {
		// TODO Auto-generated method stub
		 String sql = "SELECT * FROM employee WHERE email = ?";
		 Employee user = null;

         try (Connection conn = DBUtil.getConnection();
              PreparedStatement ps = conn.prepareStatement(sql)) {

             ps.setString(1, email);
             ResultSet rs = ps.executeQuery();

             if (rs.next()) {
                 user = new Employee();
                 user.setEmpId(rs.getLong("empid"));
                 user.setName(rs.getString("empname"));
                 user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
               
             }
            
         }
         return user;
	
	}
	public List<Employee> getdataemp(String email) throws SQLException {
		// TODO Auto-generated method stub
		 String sql = "SELECT * FROM employee WHERE email = ?";
		  List<Employee> empList = new ArrayList<>();
		

         try (Connection conn = DBUtil.getConnection();
              PreparedStatement ps = conn.prepareStatement(sql)) {

             ps.setString(1, email);
             ResultSet rs = ps.executeQuery();

             if (rs.next()) {
            	 Employee user  = new Employee();
                 user.setEmpId(rs.getLong("empid"));
                 user.setName(rs.getString("empname"));
                 user.setEmail(rs.getString("email"));
                user.setPassword(rs.getString("password"));
               
             }
            
         }
         return empList;
	
	}

	// Fetch all students
	public List<Student> getAllStudents() throws SQLException {
	    String sql = "SELECT * FROM students";
	    List<Student> students = new ArrayList<>();

	    try (Connection conn = DBUtil.getConnection();
	         PreparedStatement ps = conn.prepareStatement(sql);
	         ResultSet rs = ps.executeQuery()) {

	        while (rs.next()) {
	            Student student = new Student();
	            student.setSid(rs.getLong("sid"));
	            student.setName(rs.getString("name"));
	            student.setMobile(rs.getString("mobile"));
	            student.setEmail(rs.getString("email"));
	            student.setPaymode(rs.getString("paymode"));
	            student.setStatus(rs.getString("status"));
	            student.setTotal(rs.getDouble("total"));
	            student.setRemainingTotal(rs.getDouble("remaining_total"));
	            student.setCourseName(rs.getString("course_name"));
	            
	            student.setDate_registered(rs.getDate("date_registered"));
	            student.setGender(rs.getString("gender"));
                student.setAadharno(rs.getString("aadharno"));
                student.setParentNo(rs.getString("parent_no"));
                student.setAddress(rs.getString("address"));
                student.setPassword(rs.getString("password"));
                student.setConsultantName(rs.getString("consultant_name"));
                student.setTrainer(rs.getString("trainer"));
                student.setPayamount(rs.getDouble("payamount"));
                student.setCollegeName(rs.getString("college_name"));
                student.setStream(rs.getString("stream"));
	            
	            
	            students.add(student); // Add student to list
	        }
	    }
	    return students; // Return list of students
	}

	

		    // Method to count students by gender
		    public int countStudentsByGender(String gender) throws SQLException {
		    	
		        String sql = "SELECT COUNT(*) FROM students WHERE gender = ?";
		        try (	Connection conn = DBUtil.getConnection();
		        		PreparedStatement stmt = conn.prepareStatement(sql)) {
		            stmt.setString(1, gender);
		            ResultSet rs = stmt.executeQuery();
		            if (rs.next()) {
		                 return rs.getInt(1); // Return the count of students with specified gender
		            }
		        }
		        return 0;
		    }

		
	
		    public Map<String, Integer> countRemainingFeesByMonth() throws SQLException {
		        String sql = "SELECT " +
		                     "  SUM(CASE WHEN MONTH(date_registered) = MONTH(CURRENT_DATE) AND YEAR(date_registered) = YEAR(CURRENT_DATE) THEN remaining_total ELSE 0 END) AS currentMonthRemaining, " +
		                     "  SUM(CASE WHEN MONTH(date_registered) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH) AND YEAR(date_registered) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) THEN remaining_total ELSE 0 END) AS lastMonthRemaining " +
		                     "FROM students " +
		                     "WHERE remaining_total > 0";

		        Map<String, Integer> result = new HashMap<>();

		        try (Connection conn = DBUtil.getConnection();
		             PreparedStatement ps = conn.prepareStatement(sql);
		             ResultSet rs = ps.executeQuery()) {
		            
		            if (rs.next()) {
		                result.put("currentMonthRemaining", rs.getInt("currentMonthRemaining"));
		                result.put("lastMonthRemaining", rs.getInt("lastMonthRemaining"));
		            }
		        }
		        return result;
		    }
		    
		    public Map<String, Integer> countActiveStudentsByMonth() throws SQLException {
		        String sql = "SELECT " +
		                     "  COUNT(CASE WHEN MONTH(date_registered) = MONTH(CURRENT_DATE) AND YEAR(date_registered) = YEAR(CURRENT_DATE) THEN 1 END) AS currentMonthActive, " +
		                     "  COUNT(CASE WHEN MONTH(date_registered) = MONTH(CURRENT_DATE - INTERVAL 1 MONTH) AND YEAR(date_registered) = YEAR(CURRENT_DATE - INTERVAL 1 MONTH) THEN 1 END) AS lastMonthActive " +
		                     "FROM students " +
		                     "WHERE status = 'Active'";  // Assuming 'status' indicates active students

		        Map<String, Integer> result = new HashMap<>();

		        try (Connection conn = DBUtil.getConnection();
		             PreparedStatement ps = conn.prepareStatement(sql);
		             ResultSet rs = ps.executeQuery()) {
		            
		            if (rs.next()) {
		                result.put("currentMonthActive", rs.getInt("currentMonthActive"));
		                result.put("lastMonthActive", rs.getInt("lastMonthActive"));
		            }
		        }
		        return result;
		    }


		    
		    // calcualte year wise 
		    public Map<String, Integer> countRemainingFeesByYear() throws SQLException {
		        String sql = "SELECT " +
		                     "  SUM(CASE WHEN YEAR(date_registered) = YEAR(CURRENT_DATE) THEN remaining_total ELSE 0 END) AS currentYearRemaining, " +
		                     "  SUM(CASE WHEN YEAR(date_registered) = YEAR(CURRENT_DATE) - 1 THEN remaining_total ELSE 0 END) AS lastYearRemaining, " +
		                     "  SUM(CASE WHEN YEAR(date_registered) = YEAR(CURRENT_DATE) THEN payamount ELSE 0 END) AS currentYearAmount, " +
		                     "  SUM(CASE WHEN YEAR(date_registered) = YEAR(CURRENT_DATE) - 1 THEN payamount ELSE 0 END) AS lastYearAmount " +
		                     "FROM students " +
		                     "WHERE remaining_total > 0 AND payamount > 0";

		        Map<String, Integer> result = new HashMap<>();

		        try (Connection conn = DBUtil.getConnection();
		             PreparedStatement ps = conn.prepareStatement(sql);
		             ResultSet rs = ps.executeQuery()) {
		            
		            if (rs.next()) {
		                result.put("currentYearRemaining", rs.getInt("currentYearRemaining"));
		                result.put("lastYearRemaining", rs.getInt("lastYearRemaining"));
		                result.put("currentYearAmount", rs.getInt("currentYearAmount"));
		                result.put("lastYearAmount", rs.getInt("lastYearAmount"));
		            }
		        }
		        return result;
		    }


//
//		    public List<Student> getinforemaing() throws SQLException {
//		        // Select only students with remaining fees greater than zero
//		        String sql = "SELECT name, remaining_fees FROM students WHERE remaining_fees > 0";
//		        List<Student> students = new ArrayList<>();
//
//		        try (Connection conn = DBUtil.getConnection();
//		             PreparedStatement ps = conn.prepareStatement(sql);
//		             ResultSet rs = ps.executeQuery()) {
//
//		            // Loop through the result set and add students to the list
//		            while (rs.next()) {
//		                String name = rs.getString("name");
//		                double remainingFees = rs.getDouble("remaining_fees");
//
//		                // Assuming you have a Student constructor that takes name and remaining fees
//		               // Student student = new Student(name, remainingFees);
//		                //students.add(student);
//		            }
//		        }
//		        return students;
//		    }
		    
		    ///clate last three month cureent three month::
		    public Map<String, List<Map<String, Object>>> fetchFeesData() throws SQLException {
		        String sql = "SELECT " +
		                     "  DATE_FORMAT(date_registered, '%M %Y') AS monthName, " +
		                     "  MONTH(date_registered) AS monthNum, " +
		                     "  YEAR(date_registered) AS yearNum, " +
		                     "  SUM(remaining_total) AS pendingFees, " +
		                     "  SUM(payamount) AS totalFees " +
		                     "FROM students " +
		                     "WHERE remaining_total > 0 " +
		                     "  AND payamount > 0 " +
		                     "  AND date_registered >= DATE_SUB(CURRENT_DATE, INTERVAL 6 MONTH) " +
		                     "GROUP BY YEAR(date_registered), MONTH(date_registered) " +
		                     "ORDER BY YEAR(date_registered) DESC, MONTH(date_registered) DESC";

		        // Results will be divided into two categories
		        Map<String, List<Map<String, Object>>> results = new HashMap<>();
		        List<Map<String, Object>> recentThreeMonthsData = new ArrayList<>();
		        List<Map<String, Object>> lastThreeMonthsData = new ArrayList<>();

		        try (Connection conn = DBUtil.getConnection();
		             PreparedStatement ps = conn.prepareStatement(sql);
		             ResultSet rs = ps.executeQuery()) {

		            int counter = 0;
		            while (rs.next()) {
		                Map<String, Object> data = new HashMap<>();
		             // Assuming you are fetching the monthName from the ResultSet (rs)
		                String monthName = rs.getString("monthName");

		                // Apply substring to get the first 3 characters (abbreviation)
		                if (monthName != null && monthName.length() > 3) {
		                    monthName = monthName.substring(0, 3); // Take the first 3 characters
		                }

		                // Put the abbreviated month name into the map
		                data.put("monthName", monthName);
		                data.put("pendingFees", rs.getInt("pendingFees"));
		                data.put("totalFees", rs.getInt("totalFees"));

		                // Divide into recent three months and last three months
		                if (counter < 3) {
		                    recentThreeMonthsData.add(data);
		                } else if (counter < 6) {
		                    lastThreeMonthsData.add(data);
		                }
		                counter++;
		            }
		        }

		        results.put("recentThreeMonths", recentThreeMonthsData);
		        results.put("lastThreeMonths", lastThreeMonthsData);
		        //System.out.println(results);
		        return results;
		    }


		    public static void main(String[] args) throws SQLException {
				Empdao nn=new Empdao();
				nn.fetchFeesData();
			}

}
