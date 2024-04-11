<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.MessageDisplay"%>
<%@page import="com.dao.ProductDAO"%>
<%@page import="com.dto.ProductDTO"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
        rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
        crossorigin="anonymous">
        <title>Update Product</title>
    <style>
        body {
            background-image: url("https://www.supermarketperimeter.com/ext/resources/2022/10/10/commissary-food-waste-3.jpg?height=667&t=1665412512&width=1080");
            background-size: cover;
            font-family: Arial, sans-serif;
            padding-top: 50px;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 600px;
            margin: 0 auto;
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            padding: 30px;
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
        label {
            font-weight: bold;
        }

        input[type="number"], input[type="date"], .form-select {
            width: 90%;
            padding: 10px;
            border: 1px solid #ced4da;
            border-radius: 5px;
            margin-bottom: 15px;
            box-sizing: border-box;
        }

        button[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        button[type="submit"]:hover {
            background-color: #0056b3;
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
    <title>Update Product</title>
</head>
<body>
    <div class="container">
        <a href="homepage2.jsp" id="close" class="btn btn-outline-danger">&times;</a>
        
        <h2>Update Stock</h2>
        <%
            MessageDisplay m = (MessageDisplay) session.getAttribute("msg");
            if (m != null) {
        %>
            <div class="alert <%=m.getCssClass()%>" role="alert">
                <%=m.getContent()%>
            </div>
        <%
            session.removeAttribute("msg");
            }
        %>
        <form id="updateProductForm" action="updateProduct" method="post" name="productform">
            <div class="form-group">
                <%
                    ProductDAO dao = new ProductDAO();
                    ArrayList<ProductDTO> list = dao.displayAll();
                %>
                <label for="product">Select Product</label>
                <select id="product" name="productName" class="form-select">
                    <option selected disabled>Select Product</option>
                    <%
                        for (ProductDTO product : list) {
                    %>
                    <option><%=product.getPname()%></option>
                    <%
                        }
                    %>
                </select>
            </div>
            <div class="form-group">
                <label for="productPrice">Product Price:</label>
                <input type="number" id="productPrice" name="productPrice" required class="form-control">
            </div>
            <div class="form-group">
                <label for="productQuantity">Quantity:</label>
                <input type="number" id="productQuantity" name="productQuantity" required class="form-control">
            </div>
            <div class="form-group">
                <label for="productManufactureDate">Manufacture Date:</label>
                <input type="date" id="productManufactureDate" name="productManufactureDate" required class="form-control">
            </div>
            <div class="form-group">
                <label for="productExpiryDate">Expiry Date:</label>
                <input type="date" id="productExpiryDate" name="productExpiryDate" required class="form-control">
            </div>
            <button type="submit" class="btn btn-outline-success">Update Product</button>
        </form>
        <div id="message"></div>
    </div>
</body>
</html>
