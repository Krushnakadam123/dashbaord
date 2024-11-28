package com.example.dashboarddemo.service;


import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.example.dashboarddemo.Dao.Empdao;
import com.example.dashboarddemo.Entity.Employee;
import com.example.dashboarddemo.Entity.Student;





@Service
public class Empservice implements studentser{

		private Empdao adm;
		 public Empservice(Empdao adm) {
		        this.adm = adm;
		    }


//
//		    @Autowired
//		    private EmoloyeeRepository userRepository;
//
//		    @Autowired
//		    private PasswordEncoder passwordEncoder;
//
//
//			
//			public void encodePlainPasswords() {
//			    List<Employee> employees = userRepository.findAll();
//			    for (Employee employee : employees) {
//			        String plainPassword = employee.getPassword();
//			        if (!plainPassword.startsWith("$2a$")) { // Check if not already BCrypt-hashed
//			            String encodedPassword = passwordEncoder.encode(plainPassword);
//			            employee.setPassword(encodedPassword);
//			            userRepository.save(employee);
//			        }
//			    }
//			}

	public boolean admin(String email, String password) throws SQLException {

		
		Employee employee=adm.validateadmin(email);
		if (employee != null) {
        	
            return employee.getPassword().equals(password); 
            // You might want to use a hashed password in a real application
        }
		return false;
       
	}


	
	 @Override
	    public List<Student> getAllStudents() throws SQLException {
	        return adm.getAllStudents(); // Call DAO method to fetch all students
	       
	    }
	    public Map<String, Integer> getCountByGender() throws SQLException {
	        Map<String, Integer> genderCount = new HashMap<>();
	        genderCount.put("Male",adm.countStudentsByGender("Male"));
	        genderCount.put("Female", adm.countStudentsByGender("Female"));
	       
	        return genderCount;
	    }
	    
	    
	    public List<Student> remainingfess() throws SQLException {
	        List<Student> students = adm.getAllStudents(); // Fetch all students

	        for (Student student : students) {
	            // Check if the remaining fees are not equal to zero
	            if (student.getRemainingTotal() != 0) {
	                // Print the student's name and remaining fees
	                 student.getName();
	                 student.getRemainingTotal();

	            	}
	            }
	        return students;
	    }
	    
	    ///getting infroMTION
		public List<Employee> getinfromation(String email) throws SQLException {
			
			return adm.getdataemp(email);
		}
		
		  public Map<String, Integer> getRemainingFeesCounts() throws SQLException {
		        return adm.countRemainingFeesByMonth();
		    }
		  public Map<String, Integer> getActiceCounts() throws SQLException {
			  return adm.countActiveStudentsByMonth();
		  }
		  
		 //year wise data
		  
		  public Map<String, Integer> getYEarCounts() throws SQLException {
			  return adm.countRemainingFeesByYear() ;
		  }
		  
		  //bar for three month and last three month
		 public Map<String, List<Map<String, Object>>> lastthreemonth() throws SQLException {
			 return adm.fetchFeesData();
		} 
		  
		  

}