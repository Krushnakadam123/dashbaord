<%@page import="com.example.dashboarddemo.Entity.Registrationallocation"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.example.dashboarddemo.Entity.Student"%>

<%@ page import="java.util.List" %>

<!DOCTYPE html>


<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0"> 
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <title>Dashboard</title>
    <style>
          /* Body and wrapper setup for flexbox layout */
        body, html {
            height: 100%;
            margin: 0;
        }


        /* Content should expand to take remaining space, pushing the footer down */
        .content {
            flex: 1;
            margin-left: 270px; /* Leave space for the sidebar */
            padding: 20px;
            overflow-y: auto; /* Enable vertical scroll for the content if needed */
        }

        /* Sidebar styles */
        .sidebar {
            width: 250px;
            background-color: #f8f9fa;
            padding: 20px;
            height: 100vh;
            position: fixed;
        }

        .sidebar img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            display: block;
            margin: 0 auto;
        }

        .sidebar .info {
            text-align: center;
            margin-top: 20px;
        }
        .msquare-text {
  font-size: 1.5rem; /* Adjust size as needed */
  font-weight: bold; /* Make it bold if desired */
}


        /* Wrapper to hold the main content and footer */
        .wrapper {
            min-height: 100%;
            display: flex;
            flex-direction: column;
        }

        /* Footer */
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
            text-align: center;
        }
    </style>
</head>
<body>
    <nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="#">
        <img src="img/area.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
 		 <span class="msquare-text">MSquare</span>
        </a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ml-auto">
                <li class="nav-item"><a class="nav-link" onclick="cancelstudent()">Home</a></li>
                <li class="nav-item"><a class="nav-link" href="enrollment.jsp">Enrollment</a></li>
                <li class="nav-item"><a class="nav-link" href="resource.jsp">Resources</a></li>
                <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
                <li class="nav-item"><a class="nav-link" href="course.jsp">Courses</a></li>
                <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
              	<li class="nav-item"><a class="nav-link btn btn-primary" href="logout">LogOut</a></li>

            </ul>
        </div>
    </nav>

    <!-- Sidebar Section -->
    <div class="sidebar">
        <img src="img/student.png" alt="Profile Picture">
        
       <%
      
       List<Student> studentList = (List<Student>) request.getAttribute("students");
		  if (studentList != null) {
				   for (Student student : studentList) {
					   
			%>  
        <div class="info">
            <h4><%= student.getName() %></h4>
            <p><%= student.getMobile() %></p>
        </div>
        <div class="btn-group">
            <button class="btn btn-info" onclick="showInfo()">Show Info</button>
            <button class="btn btn-secondary" onclick="showCourses()">Show Courses</button>
        </div>
    </div>

    <!-- Content Section -->
    <div class="content">
        <!-- Info Section -->
        <div class="details" id="info" style="display:none;">
            <h5>Personal Details:-</h5>
            <p><strong>Name:</strong><%= student.getName() %></p>
            <p><strong>Mobile:</strong><%= student.getMobile() %></p>
            <p><strong>E-Mail:</strong><%= student.getEmail() %></p>
            <p><strong>Aadhaar No:</strong> <%= student.getAadharno() %></p>
            <p><strong>Parent's Contact No:</strong> <%= student.getParentNo() %></p>
            <p><strong>Address:</strong> <%= student.getAddress() %></p>
           
         
             <p><strong>Date Registered:</strong><%= student.getDate_registered() %></p>
        
            
            <p><strong>College Name:</strong> <%= student.getCollegeName() %></p>
            <p><strong>Stream:</strong> <%= student.getStream() %></p>
        </div>

        <!-- Courses Section -->
        <div class="courses" id="courses" style="display:none;">
            <h5>Course Details:-</h5>
            <p><strong>Course Name:</strong> <%= student.getCourseName() %></p>
            <p><strong>Trainer:</strong><%= student.getTrainer() %></p>
            <p><strong>Total Fee:</strong> <%= student.getTotal() %></p>
            <p><strong>Remaining Fee:</strong><%= student.getRemainingTotal() %></p>
            <p><strong>Paid Amount:</strong><%= student.getPayamount() %></p>
            <p><strong>Consultant Name:</strong><%= student.getConsultantName() %></p>
        </div>
                  
<%
        }
    }
%>
    </div>

    <!-- JavaScript for toggling visibility -->
    <script>
        function showInfo() {
            document.getElementById("info").style.display = "block";
            document.getElementById("courses").style.display = "none";
        }
        
        function showCourses() {
            document.getElementById("info").style.display = "none";
            document.getElementById("courses").style.display = "block";
        }
        function cancelstudent() {
            // Redirect to the desired page (e.g., dashboard)
            window.location.href = 'new'; // Adjust the URL as needed
        }
    </script>
    
    <!-- Footer Section -->
    <footer class="text-center">
        <p>&copy; 2024 MSquare. All Rights Reserved.</p>
        <p>
            <a href="#">Privacy Policy</a> |
            <a href="#">Terms of Service</a>
        </p>
    </footer>
</body>
</html>
