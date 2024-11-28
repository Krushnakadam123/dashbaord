<%@page import="com.example.dashboarddemo.Entity.Msg"%>
<%@page import="com.example.dashboarddemo.Entity.Student"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
        }
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

	  #trainerInfo {
            display: flex;
            flex-wrap: wrap; /* Allows cards to wrap if they exceed container width */
            justify-content: space-between; /* Add space between cards */
            gap: 20px; /* Space between each card */
        }        
        
        /* Trainer card styling */
        .trainer-card {
       		 background-color: #f0f0f0; /* Light gray color */
            border: 2px solid #ddd;
            border-radius: 5px;
            margin: 10px;
            padding: 15px;
            width: 200px;
            display: inline-block;
            text-align: center;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
              width: 350px; /* Fixed width */
            min-height: 150px; /* Ensures consistent height */
            box-sizing: border-box; /* Ensures padding doesn't affect width */
        }

        .trainer-card img {
            max-width: 100%;
            border-radius: 5px;
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
        
        
        
    </style>
    
    <script>
    
    function showTrainerInfo() {
        var trainerInfo = document.getElementById("trainerInfo");
        if (trainerInfo.style.display === "none") {
            trainerInfo.style.display = "block"; 
        } else {
            trainerInfo.style.display = "none";
        }
    }
    
        function showStudentInfo() {
            var studentInfo = document.getElementById("studentInfo");
            if (studentInfo.style.display === "none") {
                studentInfo.style.display = "block"; 
            } else {
                studentInfo.style.display = "none";
            }
        }
        function showMsgInfo() {
            var MsgInfo = document.getElementById("MsgInfo");
            if (MsgInfo.style.display === "none") {
            	MsgInfo.style.display = "block"; 
            } else {
            	MsgInfo.style.display = "none";
            }
        }
	
        function deleteMsg(msg_id) {
            if (confirm("Are you sure you want to delete this msg?")) {
                window.location.href = 'deleteMsg?msg_id=' + msg_id;
            }
        }
        function deleteStudent(sid) {
            if (confirm("Are you sure you want to delete this student?")) {
                window.location.href = 'deleteStudent?sid=' + sid;
            }
        }

        function editStudent(sid) {
            window.location.href = 'editform.jsp?sid=' + sid;
        }

        function viewStudentDetails(student) {
            var modal = document.getElementById("studentModal");
            var modalContent = document.getElementById("modalContent");

            modalContent.innerHTML = "<h3>Student Details</h3>" +
                "<p><strong>Pay Amount:</strong> " + student.payamount + "</p>" +
                "<p><strong>Aadhaar No:</strong> " + student.aadharno + "</p>" +
                "<p><strong>Parent No:</strong> " + student.ParentNo + "</p>" +
                "<p><strong>Address:</strong> " + student.Address + "</p>" +
               "<p><strong>Trainer:</strong>" +student.trainer+"</p>"+
                "<p><strong>College Name:</strong> " + student.CollegeName + "</p>" +
                "<p><strong>Stream:</strong> " + student.stream + "</p>" +
                "<p><strong>Consultant Name:</strong> " + student.ConsultantName + "</p>";

            modal.style.display = "block";
        }

        function closeModal() {
            document.getElementById("studentModal").style.display = "none";
        }
    </script>
</head>
<body>
<!-- Modal for student details -->
<div id="studentModal" class="modal">
    <div class="modal-content" id="modalContent">
        <!-- Dynamic content will be inserted here -->
    </div>
    <!-- Close button styled as a circle with a cross -->
    <span class="close" onclick="closeModal()">&#10005;</span>
</div>
         
    <div class="navbar">
        <a class="navbar-brand" href="#">
        <img src="img/area.png" alt="Logo" width="30" height="30" class="d-inline-block align-text-top">
 		 <span class="msquare-text">MSquare</span>
        </a>
        <div class="right">
            <span>Welcome, Admin</span>
              <button onclick="window.location.href='Adminlogin.jsp'">Logout</button>
        </div>
    </div> 

    <h1>Dashboard</h1>

    <div class="buttons">
        <button onclick="window.location.href='register.jsp'">Register</button>
        <button onclick="showStudentInfo()">View Student Information</button>
        <button onclick="window.location.href='certificate.jsp'">Cerficate</button>
         <button onclick="showMsgInfo()">Notification</button>
        <button onclick="showTrainerInfo()">Trainer</button>

    </div>



    <div id="studentInfo">
        <h2>Student Information :</h2>
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
         <tbody>
                <%
                    List<Student> studentList = (List<Student>) request.getAttribute("students");
                    if (studentList != null) {
                        for (Student student : studentList) {
                %>
                <tr>
                    <td><%= student.getSid() %></td>
                    <td><%= student.getName() %></td>
                    <td><%= student.getMobile() %></td>
                    <td><%= student.getEmail() %></td>
                    <td><%= student.getCourseName() %></td>
                    <td><%= student.getPaymode() %></td>
                    <td><%= student.getStatus() %></td>
                    <td><%= student.getTotal() %></td>
                    <td><%= student.getRemainingTotal() %></td>
                    <td>
                        <button style="background-color: blue; color: white;" onclick="editStudent('<%= student.getSid() %>')">Edit</button>
                        <button style="background-color: red; color: white;" onclick="deleteStudent('<%= student.getSid() %>')">Delete</button>
                        <button style="background-color: green; color: white;" onclick="viewStudentDetails({ payamount: '<%= student.getPayamount() %>', aadharno: '<%= student.getAadharno() %>',trainer: '<%= student.getTrainer() %>', ParentNo: '<%= student.getParentNo() %>', Address: '<%= student.getAddress() %>', CollegeName: '<%= student.getCollegeName() %>', stream: '<%= student.getStream() %>', ConsultantName: '<%= student.getConsultantName() %>' })">View</button>
                   
                     </td>
                </tr>
                <%
                        }
                    }
                %>
            </tbody>
        </table>
    </div>
  <div id="MsgInfo" style="display:none;">
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


<!-- Trainer Information -->
<div id="trainerInfo">
    <h2>Trainer Information :</h2>
    <div class="trainer-card">
        <h3><strong>Name:</strong>Ritesh sir</h3>
         <p><strong>Contact No:</strong> 1234567890</p>
        <p><strong>Experience:</strong> 5 years</p>
        <p><strong>Expertise:</strong> Java, Python</p>
    </div>
    <div class="trainer-card">
       <h3><strong>Name:</strong>Chaitnya </h3>
         <p><strong>Contact No:</strong>23456789120</p>
        <p><strong>Experience:</strong> 4 years</p>
        <p><strong>Expertise:</strong> Angular, JavaScript</p>
    </div>
    <div class="trainer-card">
        <h3><strong>Name:</strong>Suraj chowdhary</h3>
         <p><strong>Contact No:</strong> 9874561230</p>
        <p><strong>Experience:</strong> 3 years</p>
        <p><strong>Expertise:</strong> Data Science, AI</p>
    </div>
    <div class="trainer-card">
        <h3><strong>Name:</strong>Priyanka </h3>
         <p><strong>Contact No:</strong>9632587410</p>
        <p><strong>Experience:</strong> 6 years</p>
        <p><strong>Expertise:</strong> Web Development, PHP</p>
    </div>
    <div class="trainer-card">
       <h3><strong>Name:</strong>Sapna</h3>
         <p><strong>Contact No:</strong> 9517894562</p>
        <p><strong>Experience:</strong> 2 years</p>
        <p><strong>Expertise:</strong> Mobile App Development</p>
    </div>
    <div class="trainer-card">
       <h3><strong>Name:</strong>Rishika</h3>
         <p><strong>Contact No:</strong> 7845685212</p>
        <p><strong>Experience:</strong> 1.5 years</p>
        <p><strong>Expertise:</strong> Cloud Computing, DevOps</p>
    </div>
</div>


    <!-- Modal for student details -->
    <div id="studentModal" class="modal">
        <div class="modal-content" id="modalContent">
            <!-- Dynamic content will be inserted here -->
        </div>
        <span class="close" onclick="closeModal()">&times;</span>
    </div>

</body>
</html>
