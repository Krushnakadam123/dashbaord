<%@page import="com.example.dashboarddemo.Entity.Employee"%>
<%@page import="com.example.dashboarddemo.Entity.Student"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Student Infromatin</title>

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
	/* background-color: #1a3e6a; Navy blue color */
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
    top: 110px;
    right: 315px;
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
            
            border-collapse: separate; /* This ensures the borders are not collapsed, allowing border-radius to work */
		    border-spacing: 0;  /* Prevents spacing between cells */
		    width: 100%;
		    border-radius: 15px; /* Rounded corners for the entire table */
		    overflow: hidden; /* Ensures content doesn't overflow the rounded corners */
          
        }
          /* Table styling */
       
        
        th, td {
            border-radius: 2px ;
            padding: 8px;
            text-align: center;
            background-color: #f2f2f2;
            border-bottom: 1px solid #ccc; /* Adds a horizontal line between rows */
        }

        /* Horizontal line
        hr.separator {
            border: 0;
            border-top: 2px solid #ccc; /* Color and thickness of the line 
            margin: 20px 0; /* Adds space above and below the line 
        }
         */
        
     
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
    padding:1rem 1rem 1rem 17rem;
     
    }
    
   .containersearch{
   
    width: 100%;
    padding:1rem 1rem 1rem 1rem;
    background-color: white;
     border-radius: 10px;
     
    }
    
    .scrollv{
      max-height: 700px;
      max-width: 100%;
      overflow-y: auto; 
     
    }
    
    .search-bar{
    background:#f2f2f2;
     border-radius: 3px;
     margin-bottom: 5px;
    }
    
    .switch {
        position: relative;
        display: inline-block;
        width: 60px;
        height: 34px;
    }

    .switch input {
        opacity: 0;
        width: 0;
        height: 0;
    }

    .slider {
        position: absolute;
        cursor: pointer;
        top: 0;
        left: 0;
        right: 0;
        bottom: 0;
        background-color: #ccc;
        transition: 0.4s;
        border-radius: 34px;
    }

    .slider:before {
        position: absolute;
        content: "";
        height: 26px;
        width: 26px;
        border-radius: 50%;
        left: 4px;
        bottom: 4px;
        background-color: white;
        transition: 0.4s;
    }

    input:checked + .slider {
        background-color: #4CAF50;
    }

    input:checked + .slider:before {
        transform: translateX(26px);
    }

    /* Rounded slider */
    .slider.round {
        border-radius: 34px;
    }

    .slider.round:before {
        border-radius: 50%;
    }
    .export1{
   			 display: inline-flex;
   			margin-left:760px;
   			margin-bottom:5px;
            align-items: center;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #0a2351;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s;
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
                      <a class="nav-link text-white">
                        <i class="fas fa-info-circle"></i> Student Information
                      </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="employee.jsp">
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

     
    <h4 style="color: orange; font-weight: bold;">Student Information :</h4>
    
 
	  <div class="containersearch">
    <!-- Search bar -->
    <input type="text" id="searchBar" class="search-bar" placeholder="Search student by name..." onkeyup="filterStudents()">
    
    <!-- Filter dropdown -->
    <select id="statusFilter" onchange="filterStudents()">
        <option value="all">All</option>
        <option value="active">Active</option>
        <option value="inactive">Inactive</option>
    </select>
    
    <a href="generateStudentReport">
   <button class="export1"> 
    <i class="fas fa-download"></i>Export</button>
    </a>
    <div class="scrollv">
    <table>
        <thead>
            <tr>
                <th>Student ID</th>
                <th>Name</th>
                <th>Mobile</th>
                <th>Email</th>
                <th>Course</th>
                <th>Pay Mode</th>
                <th>Status</th>
                <th>Total Fees</th>
                <th>Remaining Fees</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody id="studentTableBody">
            <%
                List<Student> studentList = (List<Student>) request.getAttribute("students");
                if (studentList != null) {
                    for (Student student : studentList) {
            %>
            <tr data-id="<%= student.getSid() %>" data-name="<%= student.getName().toLowerCase() %>" data-status="<%= student.getStatus().toLowerCase() %>">
                <td><%= student.getSid() %></td>
                <td><%= student.getName() %></td>
                <td><%= student.getMobile() %></td>
                <td><%= student.getEmail() %></td>
                <td><%= student.getCourseName() %></td>
                <td><%= student.getPaymode() %></td>
                <td>
			    <label class="switch">
			    	
			        <input type="checkbox" id="statusToggle<%= student.getSid() %>" 
			               <%= "Active".equals(student.getStatus()) ? "checked" : "" %> 
			               onchange="updateStatus(<%= student.getSid() %>, this.checked)">
			        <span class="slider round"></span>
			    </label>
			    <span id="statusMessage<%= student.getSid() %>" style="display:none;"></span>
			</td>

                <td><%= student.getTotal() %></td>
                <td><%= student.getRemainingTotal() %></td>
                <td>
                    <button style="background-color: blue; color: white;" onclick="editStudent('<%= student.getSid() %>')">Edit</button>
                    <button style="background-color: green; color: white;" onclick="viewStudentDetails({ payamount: '<%= student.getPayamount() %>', aadharno: '<%= student.getAadharno() %>', gender: '<%= student.getGender() %>', trainer: '<%= student.getTrainer() %>', ParentNo: '<%= student.getParentNo() %>', Address: '<%= student.getAddress() %>', date: '<%= student.getDate_registered() %>', CollegeName: '<%= student.getCollegeName() %>', stream: '<%= student.getStream() %>', ConsultantName: '<%= student.getConsultantName() %>' })">View</button>
                </td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
</div>
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
     
     function updateStatus(sid, isActive) {
    	    const checkbox = document.getElementById("statusToggle" + sid);
    	    const messageElement = document.getElementById("statusMessage" + sid);

    	    // Show updating message
    	    messageElement.textContent = "Updating status...";
    	    messageElement.style.color = "blue";
    	    messageElement.style.display = "block";

    	    // Construct the request body
    	    const body = new URLSearchParams({
    	        sid: sid,
    	        status: isActive ? "Active" : "Inactive"
    	    });

    	    // Send the request
    	    fetch("updateStudentStatus", {
    	        method: "PUT",
    	        headers: {
    	            "Content-Type": "application/x-www-form-urlencoded"
    	        },
    	        body: body.toString()
    	    })
    	        .then(response => {
    	            if (response.ok) return response.text();
    	            throw new Error(`Error: ${response.status} ${response.statusText}`);
    	        })
    	        .then(result => {
    	            if (result.includes("success")) {
    	                messageElement.textContent = `Status updated to ${isActive ? "Active" : "Inactive"} successfully!`;
    	                messageElement.style.color = "green";
    	            } else {
    	                throw new Error(result);
    	            }
    	        })
    	        .catch(error => {
    	            console.error("Error:", error.message || error);
    	            messageElement.textContent = "Failed to update status. Please try again.";
    	            messageElement.style.color = "red";
    	            checkbox.checked = !isActive; // Revert checkbox
    	        })
    	        .finally(() => {
    	            // Hide message after 3 seconds
    	            setTimeout(() => {
    	                messageElement.style.display = "none";
    	            }, 3000);
    	        });
    	}


     function deleteStudent(sid) {
         if (confirm("Are you sure you want to delete this student?")) {
             window.location.href = 'deleteStudent?sid=' + sid;
         }
     }

     function editStudent(sid) {
         window.location.href = 'edi1.jsp?sid=' + sid;
     }

     function viewStudentDetails(student) {
         var modal = document.getElementById("studentModal");
         var modalContent = document.getElementById("modalContent");

         modalContent.innerHTML = "<h3>Student Details</h3>" +
             "<p><strong>Pay Amount:</strong> " + student.payamount + "</p>" +
             "<p><strong>Aadhaar No:</strong> " + student.aadharno + "</p>" +
             "<p><strong>Parent No:</strong> " + student.ParentNo + "</p>" +
             "<p><strong>Address:</strong> " + student.Address + "</p>" +
             "<p><strong>Date:</strong> " + student.date + "</p>" +
            "<p><strong>Trainer:</strong>" +student.trainer+"</p>"+
             "<p><strong>College Name:</strong> " + student.CollegeName + "</p>" +
             "<p><strong>Stream:</strong> " + student.stream + "</p>" +
             "<p><strong>Gender:</strong> " + student.gender + "</p>" +
             
             "<p><strong>Consultant Name:</strong> " + student.ConsultantName + "</p>";

         modal.style.display = "block";
     }

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
     
     function filterStudents() {
    	    const searchValue = document.getElementById('searchBar').value.toLowerCase();
    	    const statusFilter = document.getElementById('statusFilter').value;

    	    const rows = document.querySelectorAll('#studentTableBody tr');

    	    rows.forEach(row => {
    	        const name = row.getAttribute('data-name');
    	        const status = row.getAttribute('data-status');

    	        const matchesSearch = name.includes(searchValue);
    	        const matchesStatus = statusFilter === 'all' || status === statusFilter;

    	        if (matchesSearch && matchesStatus) {
    	            row.style.display = ''; // Show row
    	        } else {
    	            row.style.display = 'none'; // Hide row
    	        }
    	    });
    	}

     </script>
</body>
</html>