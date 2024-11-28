<%@page import="com.example.dashboarddemo.Entity.Employee"%>
<%@page import="com.example.dashboarddemo.Entity.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EMP Infromatin</title>

 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
            font-family: Arial, sans-serif;
            background-color:#e0fbfc; /* Light cream color */
        }
          
   .bodyheader{
   margin-left: 16rem;
    }
        .navbar-brand .logo {
            height: 40px;
            margin-right: 10px;
        }
        
         .sidebar {
          position :absolute;
         top:0;
         left:0;
        background-color: #343a40;
        height: 130vh;
    }

    .sidebar .nav-link {
        color: #adb5bd;
    }

    .sidebar .nav-link:hover,
    .sidebar .nav-link.active {
        color: #ffffff;
        background-color: #495057;
        border-radius: 5px;
    }
        
      
        .sidebar h6 {
            color: #ddd;
            padding: 15px 0 5px 20px;
        }
        .card {
            border: none;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
		       	
        .navbar {
            background-color: #1a3e6a; /* Faint navy blue */
        }
        .card-header, .bg-primary {
            background-color: #DEB759; /* Light blue for bg-primary */
            color: #003366; /* Darker text color for contrast */
        }
        
        .bg-orange {
            background-color:#FFC300;
        }
    
        .bg-or {
            background-color:#DAF7A6;
        }
        
         .btn-blue {
        /*  background-color: #1a3e6a; Navy blue color */
        color: white; /* White text for contrast */
        border: none;
    }
    .btn-blue:hover {
        background-color: #15406d; /* Slightly darker blue on hover */
        color: white;
    }
     
         .buttons {
            margin: 20px 0;
        }
        .buttons button {
            padding: 10px 20px;
            margin-right: 10px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        
        .buttons button:hover {
            background-color: #45a049;
        }
        table {
            
            border-collapse: separate; /* This ensures the borders are not collapsed, allowing border-radius to work */
		    border-spacing: 0;  /* Prevents spacing between cells */
		    width: 100%;
		    border-radius: 15px; /* Rounded corners for the entire table */
		    overflow: hidden; /* Ensures content doesn't overflow the rounded corners */
          
        }
         th, td {
             border-radius: 2px ;
            padding: 9px;
            text-align: center;
            background-color: #f2f2f2;
            border-bottom: 1px solid #ccc; /* Adds a horizontal line between rows */
      
        }
     
      
          .logos{
    display:flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    height: 80px;
     
    }
    .logos img{
    width:100%;
    height: 100%;
    opacity: 0.5;
    }
    
    .main-contain{
   
    width: 100%;
    padding:1rem 1rem 1rem 17rem
    }
 
    </style>
    <!-- Include Font Awesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<!-- Header -->
	<nav class="navbar navbar-expand-lg" style="background-color:#0077b6; height: 70px;">
    <!-- Logo and Brand -->
    <a class="navbar-brand d-flex align-items-center" href="#">
     
     <div class=" bodyheader">
        <span class="text-white">MSquare</span>
	</div>
    </a>
    
    <div class="ml-auto d-flex align-items-center">
    <!-- Notification Icon with Custom Blue Button Style -->
     <form action="notification" method="get">
    <button class="btn btn-blue mx-2" aria-label="Notifications">
        Notification
        <i class="fas fa-bell"></i>
    </button>
    </form>
   </div>

        <!-- Admin Dropdown with Blue Button -->
        <div class="dropdown d-inline-block">
            <button class="btn btn-blue dropdown-toggle d-flex align-items-center" type="button" id="adminMenu" data-toggle="dropdown">
                             
       <%
      
       List<Employee> empList = (List<Employee>) request.getAttribute("empl");
		  if (empList != null) {
				   for (Employee st : empList) {
					   
			%>  <span class="mr-2"><strong><%= st.getName() %></strong></span>
			
			
			<%
				   }
		  }	   
			%>
                <br>
                <span class="badge badge-secondary">Admin</span>
            </button>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="adminMenu">
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item" onclick="logout">Logout</a>
            </div>
        </div>
    </div>
</nav>



<!-- Sidebar and Main Content -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        <nav class="col-md-2 d-none d-md-block sidebar bg-dark">
            <div class="sidebar-sticky">
                 <a class="navbar-brand d-flex align-items-center logos" href="#">
        <img src="img/msicon.jpg" alt="Msquare Logo" class="">
       
    </a>
                <ul class="nav flex-column mt-4">
                    <li class="nav-item">
                        <a class="nav-link active text-white" onclick="cancelstudent()">
                            <i class="fas fa-tachometer-alt"></i> Dashboard
                        </a>
                    </li>
					<li class="nav-item ">
					 <form action="student" method="get">
                      <a class="nav-link text-white" href="student2"> 
                        <i class="fas fa-info-circle"></i> Student Information
                      </a>
                       </form>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">
                            <i class="fas fa-users"></i> Employees
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="register1.jsp">
                            <i class="fas fa-user-plus"></i> Student Register
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="edi1.jsp">
                            <i class="fas fa-user-edit"></i> Update Student
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">
                            <i class="fas fa-certificate"></i> Certificates
                        </a>
                    </li>
                    
                      <li class="nav-item">
                        <a class="nav-link active text-white" href="Adminlogin.jsp">
                            <i class="fas fa-sign-out-alt"></i> Logout
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        
        
    </div>
     </div>
     
     
<div class="main-contain">


<!-- Greeting Message 
<div class="container">
    <h2 class="text-center mt-3" id="greetingMessage">Hello, here's what's happening today.</h2>
</div>  -->
     
         <div class="scrollv">
       <h4 style="color: orange; font-weight: bold;">Emp Information :</h4>

        <table>
            <thead>
                <tr>
                    <th>EmpID</th>
                    <th>Name</th>
                    <th>Mobile</th>
                    <th>Email</th>
                    <th>Aadhar no</th>
                    <th>Role</th>
                    <th>joining date</th>
                    <th>Status</th>
                    <th>Experience</th>
                    <th>Actions</th>
                </tr>
            </thead>
         <tbody>
         <tr>
         	<td>2</td>
            <td>Chaitanya</td>
            <td>9785463634</td>
            <td>xyz@gamil.com</td>
            <td>987456123098</td>
           <td>Angular Devloper</td>
           <td>2022-12-10</td>
            <td>Active</td>
            <td>2 year</td>
            <td>-</td>
		 </tr> 
         <tr>
         	<td>4</td>
            <td>Krushna kadam</td>
            <td>9785463564</td>
            <td>krushnakadam@gamil.com</td>
            <td>987455563098</td>
           <td>Java Devloper</td>
           <td>2024-09-10</td>
            <td>Active</td>
            <td>2 Month</td>
            <td>-</td>
		 </tr> 
         <tr>
         	<td>3</td>
            <td>Suraj Chaudhari</td>
            <td>7785463634</td>
            <td>surajdskfj@gamil.com</td>
            <td>777756123098</td>
           <td>BDA</td>
           <td>2024-12-10</td>
            <td>Active</td>
            <td>1 year</td>
            <td>-</td>
		 </tr> 
         <tr>
         	<td>5</td>
            <td>Rishika</td>
            <td>9785463634</td>
            <td>garishik@gamil.com</td>
            <td>987456123098</td>
           <td>HR</td>
           <td>2022-12-10</td>
            <td>Active</td>
            <td>2 year</td>
            <td>-</td>
		 </tr> 
		    
            </tbody>
        </table>
    </div>
    </div>    
  
     
       <!-- Modal for student details -->
    <div id="studentModal" class="modal">
        <div class="modal-content" id="modalContent">
            <!-- Dynamic content will be inserted here -->
        </div>
        <span class="close" onclick="closeModal()">&times;</span>
    </div>
     
     
     <script >
     
    
     function closeModal() {
         document.getElementById("studentModal").style.display = "none";
     }
     function cancelstudent() {
         // Redirect to the desired page (e.g., dashboard)
         window.location.href = 'sample'; // Adjust the URL as needed
     }
     function logout() {
         // Redirect to the desired page (e.g., dashboard)
         window.location.href = 'Adminlogin'; // Adjust the URL as needed
     }
     </script>
</body>
</html>