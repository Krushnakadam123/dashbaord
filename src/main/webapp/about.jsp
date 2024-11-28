<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Page</title>
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
       
        /* About Us section */
        .about-section {
            background-color: #f7f9fc;
            padding: 50px 0;
        }
        .about-section h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #343a40;
        }
        .about-section p {
            font-size: 1.2rem;
            color: #6c757d;
        }
        /* Vision and Mission section */
        .vision-mission-section {
            background-color: #e9ecef;
            padding: 50px 0;
        }
        .vision-mission-section h3 {
            font-size: 2rem;
            font-weight: bold;
            color: #007bff;
        }
        .vision-mission-section p {
            font-size: 1.1rem;
            color: #6c757d;
        }
        .vision, .mission {
            margin-bottom: 30px;
        }
        /* Footer */
        footer {
            background-color: #343a40;
            color: white;
            padding: 20px 0;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">MSquare</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" href="new.jsp">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="enrollment.jsp">Enrollment</a></li>
            <li class="nav-item"><a class="nav-link" href="resource.jsp">Resources</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
            <li class="nav-item"><a class="nav-link" href="course.jsp">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
            <li class="nav-item"><a class="nav-link btn btn-primary" href="slogin.jsp">LogOut</a></li>
        </ul>
    </div>
</nav>

<!-- About Us Section -->
<section class="about-section text-center">
    <div class="container">
        <h2>About Us</h2>
        <p>At MSquare Training, we aim to empower individuals through high-quality education in IT and personal development. Our mission is to create a skilled workforce ready to tackle the challenges of the digital age.</p>
    </div>
</section>

<!-- Vision and Mission Section -->
<section class="vision-mission-section">
    <div class="container">
        <div class="row">
            <!-- Mission -->
            <div class="col-md-6 mission">
                <h3>Our Mission</h3>
                <p>To empower individuals through high-quality education and skills development, preparing them for the challenges of the digital age.</p>
            </div>
            <!-- Vision -->
            <div class="col-md-6 vision">
                <h3>Our Vision</h3>
                <p>To be a leading training provider recognized for transforming lives through education and innovation in the IT sector.</p>
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


<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
