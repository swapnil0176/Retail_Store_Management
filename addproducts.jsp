<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@page import="com.dto.MessageDisplay" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
  <title>Add Product Form</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-image: url('https://www.supermarketperimeter.com/ext/resources/2022/10/10/commissary-food-waste-3.jpg?height=667&t=1665412512&width=1080');
      background-size: cover;
      background-position: center;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    
    .container {
      width: 400px;
      background-color: rgba(255, 255, 255, 0.8);
      border-radius: 10px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      padding: 40px;
      box-sizing: border-box;
    }
    
    h2 {
     		font-weight: 400;
            text-align: left;
            margin-bottom: 30px;
            color: #333;
     }

	h2:hover{
		color:blue;
		
	}
    .form-group {
      margin-bottom: 20px;
    }
    
    label {
      font-weight: bold;
    }
    
    input[type="text"],
    input[type="number"],
    input[type="date"] {
      width: calc(100% - 20px);
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 5px;
      box-sizing: border-box;
      font-size: 16px;
    }
    
    
    button {
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      color: #fff;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      font-size: 16px;
    }
    
    button:hover {
      background-color: #0056b3;
    }
    
    .alert {
      margin-top: 15px;
      padding: 10px;
      border-radius: 5px;
    }
    
    .alert-success {
      background-color: #d4edda;
      border-color: #c3e6cb;
      color: #155724;
    }
    
    .alert-danger {
      background-color: #f8d7da;
      border-color: #f5c6cb;
      color: #721c24;
    }
    #close {
	
	float: right;
	font-size: 20px;
	font-weight: 900;
	}
	
	#close:hover, #close:focus {
		color: black;
		text-decoration: none;
		cursor: pointer;
}
  </style>
</head>
<body >
  <div class="container">
  <a href="homepage2.jsp" id="close" class="btn btn-outline-danger">&times;</a>
	<h2>Add Product</h2>
    <% MessageDisplay m=(MessageDisplay)session.getAttribute("msg");
    	if(m!=null){
    %>
    <div class="alert <%=m.getCssClass()%>" role="alert">
  		<%=m.getContent() %>
	</div>
    <%} %>
    <% session.removeAttribute("msg"); %>
    <form id="addProductForm" action="addproduct" method="post" name="productform">
      <div class="form-group">
        <label for="productName">Product Name:</label>
        <input type="text" id="productName" name="productName" required>
      </div>
      <div class="form-group">
        <label for="productPrice">Product Price:</label>
        <input type="number" id="productPrice" name="productPrice" required>
      </div>
      <div class="form-group">
        <label for="productQuantity">Quantity:</label>
        <input type="number" id="productQuantity" name="productQuantity" required>
      </div>
      <div class="form-group">
        <label for="productManufactureDate">Manufacture Date:</label>
        <input type="date" id="productManufactureDate" name="productManufactureDate" required>
      </div>
      <div class="form-group">
        <label for="productExpiryDate">Expiry Date:</label>
        <input type="date" id="productExpiryDate" name="productExpiryDate" required>
      </div>
      <button type="submit" class="text-centre" >Add Product</button>
    </form>
    <div id="message"></div>
  </div>
 
</body>
</html>