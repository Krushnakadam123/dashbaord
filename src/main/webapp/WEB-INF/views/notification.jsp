<%@page import="com.example.dashboarddemo.Entity.Msg"%>
<%@page import="com.example.dashboarddemo.Entity.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notification</title>

 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
            font-family: Arial, sans-serif;
            background-color: #f5f5dc; /* Light cream color */
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
        background-color: #1a3e6a; /* Navy blue color */
        color: white; /* White text for contrast */
        border: none;
    }
    .btn-blue:hover {
        background-color: #15406d; /* Slightly darker blue on hover */
        color: white;
    }
           /* Close button styling */
.close {
    position: absolute;
    top: 10px;
    right: 20px;
    width: 30px;
    height: 30px;
    background-color: #f44336; /* Red background */
    color: white;
    border-radius: 50%; /* Make it circular */
    text-align: center;
    line-height: 30px; /* Center the cross vertically */
    font-size: 24px;
    font-weight: bold;
    cursor: pointer;
    transition: 0.3s;
}

.close:hover {
    background-color: #d32f2f; /* Darken on hover */
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
            width: 100%;
            border-collapse: collapse;
          
        }
        table, th, td {
            border: 1px solid black;
             background-color: #f2f2f2;
        }
        th, td {
            padding: 8px;
            text-align: left;
            
        }
        th {
            background-color: #f2f2f2;
        }
        .error {
            color: red;
        }
        #studentInfo,#trainerInfo {
            display: none;
        }

        /* Modal styling */
        .modal {
            display: none;
            position: fixed;
            z-index: 1;
            padding-top: 100px;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.4);
        }

        .modal-content {
            background-color: white;
            margin: auto;
            padding: 20px;
            border: 1px solid #888;
            width: 60%;
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
    padding:1rem 1rem 1rem 17rem}
    </style>
    <!-- Include Font Awesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
</head>
<body>
<!-- Header -->
	<nav class="navbar navbar-expand-lg" style="background-color: #1a3e6a;">
    <!-- Logo and Brand -->
    <a class="navbar-brand d-flex align-items-center" href="#">
     
     <div class=" bodyheader">
        <span class="text-white">M</span><span class="text-orange">S</sapn><span class="text-white">quare</span>
	</div>
    </a>
    
    <div class="ml-auto d-flex align-items-center">
    <!-- Notification Icon with Custom Blue Button Style -->
    <button class="btn btn-blue mx-2" aria-label="Notifications" href="notfication">
        Notification
        <i class="fas fa-bell"></i>
    </button>
   </div>

        <!-- Admin Dropdown with Blue Button -->
        <div class="dropdown d-inline-block">
            <button class="btn btn-blue dropdown-toggle d-flex align-items-center" type="button" id="adminMenu" data-toggle="dropdown">
                <span class="mr-2"><strong>krushna</strong></span>
                <br>
                <span class="badge badge-secondary">Admin</span>
            </button>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="adminMenu">
                <a class="dropdown-item" href="#">Settings</a>
                <a class="dropdown-item" href="#">Logout</a>
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
                        <a class="nav-link text-white" href="editform.jsp">
                            <i class="fas fa-user-edit"></i> Update Student
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">
                            <i class="fas fa-certificate"></i> Certificates
                        </a>
                    </li>
                </ul>
            </div>
        </nav>
        
        
    </div>
     </div>
     
     
<div class="main-contain">


<!-- Greeting Message -->
<div class="container">
    <h2 class="text-center mt-3" id="greetingMessage">Hello, here's what's happening today.</h2>
</div>
     
         <div>
    <h2>Student Message :</h2>
    <table>
        <thead>
            <tr>
                <th>Msg ID</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Subject</th>
                <th>Messages</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
        <% 
        List<Msg> msList = (List<Msg>) request.getAttribute("mssg");
        if (msList != null) {
            for (Msg msg :msList) {
        %>
        <tr>
        	<td><%= msg.getMsgId() %></td>
            <td><%= msg.getsName() %></td>
            <td><%= msg.getMobile() %></td>
            <td><%= msg.getSubject() %></td>
            <td><%= msg.getMessage() %></td>
            
            <td>  <button style="background-color: red; color: white;" onclick="deleteMsg('<%= msg.getMsgId() %>')">Delete</button></td>
            
        </tr>
        <% 
            }
        } 
        %>
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
     function deleteMsg(msg_id) {
         if (confirm("Are you sure you want to delete this msg?")) {
             window.location.href = 'deleteMsg?msg_id=' + msg_id;
         }

     function closeModal() {
         document.getElementById("studentModal").style.display = "none";
     }
     
     </script>
</body>
</html>