<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="com.dto.MessageDisplay"%>
<%@page import="java.util.*"%>
<%@page import="com.dto.RetailDTO"%>
<%@page import="com.dto.ProductDTO"%>
<%
RetailDTO dt = (RetailDTO) session.getAttribute("currentUser");
if (dt == null) {
	response.sendRedirect("Login.jsp");
}
%>


<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Retail Store Management System</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<!-- Font Awesome CSS -->
<style>
	.jumbotron {
		background-image:
			url('https://www.supermarketperimeter.com/ext/resources/2022/10/10/commissary-food-waste-3.jpg?height=667&t=1665412512&width=1080');
		background-size: cover;
		color: #fff;
		text-align: center;
		font-weight: 900;
		padding: 200px 0;
		height:100vh;
		/* Adjusted padding for responsiveness */
		margin-bottom: 0;
		opacity: 1.0;
	}
	
	.jumbotron h1 {
		font-size: 3rem;
		/* Adjusted font size for responsiveness */
		margin-bottom: 50px;
		color: red;
		/* Text color */
	}
	
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
			
	#BrandName:hover {
		        transform: scale(1.05); 
		        color: #0056b3; 
		        text-shadow: 1px 1px 1px black, 3px 3px 5px blue; 
		    }

	nav{
			height:90px;
	}
	.about-section {
		background-color: rgb(189, 153, 21);
		color: #fff;
		text-align: center;
		padding: 50px 0;
	}
	
	.about-section h2 {
		font-size: 2rem;
		/* Adjusted font size for responsiveness */
		margin-bottom: 30px;
		color: #fc0303;
	}
	
	.footer {
		font-size: 14px;
		/* Adjusted font size for responsiveness */
		background-color: rgb(222, 159, 11);
		color: white;
		text-align: center;
		padding: 20px;
	}
	
	.container {
		color: #333;
		/* Default text color */
	}
	
	.container h1 {
		color: #044d9f;
	}
	
	.container p {
		font-size: 1.5rem;
		line-height: 1.8;
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
				<h1 class="text-white text-center" id="BrandName">Retail Store Management System</h1>
				<!-- Centered text -->
			</div>
		</div>
		<div class="row bg-warning">
			<div class="col">
				<nav class="navbar navbar-expand-lg navbar-light bg-warning">
					<div class="collapse navbar-collapse" id="navbarNav">
						<ul class="navbar-nav mr-auto">
							<!-- Align items to the left -->
							<li class="nav-item"><a class="nav-link" href="#">HOME</a></li>
							<li class="nav-item"><a class="nav-link" href="#about">ABOUT US</a></li>
							<li class="nav-item"><a class="nav-link" href="#">START SALE</a></li>
							<li class="nav-item"><a class="nav-link" href="sellReport"> ORDER REPORT </a>
							<li class="nav-item"><a class="nav-link" href="addproducts.jsp">ADD PRODUCT </a></li>
							<li class="nav-item"><a class="nav-link" href="displayProducts"> PRODUCT REPORT </a></li>
							<li class="nav-item"><a class="nav-link" href="editProduct.jsp"> UPDATE PRODUCT</a></li>
						</ul>
						<ul class="navbar-nav ml-auto">
							<!-- Align items to the right -->
							<li class="nav-item">
								<form class="form-inline my-2 my-lg-0" action="searchProduct">
									<input class="form-control mr-sm-2" name="pname" id="search"
										placeholder="Search Product" aria-label="Search">
									<button class="btn btn-outline-success my-2 my-sm-0"
										type="submit">Search</button>
								</form>
							</li>
							<li class="nav-item"><a class="nav-link" href="#"><i
									class="fas fa-user"></i> <%=dt.getFname()%> </a> <!-- Add Font Awesome icon -->
							</li>
							<li class="nav-item"><a class="nav-link"
								href="LogoutController"><i class="fas fa-sign-out-alt"></i>
									LOGOUT</a> <!-- Add Font Awesome icon --></li>
						</ul>
					</div>
				</nav>
			</div>
		</div>
		<div class="jumbotron">
			<div class="container">
				<%
				MessageDisplay m = (MessageDisplay) session.getAttribute("msg");
				if (m != null) {
				%>
				<div class="alert alert-light <%=m.getCssClass()%>" role="alert">
					<%=m.getContent()%>
				</div>
				<%
				session.removeAttribute("msg");
				}
				%>

				<%
				LinkedList<ProductDTO> ll = (LinkedList) session.getAttribute("Product");
				if (ll != null) {
					for (ProductDTO product : ll) {
				%>
				<div class="container mt-5 bg-white" id="table">
					<table class="table table-bordered">
						<thead>
							<tr>
								<td>Product Id</td>
								<td>Product Name</td>
								<td>Product Quantity</td>
								<td>Product Price</td>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><%=product.getPid()%></td>
								<td><%=product.getPname()%></td>
								<td><%=product.getQuantity()%></td>
								<td><%=product.getPrice()%></td>
							</tr>
						</tbody>
					</table>
					<button class="btn btn-danger" onclick="undoTable()">Cancel</button>
				</div>
				<%
				}
				}
				session.removeAttribute("Product");
				%>
				<!--  <h1>Welcome to Retail Store Management System</h1>

				<p>Efficiently manage your retail store with our advanced system</p> -->
			</div>
		</div>

		<div class="about-section" id="about">
			<div class="container">
				<h2>About Retail Store Management System</h2>
				<p>This web-site provides an easy-to-use Retail Store Management
					System. With this system, you can efficiently manage your retail
					store operations, including sales, inventory, and customer records.
					Say goodbye to manual paperwork and streamline your business
					processes with our user-friendly solution.</p>
			</div>
		</div>

		<hr>
		<div class="row bg-warning">
			<div class="col">
				<div class="footer">&copy; Retail Store Management System -
					All Rights Reserved</div>
			</div>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		function undoTable() {
			let popup = document.getElementById("table");
			popup.style.display = "none";
		}
	</script>
</body>

</html>
