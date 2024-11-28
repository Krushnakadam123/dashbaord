<%@page import="com.example.dashboarddemo.Entity.Registrationallocation"%>
<%@ page import="com.example.dashboarddemo.Dao.DBUtil" %>
<%@ page import="com.example.dashboarddemo.Entity.Student" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>

<%
    String sid = request.getParameter("sid");
    Student student = null;
    Registrationallocation registrationallocation = null;
    if (sid != null) {
        try {
            // Get connection (Assuming you have a method to get the connection)
            Connection conn = DBUtil.getConnection();

            String query = "SELECT * FROM students WHERE sid = ?";
            String sql="SELECT * FROM registrationallocation WHERE sid =?";
            PreparedStatement stmt = conn.prepareStatement(query);
            PreparedStatement st = conn.prepareStatement(sql);
            stmt.setString(1, sid);
            
            st.setString(1, sid);
            ResultSet rs = stmt.executeQuery();
            ResultSet rs1 = st.executeQuery();
            

            if (rs.next()) {
                student = new Student();
                student.setSid(rs.getLong("sid"));
                student.setName(rs.getString("name"));
                student.setMobile(rs.getString("mobile"));
                student.setEmail(rs.getString("email"));
                student.setCourseName(rs.getString("course_name"));
                student.setPaymode(rs.getString("paymode"));
                student.setGender(rs.getString("gender"));
                student.setStatus(rs.getString("status"));
                student.setTotal(rs.getDouble("total"));
                student.setRemainingTotal(rs.getDouble("remaining_total"));
                student.setAadharno(rs.getString("aadharno")); // Aadhar Number
                student.setParentNo(rs.getString("parent_no")); // Parent Number
                student.setAddress(rs.getString("address"));
                student.setCollegeName(rs.getString("college_name"));
                student.setStream(rs.getString("stream"));
                student.setConsultantName(rs.getString("consultant_name"));
                student.setPassword(rs.getString("password"));
                student.setTrainer(rs.getString("trainer"));
                student.setPayamount(rs.getDouble("payamount"));
               
            }
            if(rs1.next()){
            	registrationallocation =new Registrationallocation();
            	registrationallocation.setDateRegistered(rs1.getDate(" date_registered"));
            }

            rs.close();
            stmt.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Update Form</title>
    <style>
        /* Add your styles here */
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
    <div class="container">
        <h1>Student Update Form</h1>
	

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

        <form id="updateForm" method="post" action="edit">
            <!-- Information Tab -->
            <div id="info" class="tab active">
                <div class="box">
                    <h2>Student Information</h2>
                    <input type="hidden" name="sid" value="<%= (student != null ? student.getSid() : "") %>" />
                    
                    <label for="name">Name:</label>
                    <input type="text" id="name" name="name" value="<%= (student != null ? student.getName() : "") %>" required />
					
					 
                    <label for="mobile">Mobile:</label>
                    <input type="text" id="mobile" name="mobile" value="<%= (student != null ? student.getMobile() : "") %>"required />
                    
                    <label for="aadharno">Aadhar No:</label>
                    <input type="text" id="aadharno" name="aadharno" value="<%= (student != null ? student.getAadharno() : "") %>" required />

                    <label for="email">Email:</label>
                    <input type="email" id="email" name="email" value="<%= (student != null ? student.getEmail() : "") %>" required />
					
					
                    <label for="gender">Email:</label>
                    <input type="gender" id="gender" name="gender" value="<%= (student != null ? student.getGender() : "") %>" required />
					
                    <label for="parent_no">Parent No:</label>
                    <input type="text" id="parent_no" name="parent_no" value="<%= (student != null ? student.getParentNo() : "") %>" required />

                    <label for="status">Status:</label>
                    <input type="text" id="status" name="status" value="<%= (student != null ? student.getStatus() : "") %>" required />

                    <label for="address">Address:</label>
                    <input type="text" id="address" name="address" value="<%= (student != null ? student.getAddress() : "") %>" required />

                    <label for="cid">CourseID:</label>
                    <input type="text" id="cid" name="cid" value="<%= (student != null ? student.getCourseName() : "") %>" required />

                    <label for="password">Password:</label>
                    <input type="password" id="password" name="password" value="<%= (student != null ? student.getPassword() : "") %>" required />
                </div>
            </div>

            <!-- Education Tab -->
            <div id="education" class="tab">
                <div class="box">
                    <h2>Education Details</h2>

                    <label for="college_name">College Name:</label>
                    <input type="text" id="college_name" name="college_name" value="<%= (student != null ? student.getCollegeName() : "") %>" required />

                    <label for="stream">Stream:</label>
                    <input type="text" id="stream" name="stream" value="<%= (student != null ? student.getStream() : "") %>" required />

                    <label for="consultant_name">Consultant Name:</label>
                    <input type="text" id="consultant_name" name="consultant_name" value="<%= (student != null ? student.getConsultantName() : "") %>" required />

                    <label for="date_registered">Register Date:</label>
                    <input type="date" id="date_registered" name="date_registered" value="<%= (registrationallocation != null ? registrationallocation.getDateRegistered() : "") %>" required />

                    <label for="trainer">Trainer Name:</label>
                    <input type="text" id="trainer" name="trainer" value="<%= (student != null ? student.getTrainer() : "") %>" required />
                </div>
                <button type="button" class="prev-button" onclick="prevTab('info')">Previous</button>
                <button type="button" class="next-button" onclick="nextTab('payment')">Next</button>
            </div>

            <!-- Payment Tab -->
            <div id="payment" class="tab">
                <div class="box">
                    <h2>Payment Details</h2>
                    
                    <label for="paymode">Payment Mode:</label>
                    <input type="text" id="paymode" name="paymode" value="<%= (student != null ? student.getPaymode() : "") %>" required />

                   <label for="total">Total Amount:</label>
                    <input type="number" id="total" name="total" value="<%= (student != null ? student.getTotal() : "") %>" required oninput="calculateRemainingTotal()" />

                    <label for="payamount">Pay Amount:</label>
                    <input type="number" id="payamount" name="payamount" value="<%= (student != null ? student.getPayamount() : "") %>" required oninput="calculateRemainingTotal()" />
                      
                    <label for="remaining_total">Remaining Amount:</label>
                    <input type="number" id="remaining_total" name="remaining_total" value="<%= (student != null ? student.getRemainingTotal() : "") %>"required oninput="calculateRemainingTotal()"/>
                    
                 
                </div>
                <button type="button" class="prev-button" onclick="prevTab('education')">Previous</button>
                <button type="submit">Update</button>
            </div>
        </form>
        
        <div id="message"></div>
    </div>

    <script >
    
    
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
    document.getElementById('updateForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent default form submission
        
        // Gather form data
        const formData = new FormData(this);
        
        // Send the data to the server as form-encoded
        fetch('edit', {
            method: 'post',
            body: formData // No need to set headers, FormData is sent as multipart/form-data by default
        })
        .then(response => response.text()) // Assuming your backend returns a JSP page or plain text
        .then(result => {
            // Handle success or failure
            const messageDiv = document.getElementById('message');
            messageDiv.textContent = 'Student update successfully!';
            messageDiv.style.color = 'green';
         // Refresh the page automatically after a short delay
            setTimeout(() => {
            	  window.location.href = 'student';// Reload the current page
            }, 2000); // Optional: Delay for user feedback
            
        })
        .catch(error => {
            console.error('Error:', error);
            const messageDiv = document.getElementById('message');
            messageDiv.textContent = 'Failed to update student.';
            messageDiv.style.color = 'red';
        });
    });
 
    function cancelRegistration() {
        // Redirect to the desired page (e.g., dashboard)
        window.location.href = 'student'; // Adjust the URL as needed
    }

</script> <!-- Link to JS for functionality -->
</body>
</html>
