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

        /* Resources Section */
        .resources-section {
            background-color: #f7f9fc;
            padding: 50px 0;
        }
        .resources-section h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }
        .resource-item {
            background-color: #ffffff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .resource-item h4 {
            font-size: 1.5rem;
            color: #007bff;
        }
        .resource-item p {
            color: #6c757d;
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
            <li class="nav-item"><a class="nav-link" onclick="cancelstudent()">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="enrollment.jsp">Enrollment</a></li>
            <li class="nav-item"><a class="nav-link" href="resource.jsp">Resources</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
            <li class="nav-item"><a class="nav-link" href="course.jsp">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
            <li class="nav-item"><a class="nav-link btn btn-primary" href="">LogOut</a></li>
        </ul>
    </div>
</nav>

<!-- Resources Section -->
<section class="resources-section">
    <div class="container">
        <h2>Learning Hub</h2>
        <div class="row">
            <div class="col-md-4">
                <div class="resource-item">
                    <h4>Blog</h4>
                    <p>Tips, tricks, and insights from industry experts to guide you on your learning journey.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="resource-item">
                    <h4>Webinars</h4>
                    <p>Join live sessions with coding professionals and enhance your knowledge through real-time interactions.</p>
                </div>
            </div>
            <div class="col-md-4">
                <div class="resource-item">
                    <h4>Tutorials</h4>
                    <p>Step-by-step guides to help you master various programming languages and frameworks.</p>
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
<script >
function cancelstudent() {
    // Redirect to the desired page (e.g., dashboard)
    window.location.href = 'new'; // Adjust the URL as needed
}
</script>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
