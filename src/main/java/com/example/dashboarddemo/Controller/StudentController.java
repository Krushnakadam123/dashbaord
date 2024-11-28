package com.example.dashboarddemo.Controller;



import java.sql.SQLException;
import java.time.LocalDate;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.NoSuchElementException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.example.dashboarddemo.Dao.StudentDao;
import com.example.dashboarddemo.Entity.Course;
import com.example.dashboarddemo.Entity.Registrationallocation;
import com.example.dashboarddemo.Entity.Student;
import com.example.dashboarddemo.service.Registerssev;
import com.example.dashboarddemo.service.StudentSe;
import com.example.dashboarddemo.service.StudentService;






@RestController
@Controller
public class StudentController {


    private static StudentService studentService = new StudentService();
    
    private static Registerssev register=new Registerssev();
    @Autowired
    public StudentController(StudentService studentService, Registerssev registerService) {
        this.studentService = studentService;
        this.register = registerService; // Initialize the registerService
    }
    @PostMapping("/registerStudent")
    public ModelAndView registerStudent(
        @RequestParam String name,
        @RequestParam String mobile,
        @RequestParam String email,
        @RequestParam String aadharno,
        @RequestParam String password,
        
        @RequestParam String parent_no,
        @RequestParam String college_name,
        @RequestParam String stream,
        @RequestParam Long cid,
        @RequestParam String paymode,
        @RequestParam String trainer,
        @RequestParam String gender,
        @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date_registered,

        @RequestParam String consultant_name,
        @RequestParam String address,
        @RequestParam String status,
        
        @RequestParam Double total,
        @RequestParam Double payamount,
        @RequestParam Double remaining_total,
        @RequestParam String course_name,
        Model model) throws SQLException {

    	 // Convert LocalDate to java.sql.Date if needed
        java.sql.Date sqlDate = java.sql.Date.valueOf(date_registered);
        // Check if date_registered is not null and is a valid date
       // System.out.println("Date Registered: " + date_registered);

    	   Course course = studentService.getCourseById(cid);
        // Create and populate the Student object
        Student student = new Student();
       
        student.setName(name);
        student.setMobile(mobile);
        student.setEmail(email);
        student.setGender(gender);
        student.setDate_registered(sqlDate);
        student.setConsultantName(consultant_name);
        student.setPayamount(payamount);
        student.setTrainer(trainer);
        student.setAadharno(aadharno);
        student.setPassword(password);
        student.setAddress(address);
        student.setParentNo(parent_no);
        student.setCollegeName(college_name);
        student.setStream(stream);
        student.setCourse(course);
        student.setPaymode(paymode);
        student.setStatus(status);
        student.setTotal(total);
        student.setRemainingTotal(remaining_total);
        student.setCourseName(course_name);
        
      
        // Call the service to save the student
        boolean isRegistered = studentService.registerStudent(student);
        
        System.out.println("ljdsbhfjuvj");
       
       
        if (isRegistered) {
            model.addAttribute("message", "Student registered successfully!");
        } else if (studentService.isStudentExists(student.getEmail(), student.getMobile(), student.getAadharno())) {
            model.addAttribute("message1", "Email, mobile number, or Aadhaar number already exists!");
        } else {
            model.addAttribute("error", "Failed to register student.");
        }
     
        ModelAndView nn =new ModelAndView("redirect:/sample");
        return nn; // Redirect to the dashboard or another appropriate page

         // Return to index.jsp or another view after registration
    } 

//update
  
    @PutMapping("/updateStudentStatus")
    @ResponseBody
    public String updateStudentStatus(@RequestParam(required = true) Long sid, @RequestParam String status) throws SQLException {
        try {
        	  // Log the parameters for debugging
            System.out.println("SID: " + sid);
            System.out.println("Status: " + status);
            // Update the student status
            boolean isUpdated = studentService.updatesatust(sid, status);
            if (isUpdated) {
                return "success"; // Return success message
            } else {
                return "error: No student found with the given SID.";
            }
        } catch (SQLException e) {
            // Log error and return a meaningful message
            return "error: An unexpected error occurred. Please try again.";
        }
    }



    @Autowired
    private StudentSe studentser;
 // Get student by ID for editing
    
    @PostMapping("/edit")
    @ResponseBody
    public Map<String, String> getStudentById(@RequestParam("sid") Long sid,  @RequestParam String name,
            @RequestParam String mobile,
            @RequestParam String email,
            @RequestParam String aadharno,
            @RequestParam String password,
            
            @RequestParam String parent_no,
            @RequestParam String college_name,
            @RequestParam String stream,
            @RequestParam Long cid,
            @RequestParam String paymode,
            @RequestParam String trainer,
            @RequestParam String gender,
            @RequestParam @DateTimeFormat(pattern = "yyyy-MM-dd") LocalDate date_registered,

            @RequestParam String consultant_name,
            @RequestParam String address,
            @RequestParam String status,
            
            @RequestParam Double total,
            @RequestParam Double payamount,
            @RequestParam Double remaining_total,
            @RequestParam String course_name, Model model) throws SQLException {
    	
    	
    	 // Convert LocalDate to java.sql.Date if needed
        java.sql.Date sqlDate = java.sql.Date.valueOf(date_registered);
        // Check if date_registered is not null and is a valid date
       // System.out.println("Date Registered: " + date_registered);

    	   Course course = studentService.getCourseById(cid);
        // Create and populate the Student object
        Student student = new Student();
       
        student.setName(name);
        student.setMobile(mobile);
        student.setEmail(email);
        student.setGender(gender);
        student.setDate_registered(sqlDate);
        student.setConsultantName(consultant_name);
        student.setPayamount(payamount);
        student.setTrainer(trainer);
        student.setAadharno(aadharno);
        student.setPassword(password);
        student.setAddress(address);
        student.setParentNo(parent_no);
        student.setCollegeName(college_name);
        student.setStream(stream);
        student.setCourse(course);
        student.setPaymode(paymode);
        student.setStatus(status);
        student.setTotal(total);
        student.setRemainingTotal(remaining_total);
        student.setCourseName(course_name);
        
        
        boolean isRegistered=  studentService.updateStudent(sid,student );
         studentService.getempl();
         System.err.println("dfds");

         Map<String, String> response = new HashMap<>();
        if (isRegistered) {
        	  response.put("status", "success");
              response.put("message", "Student updated successfully!");
              //response.put("student", student);
           
           // return "edi1"; // JSP page for editing student
        } else {
        	 response.put("status", "error");
             response.put("message", "Student update failed! Please try again.");
        }
        return response;
        // Return a JSON response to the frontend
    }

    // Update student information
    @PostMapping("/update")
    public String updateStudent(@ModelAttribute Student student) {
        studentser.updateStudent(student);
        return "redirect:/students"; // Redirect back to students list after update
    }
    
    @GetMapping("/deleteStudent")
    public ModelAndView deleteStudent(@RequestParam("sid") Long sid, RedirectAttributes redirectAttributes) {
        try {
           studentService.deleteStudent(sid); // Call service to delete the student
           
           redirectAttributes.addFlashAttribute("message", "Student deleted successfully");
            
        } catch (Exception e) {
            redirectAttributes.addFlashAttribute("error", "Failed to delete student: " + e.getMessage());
        }
        ModelAndView nn =new ModelAndView("redirect:/sample");
        return nn; // Redirect to the dashboard or another appropriate page
    }
    
    
    
	
	  @GetMapping("/new") 
	  public ModelAndView showLoginForm(@RequestParam String email,Model model) { 
		  
		  List<Student> students= studentService.getinfromation(email);
          List<Registrationallocation>rep= studentService.getempl();
          
          model.addAttribute("students" ,students);
          model.addAttribute("rep",rep);
		  
		ModelAndView ss =new ModelAndView("new");
		
		return ss;
       
	   }
	
	  @PostMapping("/slogin")
	  public ModelAndView loginStudent(@RequestParam String email, @RequestParam String password,Model model) {
	      try {
	          boolean isLoggedIn = studentService.loginStudent(email, password);
	          
	          if (isLoggedIn) {
	              // Successful login
	              System.out.println("Login successful!");

	              // Fetch student information and assign trainer
	              List<Student> students = studentService.getinfromation(email);
	              List<Registrationallocation> rep = studentService.getempl();

	              // Store the information in the session
	              model.addAttribute("students", students);
	              model.addAttribute("rep", rep);

	              System.out.println(students);
	              System.out.println(rep);

	              // Redirect to the dashboard page
	              return new ModelAndView("new");
	          } else {
	              System.out.println("Invalid email or password!");
	              // Failed login
	              model.addAttribute("error", "Invalid email or password!");
	              return new ModelAndView("redirect:/slogin");
	          }
	      } catch (SQLException e) {
	          System.out.println("An error occurred during login: " + e.getMessage());
	          model.addAttribute("error", "An unexpected error occurred. Please try again.");
	          return new ModelAndView("redirect:/slogin");
	      }
	  }

	  
	public static void main(String[] args) throws SQLException {
		
		StudentController nn=new StudentController(studentService, register);
		nn.updateStudentStatus(2l, "Inactive");
	}
	  
	  
//    public static void main(String[] args) {
//    	 Course course = new Course();
//         course.setCId(4L); // Assign a valid course ID
//         
//         // Create a new Student object
//         Student student = new Student();
//         student.setName("Sachin Agarwal");
//         student.setMobile("1234567890");
//         student.setEmail("john.doe@example.com");
//         student.setAadharno("123456789012");
//         student.setPassword("password123");
//         student.setAddress("123 Main Street");
//         student.setParentNo("9876543210");
//         student.setCollegeName("ABC College");
//         student.setStream("Computer Science");
//         student.setCourse(course); // Associate with the Course entity
//         student.setPaymode("Online");
//         student.setStatus("Active");
//         student.setTotal(5000.00);
//         student.setRemainingTotal(2000.00);
//         student.setCourseName("CProgramming");
//
//         // Register the student using the StudentService
//         boolean isRegistered = studentService.registerStudent(student);
//         if (isRegistered) {
//             System.out.println("Student registered successfully!");
//         } else {
//             System.out.println("Failed to register student.");
//         }
//     }

    @GetMapping("/error")
    public String handleError() {
        // You can log the error details here if needed
        return "error"; // Returns the "error" view (error.html or error.jsp)
    }

}
