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
        
        /* Contact Us section */
        .contact-section {
            background-color: #f7f9fc;
            padding: 50px 0;
        }
        .contact-section h2 {
            font-size: 2.5rem;
            font-weight: bold;
            color: #343a40;
            text-align: center;
            margin-bottom: 30px;
        }
        .contact-form {
            background-color: #ffffff;
            border-radius: 8px;
            padding: 30px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
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
        .success-message {
            display: none;
            margin-top: 20px;
            color: green;
            text-align: center;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">MSquare</a>
    <div class="collapse navbar-collapse">
        <ul class="navbar-nav ml-auto">
            <li class="nav-item"><a class="nav-link" onclick="cancelstudent">Home</a></li>
            <li class="nav-item"><a class="nav-link" href="enrollment.jsp">Enrollment</a></li>
            <li class="nav-item"><a class="nav-link" href="resource.jsp">Resources</a></li>
            <li class="nav-item"><a class="nav-link" href="contact.jsp">Contact Us</a></li>
            <li class="nav-item"><a class="nav-link" href="course.jsp">Courses</a></li>
            <li class="nav-item"><a class="nav-link" href="about.jsp">About</a></li>
            <li class="nav-item"><a class="nav-link btn btn-primary" href="slogin.jsp">LogOut</a></li>
        </ul>
    </div>
</nav>

<!-- Contact Us Section -->
<section class="contact-section">
    <div class="container">
        <h2>Contact Us</h2>
        <div class="row justify-content-center">
            <div class="col-md-8 contact-form">
                <form id="contactForm" method="post" action="msg">
                    <div class="form-group">
                        <label for="s_name">Name</label>
                        <input type="text" class="form-control" id="s_name" name="s_name" placeholder="Your Name" required>
                    </div>
                    <div class="form-group">
                        <label for="mobile">Mobile</label>
                        <input type="tel" class="form-control" id="mobile" name="mobile" placeholder="Your Mobile Number" required>
                    </div>
                    <div class="form-group">
                        <label for="subject">Subject</label>
                        <input type="text" class="form-control" id="subject" name="subject" placeholder="Subject" required>
                    </div>
                    <div class="form-group">
                        <label for="message">Message</label>
                        <textarea class="form-control" id="message" name="message" rows="4" placeholder="Your Message" required></textarea>
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Send Message</button>
                </form>
                <div class="success-message" id="successMessage">Message sent successfully!</div>
            </div>
        </div>
    </div>
</section>

<!-- Footer -->
<footer class="text-center">
    <p>&copy; 2024 MSquare. All Rights Reserved.</p>
    <p>
        <a href="#">Privacy Policy</a> |
        <a href="#">Terms of Service</a>
    </p>
    <div class="contact-info">
        <p>For inquiries, feel free to reach out to us at <a href="mailto:contact@msquaresoftware.com">contact@msquaresoftware.com</a> or call us at +91-XXXX-XXXXXX.</p>
    </div>
</footer>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
    document.getElementById('contactForm').addEventListener('submit', function(event) {
        event.preventDefault(); // Prevent the default form submission
        // Show the success message
        document.getElementById('successMessage').style.display = 'block';
        // Reset the form fields
        this.reset();
    });
    
    function cancelstudent() {
        // Redirect to the desired page (e.g., dashboard)
        window.location.href = 'new'; // Adjust the URL as needed
    }
</script>
</body>
</html>
