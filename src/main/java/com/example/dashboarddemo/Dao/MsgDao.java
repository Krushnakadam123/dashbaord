package com.example.dashboarddemo.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Repository;

import com.example.dashboarddemo.Entity.Msg;


@Repository
public class MsgDao {


    // Insert student data into the database
    public int messageStudent(Msg meMsg) throws SQLException {
    	  Connection conn = null;
    	    int result = 0;
    	    PreparedStatement psItem = null;

    	    try {
    	        conn = DBUtil.getConnection();
    	        conn.setAutoCommit(false); // Start transaction

    	        String sql = "INSERT INTO msgg (s_name, mobile,subject,message) " +
    	                     "VALUES (?, ?, ?,?)";
    	        psItem = conn.prepareStatement(sql);
    	        
    	        psItem.setString(1, meMsg.getsName());
    	        psItem.setString(2, meMsg.getMobile());
    	        psItem.setString(3, meMsg.getSubject());
    	        psItem.setString(4, meMsg.getMessage());
    	        

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
    	    }
			return result;
}
    
    // Selecting messages from the database
    public List<Msg> selectMessages() throws SQLException {
        String sql = "SELECT * FROM msgg"; // Query to select all messages
        List<Msg> messages = new ArrayList<>(); // List to hold the messages

        try (Connection conn = DBUtil.getConnection(); // Get database connection
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ResultSet rs = ps.executeQuery(); // Execute the query

            // Loop through the result set and populate the messages list
            while (rs.next()) {
                Msg message = new Msg(); // Create a new Msg object
                message.setsName(rs.getString("s_name")); // Set sender name
                message.setMobile(rs.getString("mobile")); // Set mobile number
                message.setSubject(rs.getString("subject")); // Set subject
                message.setMessage(rs.getString("message")); 
                message.setMsgId(rs.getLong("msg_id"));// Set message content
                messages.add(message); // Add Msg object to the list
            }
        }
        return messages; // Return the list of messages
    }

	public void deleteSmsg(Long msg_id) throws SQLException {
		 String sql = "DELETE FROM msgg WHERE msg_id=?";
	        try (Connection conn = DBUtil.getConnection();
	                PreparedStatement ps = conn.prepareStatement(sql)) {

	               ps.setLong(1, msg_id);
	               ps.executeUpdate();
	           }
		
	}
	
	
}
