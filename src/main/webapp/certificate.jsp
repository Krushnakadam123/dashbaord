<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Certificate</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body,
        html {
            height: 100%;
            margin: 0;
            background-color: transparent;
        }

        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100%;
            position: relative;
        }

        .certificate {
            border: 10px solid #FF8C00;
            padding: 10px;
            width: 850px;
            position: relative;
            background-color: white;
            
        }

        .inner-border {
            border: 1mm solid #36454F;
            padding: 10px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            height: 100%;
            text-align: center;
            position: relative;
        }

        .certificate-title {
            color: #36454F;
            text-align: center;
            font-size: 2.5em;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .orange-text {
            color: #FF8C00;
            font-size: 10mm;
        }

        .normal-text {
            font-size: 22px;
            line-height: 1.2;
        }

      

        .course-name {
            font-size: 1.5em;
            margin: 10px 0;
            font-weight: bold;
        }

        .signatory {
            position: absolute;
            bottom: 60px;
            left: 50%;
            transform: translateX(-50%);
            font-weight: bold;
            font-size: 10mm;
        }

        .footer {
            font-size: 3.5mm;
            text-align: center;
            margin-top: 20px;
        }

        .blue-text {
            color: #000080;
        }

        .left-aligned {
            position: absolute;
            left: 20px;
            top: 80%;
            text-align: left;
            font-size: 16px;
            color: #000080;
            line-height: 1.2;
        }


        .date-field1 {
            border: none;
            font-size: 18px;
            color: #FF8C00;
            width: 300px;
            text-align: center;
        }

        .date-field {
            border: none;
            font-size: 20px;
            color: #FF8C00;
            width: 130px;
            text-align: center;
        }

        /* Style for the buttons */
        .button {
            padding: 10px 15px;
            font-size: 16px;
            border: none;
            border-radius: 5px;
            color: white;
            cursor: pointer;
            margin: 0 5px; /* Adjust margin for spacing */
            z-index: 10;
        }

        .download-button {
            background-color: #28a745;
        }


        .back-button {
            background-color: #007bff; /* Blue background for back button */
        }
    </style>
</head>

<body>
    <div style="position: absolute; top: 20px; right: 20px;">
        <button class="button download-button" onclick="downloadCertificate()">Download Certificate</button>
        <button class="button back-button" onclick="goToDashboard()">Back to Dashboard</button>
    </div>

    <form action="downloadCertificate" method="get"></form>
    <div class="container">
        <div class="certificate">
            <div class="inner-border">
                <div class="certificate-title">
                    M<span class="orange-text">S</span>quare Institute
                </div>

                <div class="text-center">
                    <div class="normal-text blue-text">This certificate is presented to
                        <br>
                        <input type="text" name="name" value="name" required class="orange-text date-field1">
                        <br>for Successfully completing a course
                   	 <div class="course-name orange-text">
                            <input type="text" name="course name" value="Full Stack Development (Java, J2EE, Angular)" class="orange-text date-field1" required>
                        </div>
                       
                       </div>
                        <br>
                        <div class="normal-text blue-text">
                            From:
                            <input type="text" name="start-date" value="10/01/23" class="orange-text date-field" required>
                            to
                            <input type="text" name="end-date" value="30/04/23" class="orange-text date-field" required>
                        </div>
                    </div>

                    <div class="left-aligned">
                        This certificate is given on 07/09/23
                    </div>

                    <img src="path/to/signature.png" alt="Signature" style="display:block; margin:auto; width:200px;">
					  <div class="signatory orange-text">Co-founder & MD</div>
                    <br>
                  

                    <div class="footer">MSquare, 2nd Floor, Bhala Plaza, Near Bharat Nagar, Maharashtra, Area Pin-Code 431203, +918888809416</div>
                </div>
            </div>
        </div>
    </div>
    <!-- Middle Section: Student Statistics and Trainer Section -->
<div class="col-md-6">
    <!-- Student Statistics Bar Chart -->
    <div class="card mb-3">
        <div class="card-header bg-primary text-white">Student Statistics (Monthly)</div>
        <div class="card-body">
            <!-- Buttons for toggling datasets -->
            <div class="mb-3">
                <button id="firstThreeMonthsBtn" class="btn btn-primary">First 3 Months</button>
                <button id="lastThreeMonthsBtn" class="btn btn-secondary">Last 3 Months</button>
            </div>
            
            <!-- Canvas for the chart -->
            <canvas id="monthlyChart"></canvas>  
        </div>
    </div>
</div>
    
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script>
    
    const firstThreeMonthsData = {
            labels: ['November', 'December', 'January'],
            datasets: [{
                label: 'Remaining Fees',
                data: [50, 60, 40], // Replace with dynamic data if needed
                backgroundColor: '#ffce56',
            },
            {
                label: 'Pay Amount',
                data: [70, 80, 90], // Replace with dynamic data if needed
                backgroundColor: '#36a2eb',
            }]
        };

        // Example data for the last three months
        const lastThreeMonthsData = {
            labels: ['August', 'September', 'October'],
            datasets: [{
                label: 'Remaining Fees',
                data: [90, 80, 70], // Replace with dynamic data if needed
                backgroundColor: '#ffce56',
            },
            {
                label: 'Pay Amount',
                data: [40, 60, 50], // Replace with dynamic data if needed
                backgroundColor: '#36a2eb',
            }]
        };

        // Initialize the chart with the first three months data
        const ctx = document.getElementById('monthlyChart').getContext('2d');
        let chart = new Chart(ctx, {
            type: 'bar', // Bar chart
            data: firstThreeMonthsData,
            options: {
                responsive: true,
                scales: {
                    y: {
                        beginAtZero: true,
                        title: {
                            display: true,
                            text: 'Amount (in Units)', // Adjust the label as necessary
                        }
                    }
                },
                plugins: {
                    legend: {
                        display: true,
                        position: 'top',
                    },
                    tooltip: {
                        callbacks: {
                            label: function (tooltipItem) {
                                return tooltipItem.dataset.label + ': ' + tooltipItem.raw; // Custom tooltip format
                            }
                        }
                    }
                }
            }
        });

        // Event listener for "First 3 Months" button
        document.getElementById('firstThreeMonthsBtn').addEventListener('click', function () {
            chart.data = firstThreeMonthsData; // Set data for first three months
            chart.update(); // Update the chart
        });

        // Event listener for "Last 3 Months" button
        document.getElementById('lastThreeMonthsBtn').addEventListener('click', function () {
            chart.data = lastThreeMonthsData; // Set data for last three months
            chart.update(); // Update the chart
        });
        function downloadCertificate() {
            // Redirect to the Spring Boot controller for downloading the certificate
            window.location.href = 'downloadCertificate';
        }

        function goToDashboard() {
            // Redirect to the dashboard page
            window.location.href = 'sample'; // Replace 'dashboard' with the actual dashboard page URL
        }
    </script>
</body>

</html>
