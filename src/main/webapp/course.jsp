<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Page</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="styles.css">
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
        /* Courses section */
        .courses h2 {
            font-size: 2.5rem;
            font-weight: bold;
        }
        .card {
            border-radius: 8px;
            border: none;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
        }
        .card-title {
            font-size: 1.2rem;
            font-weight: bold;
            margin-bottom: 1rem;
        }
        .card-text {
            font-size: 1rem;
            line-height: 1.5;
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

<!-- Course Section -->
<section class="courses py-5">
    <div class="container">
        <h2 class="text-center mb-4">Our Programs</h2>
        <div class="row">

            <!-- Fundamentals of Programming -->
            <div class="col-md-6 col-lg-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Fundamentals of Programming</h5>
                        <p class="card-text">Duration: 3 months</p>
                        <p class="card-text">Overview: Introduction to programming concepts using C and C++. Learn the basics of coding, problem-solving, and algorithm development.</p>
                        <p class="card-text">Outcome: Develop a solid foundation in programming logic and syntax.</p>
                    </div>
                </div>
            </div>

            <!-- Core and Advanced Java -->
            <div class="col-md-6 col-lg-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Core and Advanced Java</h5>
                        <p class="card-text">Duration: 4 months</p>
                        <p class="card-text">Overview: Comprehensive training in Core Java and Advanced Java concepts, including OOP principles, exception handling, and Java frameworks.</p>
                        <p class="card-text">Outcome: Build robust Java applications and understand the Java ecosystem.</p>
                    </div>
                </div>
            </div>

            <!-- Web Development Fundamentals -->
            <div class="col-md-6 col-lg-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Web Development Fundamentals</h5>
                        <p class="card-text">Duration: 3 months</p>
                        <p class="card-text">Overview: Learn the basics of HTML, CSS, and JavaScript to create responsive and interactive web pages.</p>
                        <p class="card-text">Outcome: Develop functional websites using front-end technologies.</p>
                    </div>
                </div>
            </div>

            <!-- Full-Stack Development Bootcamp -->
            <div class="col-md-6 col-lg-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Full-Stack Development Bootcamp</h5>
                        <p class="card-text">Duration: 6 months</p>
                        <p class="card-text">Overview: Dive deep into both front-end and back-end technologies, including Angular, Node.js, and MongoDB. Gain skills in building, deploying, and managing full-stack applications.</p>
                        <p class="card-text">Outcome: Create dynamic web applications from concept to deployment.</p>
                    </div>
                </div>
            </div>

            <!-- Database Management -->
            <div class="col-md-6 col-lg-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Database Management</h5>
                        <p class="card-text">Duration: 4 months</p>
                        <p class="card-text">Overview: Explore various database systems, including Oracle, SQL, and MySQL. Understand data modeling, querying, and database design.</p>
                        <p class="card-text">Outcome: Manage and manipulate data effectively using SQL.</p>
                    </div>
                </div>
            </div>

            <!-- Data Science and Analytics -->
            <div class="col-md-6 col-lg-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Data Science and Analytics</h5>
                        <p class="card-text">Duration: 4 months</p>
                        <p class="card-text">Overview: Learn data analysis, visualization techniques, and Python programming.</p>
                        <p class="card-text">Outcome: Analyze datasets and draw meaningful insights to drive decision-making.</p>
                    </div>
                </div>
            </div>

            <!-- Mobile App Development -->
            <div class="col-md-6 col-lg-3">
                <div class="card mb-4">
                    <div class="card-body">
                        <h5 class="card-title">Mobile App Development</h5>
                        <p class="card-text">Duration: 5 months</p>
                        <p class="card-text">Overview: Explore Android and iOS development, UI/UX design principles, and app deployment.</p>
                        <p class="card-text">Outcome: Create and launch your mobile applications.</p>
                    </div>
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
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
