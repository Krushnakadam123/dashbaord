package com.example.dashboarddemo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.springframework.stereotype.Repository;

import com.example.dashboarddemo.Entity.Registrationallocation;

@Repository
public class Register {


    // Insert student data into the database
    public int registerStudent(Registrationallocation registrationallocation) throws SQLException {
    	  Connection conn = null;
    	    int result = 0;
    	    PreparedStatement psItem = null;

    	    try {
    	        conn = DBUtil.getConnection();
    	        conn.setAutoCommit(false); // Start transaction

    	        String sql = "INSERT INTO registrationallocation (date_registered,status,cid,sid) " +
    	                     "VALUES (?, ?,?,?)";
    	        psItem = conn.prepareStatement(sql);
    	        
    	        psItem.setDate(1, registrationallocation.getDateRegistered());
    	        psItem.setString(2,registrationallocation.getStatus());
    	      //  psItem.setLong(3, registrationallocation.getCourse().getCId());
    	        psItem.setLong(3,registrationallocation.getStudent().getSid());
    	        
    	       
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
    

}
