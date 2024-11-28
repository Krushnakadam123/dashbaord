<!DOCTYPE html>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.example.dashboarddemo.Entity.Employee"%>
<%@page import="com.example.dashboarddemo.Entity.Student"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e0fbfc; /* Light blue color */
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
        height: 140vh;
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
        /* Card Styling */
        .card {
            border: none;
            border-radius: 9px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 1rem;
            border-radius: 15px;
        }

        .card-header {
            background-color: #DEB759;
            color: #003366;
            font-weight: bold;
            border-radius: 15px;
        }

        /* Row Styling for Student Information */
        .student-row {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px 0;
            border-bottom: 1px solid #ddd;
        }

        .student-name, .student-fees {
            font-weight: bold;
            color: #333;
        }

        /* Button */
        .pay-btn {
            background-color: #28a745;
            color: white;
            border: none;
            padding: 5px 10px;
            border-radius: 5px;
            font-size: 0.9rem;
            cursor: pointer;
        }
        .pay-btn:hover {
            background-color: #218838;
        }

        /* Background colors */
        .bg-primary {
            background-color: #DEB759;
            color: #003366;
        }
        .bg-or {
     	
            background-color:#72A0C1;
        }
        
         .btn-blue {
      
        color: white; /* White text for contrast */
        border: none;
        
    }
    .btn-blue:hover {
        background-color: #15406d; /* Slightly darker blue on hover */
        color: white;
    }
    
   .bodyheader{
   margin-left: 16rem;
    }
     /* Alternating row colors */
     
     table {
    border-collapse: separate; /* Ensures borders are not collapsed, allowing border-radius to work */
    border-spacing: 0;  /* Prevents spacing between cells */
    width: 100%;
    border-radius: 15px; /* Rounded corners for the entire table */
    overflow: hidden; /* Ensures content doesn't overflow the rounded corners */
}
    tbody tr:nth-child(even) {
        background-color: #f8f9fa; /* Light gray for even rows */               
    }

    tbody tr:hover {
        background-color: #e9ecef; /* Light hover color */
        cursor: pointer; /* Change cursor on hover */
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
    
    .student-card {
    
            border-radius: 15px;
            border: 1px solid #eee;
            border-radius: 8px;
            padding: 15px;
            background-color: #f8f8f5; /* Light beige background */
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 0.2rem;
        }

        /* Name and Type Styling */
        .student-name {
            font-size: 0.9rem;
            
            color: #333;
        }

        .student-type {
            font-size: 0.9rem;
            color: #888; /* Light gray for type */
            font-style: italic;
        }

        /* Amount Styling */
        .student-fees {
            font-size: 0.9rem;
          
            color: #333;
        }

        /* Button Styling */
        .pay-btn {
            background-color: #26a69a;
            color: white;
            border-radius: 15px;
            padding: 5px 12px;
            font-size: 0.9rem;
            border: none;
            cursor: pointer;
        }
        
        .pay-btn:hover {
            background-color: #219d8e;
        }
    
     /* Scrollable container styling */
        .scrollable-container {
            max-height: 760px; /* Adjust the max height as needed */
            overflow-y: auto;
            border: 1px solid #ddd;
            padding: 10px;
            border-radius: 8px;
            background-color: #fdfdfd;
        }
         /* Search bar styling */
        .search-bar {
            margin-bottom: 15px;
            padding: 8px;
            width: 100%;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .bg-orange {
    background-color:#007FFF; /* Hex code for navey */
    
   
}
    .greeeting{
    left:20px;
    font-size: 1rem;
    margin: 20px;
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
      <!--    <img src="img/msicon.jpg" alt="Msquare Logo" class="logo mr-2"> -->
        <span class="text-white bodyheader">Msquare</span>
    </a>
    
    <div class="ml-auto d-flex align-items-center">
    <!-- Notification Icon with Custom Blue Button Style -->
     <form action="notification" method="get">
    <button class="btn btn-blue mx-2" aria-label="Notifications" >
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
                <a class="dropdown-item" href="Adminlogin.jsp">Logout</a>
            </div>
        </div>
   
</nav>
	
       
        <!-- Display success or error message if present -->
        <!-- Display success or error message if present -->
    <% 
        String message = (String) request.getAttribute("message");
        if (message != null) { 
    %>
        <div class="alert alert-success">
            <%= message %>
        </div>
    <% 
        }

        String message1 = (String) request.getAttribute("message1");
        if (message1 != null) { 
    %>
        <div class="alert alert-warning">
            <%= message1 %>
        </div>
    <% 
        }

        String error = (String) request.getAttribute("error");
        if (error != null) { 
    %>
        <div class="alert alert-danger">
            <%= error %>
        </div>
    <% 
        }
    %>

<!-- Greeting Message -->

    <h6 class=" greeeting col-md-10 ml-sm-auto col-lg-10 px-4" >Good Aternoon,<br>here's what's happening today.</h6>




<!-- Sidebar and Main Content -->
<div class="container-fluid">
    <div class="row">
        <!-- Sidebar -->
        
        <nav class="col-md-2 d-none d-md-block sidebar  bg-dark">
            <div class="sidebar-sticky">
             <a class="navbar-brand d-flex align-items-center logos" href="#">
        <img src="img/msicon.jpg" alt="Msquare Logo" class="">
       
    </a>
                <ul class="nav flex-column mt-4">
                    <li class="nav-item">
                        <a class="nav-link active text-white" href="#">
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
                        <a class="nav-link text-white" href="certificate.jsp">
                            <i class="fas fa-certificate"></i> Certificates
                        </a>
                    </li>
                </ul>
            </div>
        </nav>

        <!-- Main Dashboard Content -->
        <main role="main" class="col-md-10 ml-sm-auto col-lg-10 px-4">
            <div class="row">
                <!-- Left Sidebar: Pending Fees Section -->
          
             
                <div class="col-md-3">
            
                 <div class="scrollable-container">
                           
                           <h6> Student Leads</h6>
             <!-- Search bar -->
        <input type="text" id="searchBar" class=" search-bar" placeholder="Search student by name...">
                
	                       <% 
	            List<Student> studentList = (List<Student>) request.getAttribute("rem");
	            if (studentList != null) {
	                for (Student student : studentList) {
	                    if (student.getRemainingTotal() > 0) { // Only display if remaining fees is greater than zero
	        %>
	        
	        <!--  i am here changing the there data-id we change -->
	        <div class="student-card" data-id="<%= student.getSid() %>"data-name="<%= student.getName().toLowerCase() %>">
	            <div>
	                <span class="student-name"><%= student.getName() %></span>
	             <!--   <span class="student-type">(Proprietorship)</span>  -->
	                <div class="student-fees">&#8377; <%= student.getRemainingTotal() %></div>
	            </div>
	            <button class="pay-btn">pay</button>
	        </div>
	        <% 
	                }
	            }
	            }
	        %>
                </div>
                 </div>
                
             

                <!-- Middle Section: Student Statistics and Trainer Section -->
                <div class="col-md-6">
                    <!-- Student Statistics Bar Chart -->
                    <div class="card mb-3">
                        <div class="card-header bg-primary text-white">Student Statistics</div>
                        <div class="card-body">
                        
                        
        			<button id="currentThreeMonthsBtn" class="btn btn-primary">First 3 Months</button>
    			    <button id="lastThreeMonthsBtn" class="btn btn-secondary">Last 3 Months</button>
                           
                             <!-- Canvas for the chart -->
       						 <canvas id="monthlyChart"></canvas>  
                        </div>
                    </div>              

                <!-- Trainer Section -->
               
                    <div class="card mb-3" >
                        <div class="card-header bg-primary text-white">Trainer :</div>
                        <div class="card-body">
                            <!-- Wrapper for horizontal scroll -->
                            <div style="overflow-x:auto;height :350px;  overflow-y: auto;">
                                <table class="table table-bordered">
                                    <thead>
                                        <tr>
                                            <th>Name</th>
                                            <th>Course Assigned</th>
                                            <th>Batch</th>
                                            <th>Expertise</th>
                                            <th>Experience</th>
                                            <th>Contact No</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Ritesh Sir</td>
                                            <td>JavaScript</td>
                                            <td>Batch A</td>
                                            <td>Web Development, Data Science</td>
                                            <td>5 years</td>
                                            <td>1234567893</td>
                                        </tr>
                                        <tr>
                                            <td>Chaitaniya</td>
                                            <td>Angular, JavaScript</td>
                                            <td>Batch B</td>
                                            <td>Data Science</td>
                                            <td>3 years</td>
                                            <td>1234567893</td>
                                        </tr>
                                        
                                        <tr>
                                            <td>Priynka</td>
                                            <td>nodejs, JavaScript</td>
                                            <td>Batch B</td>
                                            <td>Data Science</td>
                                            <td>3 years</td>
                                            <td>1234567893</td>
                                        </tr>
                                        <tr>
                                            <td>Rishika</td>
                                            <td>C,html,CSS JavaScript</td>
                                            <td>Batch B</td>
                                            <td>Data Science</td>
                                            <td>3 years</td>
                                            <td>1234567893</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Right Sidebar: Stats Panels -->
                <aside class="col-md-3">
                    <!-- Stats Panels -->
                    
                    
                                   <%
			 
                Map<String, Integer> map2=(Map<String, Integer>) request.getAttribute("counts");
			    // Fetching the current and last month's pending fees
			    Integer currentMonthFee = map2 != null ? map2.get("currentMonthRemaining") : 0;
			    Integer lastMonthFee = map2 != null ? map2.get("lastMonthRemaining") : 0;
			%>
			<div class="card bg-orange text-dark mb-3">
			    <div class="card-body" style="color: #00FFFF">
			        <h5>Pending Fees</h5>
			        <div class="row">
			            <div class="col-5 text-center">
			                <span>Current Month:</span>
			                <strong class="d-block">RS.<%= currentMonthFee %></strong>
			            </div>
			            <div class="col-2 d-flex justify-content-center align-items-center">
			                <div style="border-left: 2px solid #adb5bd; height: 100%;"></div>
			            </div>
			            <div class="col-5 text-center">
			                <span>Last Month:</span>
			                <strong class="d-block">RS.<%= lastMonthFee %></strong>
			            </div>
			        </div>
			    </div>
			</div>
                    

								<%
			    Map<String, Integer> counts = (Map<String, Integer>) request.getAttribute("count");
			    Integer maleCount = counts != null ? counts.get("Male") : 0;
			    Integer femaleCount = counts != null ? counts.get("Female") : 0;
			%>
			<div class="card bg-or text-dark mb-3">
			    <div class="card-body"  style=" color:#00308F;">
			        <h5>Student Count:</h5>
			        <div class="row">
			            <div class="col-5 text-center">
			                <span>Male:</span>
			                <strong class="d-block"><%= maleCount %> </strong>
			            </div>
			            <div class="col-2 d-flex justify-content-center align-items-center">
			                <div style="border-left: 2px solid #adb5bd; height: 100%;"></div>
			            </div>
			            <div class="col-5 text-center">
			                <span>Female:</span>
			                <strong class="d-block"><%= femaleCount %></strong>
			            </div>
			        </div>
			    </div>
			</div>
				<%
				Map<String, Integer> map =(Map<String, Integer>) request.getAttribute("scount");
			    // Fetching the current and last month's active students
			    Integer currentMonthActive = map != null ? map.get("currentMonthActive") : 0; 
			    Integer lastMonthActive = map != null ? map.get("lastMonthActive") : 0; 
			%>
			<div class="card bg-orange text-dark mb-3">
			    <div class="card-body" style="color: #00FFFF">
			        <h5>Active Students</h5>
			        <div class="row">
			            <div class="col-5 text-center">
			                <span>Current Month:</span>
			                <strong class="d-block"><%= currentMonthActive %></strong>
			            </div>
			            <div class="col-2 d-flex justify-content-center align-items-center">
			                <div style="border-left: 2px solid #adb5bd; height: 100%;"></div>
			            </div>
			            <div class="col-5 text-center">
			                <span>Last Month:</span>
			                <strong class="d-block"><%= lastMonthActive %></strong>
			            </div>
			        </div>
			    </div>
			</div>
			
			<div class="card bg-or text-dark mb-3">
			    <div class="card-body" style="color:#00308F;">
			        <h5>INVOICE</h5>
			        <p>Year Wise Chart</p>
			        <!-- Buttons to toggle between current and last year data -->
			        <button id="currentYearBtn" class="btn btn-primary">Current Year</button>
			        <button id="lastYearBtn" class="btn btn-secondary">Last Year</button>
			        
			        <!-- Canvas for the chart -->
			        <canvas id="weeklyCircleChart"></canvas>
			    </div>
			</div>

                </aside>
            </div>
        </main>
    </div>
</div>

<!-- Modal for student details -->
<div id="studentModal" class="modal">
    <div class="modal-content" id="modalContent">
        <!-- Dynamic content will be inserted here -->
    </div>
    <span class="close" onclick="closeModal()">&times;</span>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
	
		
	
	// JavaScript for filtering students by name
	document.getElementById('searchBar').addEventListener('keyup', function() {
	    const query = this.value.toLowerCase();
	    const students = document.querySelectorAll('.student-card');
	
	    students.forEach(student => {
	        const studentName = student.getAttribute('data-name');
	        if (studentName.includes(query)) {
	            student.style.display = 'flex';
	        } else {
	            student.style.display = 'none';
	        }
	    });
	});


	    document.addEventListener("DOMContentLoaded", function () {
	        const recentThreeMonthsData = document.getElementById("currentThreeMonthsBtn");
	        const lastThreeMonthsData = document.getElementById("lastThreeMonthsBtn");
	        const chartCanvas = document.getElementById("monthlyChart");
	        let chartInstance;

	        <%
	        Map<String, List<Map<String, Object>>> count3 =(Map<String, List<Map<String, Object>>>) request.getAttribute("threem");
		    // Fetching the current and last month's active students
		  
    // Fetch the data for recent and last three months
    List<Map<String, Object>> recentThreeMonthsData = count3 != null ? count3.get("recentThreeMonths") : new ArrayList<>();
    List<Map<String, Object>> lastThreeMonthsData = count3 != null ? count3.get("lastThreeMonths") : new ArrayList<>();

    // Example: Check the size of each list (if needed)
    int recentThreeMonthsData1 = recentThreeMonthsData.size();
    int lastThreeMonthsData2 = lastThreeMonthsData.size();
    
    // Prepare separate lists for month names, pending fees, and total fees
    List<String> recentThreeMonthsLabels = new ArrayList<>();
    List<Integer> recentThreeMonthsPendingFees = new ArrayList<>();
    List<Integer> recentThreeMonthsTotalFees = new ArrayList<>();
    

    List<String> lastThreeMonthsLabels = new ArrayList<>();
    List<Integer> lastThreeMonthsPendingFees = new ArrayList<>();
    List<Integer> lastThreeMonthsTotalFees = new ArrayList<>();


    // Loop through the recentThreeMonthsData and split it
    for (Map<String, Object> data : recentThreeMonthsData) {
        String monthName = (String) data.get("monthName");  // Get the month name
        Integer pendingFees = (Integer) data.get("pendingFees");  // Get the pending fees
        Integer totalFees = (Integer) data.get("totalFees");  // Get the total fees

        recentThreeMonthsLabels.add(monthName);  // Add monthName to labels list
        recentThreeMonthsPendingFees.add(pendingFees);  // Add pendingFees to pendingFees list
        recentThreeMonthsTotalFees.add(totalFees);  // Add totalFees to totalFees list
        
      
    }
    // Loop through the lastThreeMonthsData and split it
    for (Map<String, Object> data : lastThreeMonthsData) {
        String monthName = (String) data.get("monthName");  // Get the month name
        Integer pendingFees = (Integer) data.get("pendingFees");  // Get the pending fees
        Integer totalFees = (Integer) data.get("totalFees");  // Get the total fees

        lastThreeMonthsLabels.add(monthName);  // Add monthName to labels list
        lastThreeMonthsPendingFees.add(pendingFees);  // Add pendingFees to pendingFees list
        lastThreeMonthsTotalFees.add(totalFees);  // Add totalFees to totalFees list
    }
			%>
		
		

			// Function to render the chart data
	        function renderChartData(data) {
	        	 const labels = "<%= recentThreeMonthsLabels%>"; // Adjust according to your data structure
	        	    const pendingFees = <%= recentThreeMonthsPendingFees%>; // Adjust according to your data structure
	        	    const totalFees = <%= recentThreeMonthsTotalFees%>; 
	            renderChart(labels, pendingFees, totalFees);
	        }

	        // Function to render the chart
	        function renderChart(labels, pendingFees, totalFees) {
	            if (chartInstance) {
	                chartInstance.destroy(); // Destroy the existing chart to avoid overlap
	            }

	            chartInstance = new Chart(chartCanvas, {
	                type: "bar",
	                data: {
	                    labels: labels,
	                    datasets: [
	                        {
	                            label: "Pending Fees",
	                            data: pendingFees,
	                            backgroundColor: "rgba(255, 99, 132, 0.5)",
	                        },
	                        {
	                            label: "Total Fees",
	                            data: totalFees,
	                            backgroundColor: "rgba(54, 162, 235, 0.5)",
	                        },
	                    ],
	                },
	                options: {
	                    responsive: true,
	                    plugins: {
	                        legend: {
	                            position: "top",
	                        },
	                    },
	                    
	                    scales: {
	                        x: {
	                            ticks: {
	                                // Rotate labels and adjust font size
	                                maxRotation: 4,
	                                minRotation: 30,
	                                font: {
	                                    size: 10, // Adjust the font size for labels
	                                },
	                            },
	                        },
	                    },
	                },
	            });
	        }

	        // Event listeners for buttons
	        currentThreeMonthsBtn.addEventListener("click", () => {
	            // Check which button is clicked and render the corresponding data
	            renderChartData(recentThreeMonthsData);
	        });

	        lastThreeMonthsBtn.addEventListener("click", () => {
	            // Check which button is clicked and render the corresponding data
	            renderChartData(lastThreeMonthsData);
	        });

	        // Default: Load recent three months data when the page loads
	        renderChartData(recentThreeMonthsData);
	    });

    //// *********//////
  <%
				Map<String, Integer> count2 =(Map<String, Integer>) request.getAttribute("count2");
			    // Fetching the current and last month's active students
			    Integer currentReaming = count2 != null ? count2.get("currentYearRemaining") : 0; 
			    Integer currentamount = count2 != null ? count2.get("currentYearAmount") : 0; 
			
			    Integer lastReaming1 = count2 != null ? count2.get("lastYearRemaining") : 0; 
			    Integer lastamount2 = count2 != null ? count2.get("lastYearAmount") : 0; 
			    %>
			  // Initialize chart with current year data
		    const ctx2 = document.getElementById('weeklyCircleChart').getContext('2d');
		    
		    let chart = new Chart(ctx2, {
		        type: 'doughnut',
		        data: {
		            labels: ['Pay Amount', 'Pending Fees'],
		            datasets: [{
		                data: [<%= currentReaming %>, <%= currentamount %>],
		                backgroundColor: ['#ffce56', '#36a2eb'],
		            }]
		        },
		        options: {
		            responsive: true,
		        }
		    });

		    // Function to update chart with new data
		    function updateChart(yearRemaining, yearAmount) {
		        chart.data.datasets[0].data = [yearRemaining, yearAmount];
		        chart.update();  // Update the chart with new data
		    }

		    // Event listeners for buttons to update chart data
		    document.getElementById('currentYearBtn').addEventListener('click', function() {
		        updateChart(<%= currentReaming %>, <%= currentamount %>);
		    });

		    document.getElementById('lastYearBtn').addEventListener('click', function() {
		        updateChart(<%= lastReaming1 %>, <%= lastamount2 %>);
		    });


		    
function closeModal() {
    document.getElementById("studentModal").style.display = "none";
}
function logout() {
    // Redirect to the desired page (e.g., dashboard)
    window.location.href = 'Adminlogin'; // Adjust the URL as needed
}
</script>
</body>
</html>
	    