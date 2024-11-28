<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.example.dashboarddemo.Dao.DBUtil"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.example.dashboarddemo.Entity.Course"%>
<%

String cid =request.getParameter("cid");
Course course=null;

if(cid !=null){
	try{
		Connection conn=DBUtil.getConnection();
		
		String sql="SELECT * FROM course WHERE cid=?";
		  PreparedStatement st = conn.prepareStatement(sql);
          st.setString(1, cid);
          ResultSet rs = st.executeQuery();
          if(rs.next()){
        	  
        	  course=new Course();
        	  
        	  course.setCId(rs.getLong("cid"));
        	  course.setCourseName(rs.getString("course_name"));
        	  course.setPrice(rs.getDouble("price"));
        	  
        	  
        	  rs.close();
              st.close();
        	  
          }
	}catch (Exception e) {
        e.printStackTrace();
	}
}

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register student</title>

 <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style type="text/css">
body {
            font-family: Arial, sans-serif;
            background-color:#e0fbfc; /* Light bulue color */
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
        height: 100vh;
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
  
/* Positioning context for the arrow .container {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    position: relative
}  */

h1 {
    text-align: center;
}
h2{
font-size:2rem;
margin-left:-1rem}

.tabs {
    display: flex;
    justify-content: space-between;
    margin-bottom: 20px;
}

.tab-button {
    padding: 10px 20px;
    border: none;
    background-color: #007bff;
    color: #fff;
    cursor: pointer;
    border-radius: 5px;
    flex: 1;
    margin: 0 5px;
}

.tab-button.active {
    background-color: #0056b3;
}

.tab {
    display: none;
}

.tab.active {
    display: block;
}

.box {
    border: 1px solid #ccc;
    border-radius: 15px;
    padding: 20px;
    margin: 20px 0;
    background-color: #f9f9f9;
    width:881px;
    left: 100px;
}

.input-field{
width: 40%;
padding: 1rem;
}
.wrapper{
width:100%;
display:flex;
}
label {
    display: block;
    margin: 10px 0 5px;
}

input {
    width: 100%;
    padding: 10px;
    margin-bottom: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
}

button {
    padding: 10px 20px;
    border: none;
    background-color: #28a745;
    color: white;
    border-radius: 5px;
    cursor: pointer;
}

button:hover {
    background-color: #218838;
}

#message {
    margin-top: 20px;
    text-align: center;
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
  
  .register-main{
  width: 100%;
  margin: 40px;
  
  }
  .container1{
 
    height: 720px;
    width: 920px;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    position: relative;
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
                <span class="mr-2"><strong>krushna</strong></span>
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
                        <a class="nav-link text-white" href="employee.jsp">
                            <i class="fas fa-users"></i> Employees
                        </a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="#">
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
                </ul>
            </div>
        </nav>
      </div>
      </div>  
        
 
 <div class="register-main">   
      <div class="container1">
    <!-- Tabs Navigation -->
    <div class="tabs">
        <ul class="nav nav-pills">
            <li class="nav-item">
                <a class="nav-link active" onclick="showTab('info')">Information</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" onclick="showTab('education')">Education</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" onclick="showTab('payment')">Payment</a>
            </li>
        </ul>
    </div>

	
		
    <!-- Form for Registration -->
    <form  method="post" action="registerStudent">
        <div id="info" class="tab active">
            <div class="box">
                <h2>Student Information</h2>
                <div class="wrapper">
                <div class="input-field">
                 <label for="name">Name:</label>
                <input type="text" id="name" name="name" required />
                </div>
                
                <div class="input-field">
                <label for="mobile">Mobile:</label>
                <input type="text" id="mobile" name="mobile" required />
                </div>
                
                 <div class="input-field">
                <label for="aadharno">Aadhar No:</label>
                <input type="text" id="aadharno" name="aadharno" required />
                </div>
                
                </div>
                
                <div class="wrapper">
                 <div class="input-field">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required />
                </div>
                
                 <div class="input-field">
                <label for="parent_no">Parent No:</label>
                <input type="text" id="parent_no" name="parent_no" required />
                </div>
                 </div>
                
                 <div class="wrapper">
                 <div class="input-field">
                <label for="status">Status:</label>
                <input type="text" id="status" name="status" required />
                </div>
                
                  <div class="input-field">
                <label for="gender">Gender:</label>
                <input list="coll" type="text" id="gender" name="gender" required />
                <datalist id="coll">
                    <option value="Female">
                    <option value="Male">
                  
                    <!-- Add more colleges -->
                </datalist>
                </div>
                
                
                 <div class="input-field">
                <label for="address">Address:</label>
                <input type="text" id="address" name="address" required />
                </div>
            
                
                <div class="input-field">
                <label for="cid">Course ID:</label>
                <select id="cid" name="cid" required onchange="updateCourseName()">
                    <option value="">Select Course ID</option>
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                </select>
				</div>
			  </div>
			
			
				 <div class="wrapper">
				  <div class="input-field">
                <label for="course_name">Course Name:</label>
                <input type="text" id="course_name" name="course_name" readonly required />
            	</div>
               
               	 <div class="input-field">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required />
                </div>
                </div>
                </div>
      
            
            <button type="button" class="next-button" onclick="nextTab('education')">Next</button>
        </div>

        <div id="education" class="tab">
            <div class="box">
                <h2>Education Details</h2>
                
                <label for="college_name">College Name:</label>
                <input list="collegeNames" type="text" id="college_name" name="college_name" required />
                <datalist id="collegeNames">
                    <option value="Harvard University">
                    <option value="Stanford University">
                    <option value="MIT">
                    <option value="Oxford University">
                    <!-- Add more colleges -->
                </datalist>

                <label for="stream">Stream:</label>
                <input type="text" id="stream" name="stream" required />
                
                <label for="consultant_name">Consultant Name:</label>
                <input type="text" id="consultant_name" name="consultant_name" required />

                <label for="date_registered">Register Date:</label>
                <input type="date"  name="date_registered" required />

                <label for="trainer">Trainer Name:</label>
                <input type="text" id="trainer" name="trainer" required />
            </div>
            <button type="button" class="prev-button" onclick="prevTab('info')">Previous</button>
            <button type="button" class="next-button" onclick="nextTab('payment')">Next</button>
        </div>

        <div id="payment" class="tab">
            <div class="box">
                <h2>Payment Information</h2>
                <label for="paymentMode">Payment Mode:</label>
                <input type="text" id="paymode" name="paymode" required />
                
                <label for="total">Total Amount:</label>
                <input type="number" id="total" name="total" required oninput="calculateRemainingTotal()" />
                
                <label for="payamount">Pay Amount:</label>
                <input type="number" id="payamount" name="payamount" required oninput="calculateRemainingTotal()" />
                
                <label for="remaining_total">Remaining Amount:</label>
                <input type="number" id="remaining_total" name="remaining_total" required />
            </div>
            <button type="button" class="prev-button" onclick="prevTab('education')">Previous</button>
            <button type="submit">Submit</button>
        </div>
    </form>
          
		
	
</div>
</div>  
            
 <script >
    
    // JavaScript object to map course IDs to course names
    const courses = {
        '1': 'Beginner Programming',
        '2': 'Full-Stack Development Bootcamp',
        '3': 'Data Science and Analytics',
        '4': 'Mobile App Development'
        // Add more course ID-to-name mappings as needed
    };

    // Function to update course name based on selected course ID
    function updateCourseName() {
        const cid = document.getElementById('cid').value;
        const courseNameInput = document.getElementById('course_name');
        
        if (cid && courses[cid]) {
            courseNameInput.value = courses[cid];
        } else {
            courseNameInput.value = ''; // Clear if no valid course ID is selected
        }
    }
    
    
    
    function showTab(tabName) {
        // Hide all tabs
        const tabs = document.querySelectorAll('.tab');
        tabs.forEach(tab => {
            tab.classList.remove('active');
        });

        // Show the selected tab
        document.getElementById(tabName).classList.add('active');

        // Update active tab button
        const buttons = document.querySelectorAll('.tab-button');
        buttons.forEach(button => {
            button.classList.remove('active');
            if (button.textContent.toLowerCase() === tabName) {
                button.classList.add('active');
            }
        });
    }

    function nextTab(tabName) {
        showTab(tabName);
    }

    function prevTab(tabName) {
        showTab(tabName);
    }

    // Calculate remaining total when payamount or total changes
    function calculateRemainingTotal() {
        const total = parseFloat(document.getElementById('total').value) || 0;
        const payamount = parseFloat(document.getElementById('payamount').value) || 0;
        const remainingTotal = total - payamount;
        document.getElementById('remaining_total').value = remainingTotal >= 0 ? remainingTotal : 0;
    }
    
    /*
 // Form submission handler
    document.getElementById('registrationForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent default form submission
        
        // Gather form data
        const formData = new FormData(this);
        
        // Send the data to the server as form-encoded
        fetch('registerStudent', {
            method: 'post',
            body: formData // No need to set headers, FormData is sent as multipart/form-data by default
        })
        .then(response => response.text()) // Assuming your backend returns a JSP page or plain text
        .then(result => {
            // Handle success or failure
            const messageDiv = document.getElementById('message');
            messageDiv.textContent = 'Student registered successfully!';
            messageDiv.style.color = 'green';
         // Refresh the page automatically after a short delay
            setTimeout(() => {
            	  window.location.href = 'sample';  // Reload the current page
            }, 1000); // Optional: Delay for user feedback
      
        })
        .catch(error => {
            console.error('Error:', error);
            const messageDiv = document.getElementById('message');
            messageDiv.textContent = 'Email, mobile number, or Aadhaar number already exists!';
            messageDiv.style.color = 'red';

        });
    });
 */
    function cancelstudent() {
        // Redirect to the desired page (e.g., dashboard)
        window.location.href = 'sample'; // Adjust the URL as needed
    }
    function logout() {
        // Redirect to the desired page (e.g., dashboard)
        window.location.href = 'Adminlogin'; // Adjust the URL as needed
    }

</script> <!-- Link to JS for functionality -->
</body>
</html>