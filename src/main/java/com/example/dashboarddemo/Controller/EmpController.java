package com.example.dashboarddemo.Controller;


import java.io.IOException;
import java.sql.Date;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dashboarddemo.Dao.Empdao;
import com.example.dashboarddemo.Dao.MsgDao;
import com.example.dashboarddemo.Entity.Employee;
import com.example.dashboarddemo.Entity.Msg;
import com.example.dashboarddemo.Entity.Student;


import com.example.dashboarddemo.service.Empservice;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@Controller
@RestController
public class EmpController {

	
	 private  Empservice Emp;

	
	    // Constructor to inject Empservice
	    public EmpController(Empservice Emp) {
	        this.Emp = Emp;
	       
	    }
	    
	    
//	    
//	    @Autowired
//	    private AuthenticationManager authenticationManager;
//
//	    @Autowired
//	    private CustomUserDetailsService userDetailsService;
//
//	    @Autowired
//	    private JwtUtil jwtUtil;
//	    @PostMapping("/admin")
//	    public ModelAndView login(@RequestParam String email, 
//	                              @RequestParam String password, 
//	                              HttpServletResponse response, 
//	                              Model model) {
//	        try {
//	            
//	            // Validate credentials in Emp (database validation)
//	            boolean isLoggedIn = Emp.admin(email, password);
//	            if (isLoggedIn) {
//	            	// Authenticate the user
//		            authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(email, password));
//
//		            // Load user details and generate JWT token
//		            UserDetails userDetails = userDetailsService.loadUserByUsername(email);
//		            String token = jwtUtil.generateToken(userDetails.getUsername());
//		            response.setHeader("Authorization", "Bearer " + token);
//
//	                // Retrieve data for dashboard
//	                List<Student> students = Emp.getAllStudents();
//	                List<Msg> mssg = mms.selectMessages();
//	                model.addAttribute("students", students);
//	                model.addAttribute("mssg", mssg);
//	                return new ModelAndView("redirect:/dash"); // Successful login
//	            } else {
//	                model.addAttribute("error", "Invalid email or password!");
//	                return new ModelAndView("Adminlogin"); // Show login page with error message
//	            }
//	        } catch (Exception e) {
//	            model.addAttribute("error", "Authentication failed. Please try again.");
//	            return new ModelAndView("Adminlogin"); // Redirect to login on error
//	        }
//	    }
//
//	    
	    
	    @PostMapping("/admin")
	    public ModelAndView loginadmin(@RequestParam String email, @RequestParam String password, 
	    		Model model,
	    	     RedirectAttributes redirectAttributes
	    		) {
	        try {
	        	
	            boolean isLoggedIn = Emp.admin(email, password);
	            if (isLoggedIn) {
	            	
	            	  List<Student> students = Emp.getAllStudents(); 
	            	  Map<String, Integer> genderCounts = Emp.getCountByGender();
	            	  Map<String, Integer> counts = Emp.getRemainingFeesCounts();
	            	  Map<String, Integer> scount = Emp.getActiceCounts();
	            	  
	            	  System.out.println(genderCounts);
	            	  model.addAttribute("count",genderCounts);
	            	  model.addAttribute("counts",counts);
	            	  model.addAttribute("scount",scount);
	            	  System.out.println(scount);
	            	  System.out.println(counts);
	            	  model.addAttribute("students", students);
	            	  System.out.println("student data"+students);
	            	  //data from msg
	            	List<Employee> empl=Emp.getinfromation(email);
	            	model.addAttribute("empl",empl);
	            	System.out.println(empl);
	            	
	            	
	            	Map<String, List<Map<String, Object>>> threem=Emp.lastthreemonth();
	            	model.addAttribute("threem",threem);
	            	System.out.println(threem);
	            	
	            	  Map<String, Integer> count2 = Emp.getYEarCounts();
	            	  System.out.println(count2);
	            	  model.addAttribute("count2", count2);
	            	  List<Msg> mssg=mms.selectMessages();
	            	  model.addAttribute("mssg", mssg);
	            	  System.out.println("msglist"+mssg
	            			  );
	            	 
	            	  ModelAndView mav =new ModelAndView("redirect:/sample");
	                System.out.println("Login successful");
	                model.addAttribute("isLoggedIn" ,true);
	                return mav;
	                 // Redirect to the register page
	            } else {
	                System.out.println("Invalid email or password!");
	                redirectAttributes.addFlashAttribute("error", "Invalid email or password!"); // Flash attribute for redirect
	                ModelAndView ss=new ModelAndView("Adminlogin");
	                return ss; // Return to the login page
	            }
	        } catch (Exception e) {
	            System.out.println("An error occurred: " + e.getMessage());
	            redirectAttributes.addFlashAttribute("error", "An unexpected error occurred. Please try again."); // Flash attribute
	            ModelAndView ss=new ModelAndView("redirect:/Adminlogin");
	            return ss;// Return to the login page
	        }
	        
	    }

	    
	    
	 @GetMapping("/student2")
	 public ModelAndView data(Model model) throws SQLException{

	
		 List<Student> students = Emp.getAllStudents();
		 model.addAttribute("students",students);
		 System.out.println(students);
		  List<Msg> mssg=mms.selectMessages();
		  model.addAttribute("mssg", mssg);
			ModelAndView data=new ModelAndView("student");
			return data; 
	 }
	 
	 @GetMapping("/notification")
	 public ModelAndView data5(Model model) throws SQLException{

		  List<Msg> mssg=mms.selectMessages();
		  model.addAttribute("mssg", mssg);
			ModelAndView data=new ModelAndView("notification");
			return data; 
	 }
	 
	//display datafrom back
	@GetMapping("/sample")
	public ModelAndView kk(Model model) throws SQLException {
		
	 List<Student> students = Emp.getAllStudents();
	 List<Student> rem=Emp.remainingfess();
	 model.addAttribute("rem", rem);
	 Map<String, Integer> genderCounts = Emp.getCountByGender();
	  Map<String, Integer> counts = Emp.getRemainingFeesCounts();
	  Map<String, Integer> scount = Emp.getActiceCounts();
	  
	  model.addAttribute("counts",counts);
	  model.addAttribute("scount",scount);
	  model.addAttribute("count",genderCounts);
	 model.addAttribute("students",students);
	  List<Msg> mssg=mms.selectMessages();
	  
	  Map<String, List<Map<String, Object>>> threem=Emp.lastthreemonth();
  	model.addAttribute("threem",threem);
  	System.out.println(threem);
  	
	  Map<String, Integer> count2 = Emp.getYEarCounts();
	  model.addAttribute("count2", count2);
	  
	 
	  model.addAttribute("mssg", mssg);
		ModelAndView data=new ModelAndView("sample");
		return data;
		}

	@PostMapping("/post")
	 public String forget(@RequestParam String password,Model model) {

		return password;
		

	}

	 
    @GetMapping("/deleteMsg")
    public ModelAndView deleteMsg(@RequestParam("msg_id") Long msg_id, RedirectAttributes redirectAttributes) {
        try {
           mms.deleteSmsg(msg_id); // Call service to delete the student
           
           redirectAttributes.addFlashAttribute("message", " deleted successfully");
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to delete student: " + e.getMessage());
        }
        ModelAndView nn =new ModelAndView("redirect:/student");
        return nn; // Redirect to the dashboard or another appropriate page
    }
    
	
	//connecting with contact pages insert 
	@Autowired
	private MsgDao mms;
	
	@PostMapping("/msg")
	public String data(@RequestParam String s_name,@RequestParam String mobile,@RequestParam String message,@RequestParam String subject,Model model) throws SQLException {
		
		Msg meMsg =new Msg();
		meMsg.setsName(s_name);
		meMsg.setMobile(mobile);
		meMsg.setMessage(message);
		meMsg.setSubject(subject);
		
		 mms.messageStudent(meMsg);	
		System.out.println("mwssage"+mms);
		return subject;
		
	}
	
	@Autowired
	private Empdao empd;

    // Endpoint to export student details
	@GetMapping("/generateStudentReport")
	public String generateStudentExcel(
	        HttpServletResponse response,
	        HttpServletRequest request,
	        Model model) throws SQLException, IOException {

	    try {
	        // Fetch student data from the service
	        List<Student> studentList = empd.getAllStudents(); // Fetch all student data

	        // Create an Excel workbook and sheet
	        XSSFWorkbook workbook = new XSSFWorkbook();
	        XSSFSheet sheet = workbook.createSheet("student_report");

	        // Create the header row
	        Row headerRow = sheet.createRow(0);
	        headerRow.createCell(0).setCellValue("Student ID");
	        headerRow.createCell(1).setCellValue("Name");
	        headerRow.createCell(2).setCellValue("Mobile");
	        headerRow.createCell(3).setCellValue("Email");
	        headerRow.createCell(4).setCellValue("Course");
	        headerRow.createCell(5).setCellValue("Pay Mode");
	        headerRow.createCell(6).setCellValue("Status");
	        headerRow.createCell(7).setCellValue("Total Fees");
	        headerRow.createCell(8).setCellValue("Remaining Fees");
	        headerRow.createCell(9).setCellValue("Pay Amount");
	        headerRow.createCell(10).setCellValue("Aadhaar No");
	        headerRow.createCell(11).setCellValue("Parent No");
	        headerRow.createCell(12).setCellValue("Address");
	        headerRow.createCell(13).setCellValue("Date");
	        headerRow.createCell(14).setCellValue("Trainer");
	        headerRow.createCell(15).setCellValue("College Name");
	        headerRow.createCell(16).setCellValue("Stream");
	        headerRow.createCell(17).setCellValue("Gender");
	        headerRow.createCell(18).setCellValue("Consultant Name");

	        // Populate the student data
	        int rowNum = 1;
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");

	        for (Student student : studentList) {
	            Row row = sheet.createRow(rowNum++);
	            row.createCell(0).setCellValue(student.getSid());
	            row.createCell(1).setCellValue(student.getName());
	            row.createCell(2).setCellValue(student.getMobile());
	            row.createCell(3).setCellValue(student.getEmail());
	            row.createCell(4).setCellValue(student.getCourseName());
	            row.createCell(5).setCellValue(student.getPaymode());
	            row.createCell(6).setCellValue(student.getStatus());
	            row.createCell(7).setCellValue(student.getTotal());
	            row.createCell(8).setCellValue(student.getRemainingTotal());
	            row.createCell(9).setCellValue(student.getPayamount());
	            row.createCell(10).setCellValue(student.getAadharno());
	            row.createCell(11).setCellValue(student.getParentNo());
	            row.createCell(12).setCellValue(student.getAddress());
	            Date date = student.getDate_registered();
	            if (date != null) {
	                row.createCell(13).setCellValue(dateFormat.format(date)); // Format date
	            } else {
	                row.createCell(13).setCellValue(""); // Handle null case
	            }
	            row.createCell(14).setCellValue(student.getTrainer());
	            row.createCell(15).setCellValue(student.getCollegeName());
	            row.createCell(16).setCellValue(student.getStream());
	            row.createCell(17).setCellValue(student.getGender());
	            row.createCell(18).setCellValue(student.getConsultantName());
	        }

	        // Set response headers to prompt a download of the Excel file
	        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	        response.setHeader(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=student_report.xlsx");

	        // Write the workbook to the response output stream
	        workbook.write(response.getOutputStream());

	        return "excel"; // Return any appropriate view or null if not needed
	    } catch (Exception e) {
	        // Handle any exceptions
	        e.printStackTrace();
	        return "error"; // Return error page or message
	    }
	}

	
	public static void main(String[] args) throws SQLException {
		//Empdao hh=new Empdao();
		
	//	EmpController nn=new EmpController(hh);
		//nn.data("kdfkgbfd", "7418529638", "dfdsvnull","dsfgasdvasdv vdsf null", null);
		
	}
	  
	}
