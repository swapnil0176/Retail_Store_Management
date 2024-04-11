<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Retail Store Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
    
		#BrandName {
		    font-family: 'Arial', sans-serif; 
		    font-size: 36px; 
		    color: #007bff; 
		    text-shadow: 1px 1px 1px black, 3px 3px 5px blue;
		    letter-spacing: 1px; 
		    text-transform: uppercase; 
		    padding: 10px; 
		    box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1); 
		    transition: all 0.3s ease-in-out; 
		}
	    /* Hover effect */
	    #BrandName:hover {
	        transform: scale(1.05); 
	        color: #0056b3; 
	        text-shadow: 1px 1px 1px black, 3px 3px 5px blue; 
	    }
        .jumbotron {
            background-image: url('https://www.supermarketperimeter.com/ext/resources/2022/10/10/commissary-food-waste-3.jpg?height=667&t=1665412512&width=1080');
            background-size: cover;
            text-align: center; 
            padding: 200px 0;
            margin-bottom: 0;        
        }
		.jumbotron p{
            font-size: 20px;
            margin-bottom: 50px;
            margin-top: 250px;
            color: rgb(5, 5, 5);
            font-weight: 700;
        }
        .jumbotron h1 {
        	margin-bottom: 10px;
            margin-top: 12px;
            color: rgb(40, 35, 35);
            color:#311b92 ;
            font-size: 3rem;
            font-weight: 900;
        
        }
        .about-section {
            background-color: rgb(194, 160, 37);
            text-align: center;
            padding: 50px 0;
        }
        .about-section h2 {
            font-size: 2rem;
            margin-bottom: 30px;
            color: #500248;
        }
        .about-section p {
            font-size: 1.5rem;
            line-height: 1.8;
            color: rgb(33, 32, 32);
        }


        .footer {
            font-size: 20px;
            background-color: rgb(222, 159, 11);
            color: white;
            text-align: center;
            padding: 20px;
        }
        .container-navbar {
            color: #333;
        }        
        .container a {
            color: #28a745;
        }
       
    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="row bg-warning">
            <div class="col">
   				 <h1 class="text-Blue text-center font-cursive" id="BrandName">Retail Store Management System</h1>
			</div>        
		</div>
        <div class="row bg-warning">
            <div class="col">
                <nav class="navbar navbar-expand-lg navbar-light bg-warning">
                    <div class="container-navbar">
                        <div class="collapse navbar-collapse" id="navbarNav">
                            <ul class="navbar-nav "> <!-- Align items to the right -->
                                <li class="nav-item">
                                    <a class="nav-link" href="#">HOME</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="#about">ABOUT US</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Login.jsp"><i class="fas fa-user"></i>Login</a> <!-- Add Font Awesome icon -->
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="register.jsp"><i class="fas fa-sign-in-alt"></i>Sign-up</a> <!-- Add Font Awesome icon -->
                                </li>
                            </ul>
                        </div>
                        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
                            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                            <span class="navbar-toggler-icon"></span>
                        </button>
                    </div>
                </nav>
            </div>
        </div>
        <div class="jumbotron">
            <div class="container">
                <h1>Welcome to Retail Store Management System</h1>
                <p>Efficiently manage your retail store with our advanced system.</p>
            </div>
        </div>

        <div class="about-section" id="about">
            <div class="about">
                <h2>About Retail Store Management System</h2>
                <p>
                    This web-site provides an easy-to-use Retail Store Management System. With this system, you can
                    efficiently manage your retail store operations, including sales, inventory, and customer records.
                    Say goodbye to manual paperwork and streamline your business processes with our user-friendly
                    solution.
                </p>
            </div>
        </div>

        <hr>
        <div class="row bg-warning">
            <div class="col">
                <div class="footer">
                    &copy; Retail Store Management System - All Rights Reserved
                </div>
            </div>
        </div>
    </div>

    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>

</html>