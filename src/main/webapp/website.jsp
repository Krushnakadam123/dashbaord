<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Naukri-like App</title>
  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css" rel="stylesheet"> <!-- Bootstrap Icons -->
  <style>
    /* Custom Styles */
    body {
      font-family: 'Arial', sans-serif;
       background-color: #f9f9f9;
  	  padding: 2px;
    }

    /* Navbar links hover effect */
    .nav-link {
      margin-left: 10px;
      position: relative;
      height: 23px;
      text-decoration: none;
      color: #000;
    }

    .nav-link::after {
      content: '';
      position: absolute;
      left: 0;
      bottom: -15px;
      width: 0;
      height: 2px;
      background-color: orange;
      transition: width 0.3s ease-in-out;
    }

    .nav-link:hover::after {
      width: 100%;
    }

    .nav-link:hover {
      color: #000;
    }

    .nav-link.active::after {
      width: 100%;
    }
     .sidebar {
      height: 70vh;
      background-color: #343a40;
      color: white;
      padding: 20px;
      border-radius: 8px;
      margin-top: 15px;
    }

    .sidebar .nav-link {
      color: white;
      font-size: 16px;
      margin-bottom: 10px;
      display: block;
    }

    .sidebar .nav-link:hover {
     
      color: orange;
      border-radius: 4px;
      text-decoration: none;
    }
     .sidebar2 {
      height: 70vh;
      background-color: #FFDB58;
      
      padding: 20px;
      border-radius: 8px;
      margin-top: 15px;
    }

    .sidebar2 .nav-link {
      color: white;
      font-size: 16px;
      margin-bottom: 10px;
      display: block;
    }

    .sidebar2 .nav-link:hover {
     
      color: black;
      border-radius: 4px;
      text-decoration: none;
    }

    .content {
      padding: 20px;
    }

    .slider img {
      width: 100%;
      height: auto;
      border-radius: 8px;
    }

    .card {
      border: none;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .carousel .carousel-item img {
    width: 100%;
    height: 400px; /* Set desired height */
    object-fit: cover; /* Ensures image fills the container proportionally */
    border-radius: 8px;
  }
    
  
  </style>
</head>

<body>
  <!-- Navbar -->
  <nav class="navbar navbar-expand-lg navbar-light" style="background-color: #FFDB58;">
    <div class="container">
      <a class="navbar-brand" href="#">MSquare</a>
      <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ms-auto">
          <li class="nav-item">
            <a class="nav-link" href="#">Home</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Jobs</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Companies</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Sign in</a>
          </li>
          <li class="nav-item">
            <a class="btn btn-outline-primary ms-2" href="#">Employers / Post Job</a>
          </li>
        </ul>
      </div>
    </div>
  </nav>
  
  
  
 <div class="container-fluid">
    <div class="row">
      <!-- Left Sidebar -->
      <div class="col-md-2">
        <div class="sidebar">
          <h5>Dashboard</h5>
          <ul class="nav flex-column">
            <li><a class="nav-link" href="#">Section 1</a></li>
            <li><a class="nav-link" href="#">Section 2</a></li>
          </ul>
        </div>
      </div>

      <!-- Main Content -->
      <div class="col-md-8">
        <div class="content">
	    <!-- Advertisement Slider -->
<div id="carouselExample" class="carousel slide slider mb-4" data-bs-ride="carousel"> <!-- Disable auto sliding -->
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img src="img/ad3.jpg" class="d-block w-100" alt="Ad 1">
    </div>
    <div class="carousel-item">
      <img src="img/ad2.jpg" class="d-block w-100" alt="Ad 2">
    </div>
    <div class="carousel-item">
      <img src="img/ad1.jpg" class="d-block w-100" alt="Ad 3">
    </div>
  </div>
  
  <!-- Carousel Indicators (Dots) -->
  <div class="carousel-indicators">
    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="1" aria-label="Slide 2"></button>
    <button type="button" data-bs-target="#carouselExample" data-bs-slide-to="2" aria-label="Slide 3"></button>
  </div>

  <!-- Optional: Remove the previous and next buttons if you don't want them -->
  <!-- <button class="carousel-control-prev" type="button" data-bs-target="#carouselExample" data-bs-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
  </button>
  <button class="carousel-control-next" type="button" data-bs-target="#carouselExample" data-bs-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
  </button> -->
</div>



          <!-- Job Cards -->
          <div class="row">
            <div class="col-md-4">
              <div class="card mb-4">
                <div class="card-body">
                  <h5 class="card-title">Job Title 1</h5>
                  <p class="card-text">Company Name</p>
                  <p class="card-text"><small class="text-muted">Location: City</small></p>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4">
                <div class="card-body">
                  <h5 class="card-title">Job Title 2</h5>
                  <p class="card-text">Company Name</p>
                  <p class="card-text"><small class="text-muted">Location: City</small></p>
                </div>
              </div>
            </div>
            <div class="col-md-4">
              <div class="card mb-4">
                <div class="card-body">
                  <h5 class="card-title">Job Title 3</h5>
                  <p class="card-text">Company Name</p>
                  <p class="card-text"><small class="text-muted">Location: City</small></p>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

      <!-- Right Sidebar -->
     <div class="col-md-2">
        <div class="sidebar2">
          <h5>Dashboard</h5>
          <ul class="nav flex-column">
            <li><a class="nav-link" href="#">Section 1</a></li>
            <li><a class="nav-link" href="#">Section 2</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
  <!-- Footer 
  <footer class="bg-dark text-white text-center py-4">
    <div class="container">
      <p>&copy; 2024 JobPortal. All rights reserved.</p>
    </div>
  </footer>  -->

  <!-- Bootstrap JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>

</html>
