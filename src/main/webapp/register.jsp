
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
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Registration Form</title>
    <link rel="stylesheet" href="styles.css"> <!-- Link to CSS for styling -->
    <style >
    
    
     
        .navbar {
            background-color: #333;
            color: white;
            overflow: hidden;
            padding: 15px;
        }
        .navbar .logo {
            float: left;
            font-size: 24px;
        }
        .navbar .right {
            float: right;
        }
        .navbar a {
            color: white;
            text-decoration: none;
            padding: 14px 20px;
            display: inline-block;
        }
        
        
        
    body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

.container {
    max-width: 600px;
    margin: auto;
    padding: 20px;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    position: relative; /* Positioning context for the arrow */
}

h1 {
    text-align: center;
}

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
    border-radius: 8px;
    padding: 20px;
    margin: 10px 0;
    background-color: #f9f9f9;
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


  .cancel-arrow {
            cursor: pointer;
            position: absolute;
            top: 25px;
            right: 20px;
            width: 24px; /* Size of the SVG */
            height: 24px; /* Size of the SVG */
        }
        
        .cancel-arrow svg {
            fill: #ff0000; /* Arrow color */
            transition: fill 0.3s; /* Smooth transition */
        }

        .cancel-arrow:hover svg {
            fill:#b30000; /* Darker color on hover */
        }
    </style>
</head>
<body>

	    
    <div class="navbar">
        <div class="logo">MSquare</div>
        <div class="right">
            <span>Welcome, Admin</span>
            <a href="logout.jsp">Logout</a>
        </div>
    </div>
	
    <div class="container">
   
   
        <h1>Student Registration Form</h1>


<span class="cancel-arrow" onclick="cancelRegistration()">
    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" fill="none" viewBox="0 0 24 24">
        <path fill="currentColor" d="M12 10.586l-4.293-4.293-1.414 1.414L10.586 12l-4.293 4.293 1.414 1.414L12 13.414l4.293 4.293 1.414-1.414L13.414 12l4.293-4.293-1.414-1.414z"/>
    </svg>
</span>


        <div class="tabs">
        
            <button class="tab-button active" onclick="showTab('info')">Information</button>
            <button class="tab-button" onclick="showTab('education')">Education</button>
            <button class="tab-button" onclick="showTab('payment')">Payment</button>
             
        </div>

        <form id="registrationForm"  method="post" action="registerStudent">
       
            <div id="info" class="tab active">
                <div class="box">
                    <h2>Student Information</h2>
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" required />
                    
                    <label for="mobile">Mobile:</label>
                    <input type="text" id="mobile" name="mobile" required />
                    
                    <label for="aadharno">Aadhar No:</label>
                    <input type="text" id="aadharno" name="aadharno" required />
                    
                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" required />
                    
                    <label for="parent_no">Parent No:</label>
                    <input type="text" id="parent_no" name="parent_no" required />
                    
                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" required />
                    
                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" required />
                    
                    
                    <label for="cid">Course ID:</label>
                    <select id="cid" name="cid" value="<%= (course != null ? course.getCId(): "") %>" required onchange="updateCourseName()">
                    
                        <option value="">Select Course ID</option>
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <!-- Add more course IDs as necessary -->
                    </select>

                    <label for="course_name">Course Name:</label>
                    <input type="text" id="course_name" name="course_name"value="<%= (course != null ? course.getCourseName(): "") %>" readonly required />
                   
                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" required />
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
					    <option value="Massachusetts Institute of Technology">
					    <option value="University of Oxford">
					    <option value="University of Cambridge">
					    <option value="California Institute of Technology">
					    <option value="University of Mumbai">
					    <option value="Delhi University">
					    <!-- Add more college names here -->
					</datalist>
					                   
                    <label for="stream">Stream:</label>	
                    <input type="text" id="stream" name="stream" required />
                    
                     <label for="consultant_name">Consultant Name:</label>
				        <input type="text" id="consultant_name" name="consultant_name" required />
				
				        <label for="date_registered">Register Date:</label>
				        <input type="date" id="date_registered" name="date_registered" required />
				
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
                    <input type="number" id="total" name="total" value="<%= (course != null ? course.getPrice(): "") %>"required oninput="calculateRemainingTotal()" />

                    <label for="payamount">Pay Amount:</label>
                    <input type="number" id="payamount" name="payamount" required oninput="calculateRemainingTotal()" />
                      
                    <label for="remaining_total">Remaining Amount:</label>
                    <input type="number" id="remaining_total" name="remaining_total" required />
                    
                 
                </div>
                <button type="button" class="prev-button" onclick="prevTab('education')">Previous</button>
                <button type="submit">Submit</button>
            </div>
        </form>
        
        <div id="message"></div>
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
            	  window.location.href = 'dash';  // Reload the current page
            }, 2000); // Optional: Delay for user feedback
      
        })
        .catch(error => {
            console.error('Error:', error);
            const messageDiv = document.getElementById('message');
            messageDiv.textContent = 'Failed to register student.';
            messageDiv.style.color = 'red';
        });
    });
 
    function cancelRegistration() {
        // Redirect to the desired page (e.g., dashboard)
        window.location.href = 'dash'; // Adjust the URL as needed
    }

</script> <!-- Link to JS for functionality -->
</body>
</html>
