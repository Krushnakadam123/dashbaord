<!DOCTYPE html> 
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>enrollment Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        /* Navbar custom styles */
        .navbar-brand {
            font-size: 1.8rem;
            font-weight: bold;
        }
        .nav-item .nav-link {
            font-size: 1.1rem;
        }
        .nav-item .btn {
            color: white;
        }

        /* Resources and Enrollment Section */
        .resources-section, .enrollment-section {
            padding: 50px 0;
            background-color: #f9f9f9;
        }
        .resources-section h2, .enrollment-section h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }
        .resource-item, .enrollment-item {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        /* Footer */
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
        }
        footer .contact-info {
            font-size: 1rem;
            margin: 10px 0;
        }
        footer .contact-info a {
            color: #007bff;
            text-decoration: none;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">MSquare</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
        
            <li class="nav-item">
            <!-- <form action="new" method="get">  </form> --> 
             <a class="nav-link" onclick="cancelstudent()">Home</a>
              
             </li>
       
            <li class="nav-item"><a class="nav-link" href="enrollment.jsp">Enrollment</a></li>
            <li class="nav-item"><a class="nav-link" href="resource.jsp">Resources</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
            <li class="nav-item"><a class="nav-link" href="course.jsp">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
            <li class="nav-item"><a class="nav-link btn btn-primary" href="slogin.jsp">Log In</a></li>
        </ul>
    </div>
</nav>



<!-- Enrollment Section -->
<section class="enrollment-section">
    <div class="container">
        <h2>Enrollment</h2>
        <div class="row">
            <div class="col-md-6">
                <div class="enrollment-item">
                    <h4>Get Started</h4>
                    <p>Ready to take your first step into the world of coding? Enroll in one of our courses today!</p>
                    <ul>
                        <li>Choose your desired course.</li>
                        <li>Fill out the online enrollment form.</li>
                        <li>Receive confirmation and further instructions.</li>
                    </ul>
                </div>
            </div>
            <div class="col-md-6">
                <div class="enrollment-item">
                    <h4>Scholarship Opportunities</h4>
                    <p>We believe in making coding education accessible to all. Explore our scholarship options to see if you qualify for financial assistance.</p>
                </div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="text-center" >
    <p >&copy; 2024 MSquare. All Rights Reserved.</p>
    <p>
        <a>Privacy Policy</a> |
        <a>Terms of Service</a>
    </p>
</footer>
<script>
function cancelstudent() {
    // Redirect to the desired page (e.g., dashboard)
    window.location.href = 'new'; // Adjust the URL as needed
}
</script>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
