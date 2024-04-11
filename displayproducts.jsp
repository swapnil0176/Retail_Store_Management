<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.dto.MessageDisplay"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <meta charset="UTF-8">
    <title>Product Report</title>
    <style>
        /* body {
            background-image: url("https://www.supermarketperimeter.com/ext/resources/2022/10/10/commissary-food-waste-3.jpg?height=667&t=1665412512&width=1080");
            background-size: cover;
        } */
        body{
        font-family: Arial, sans-serif;
            background-image: url('https://www.supermarketperimeter.com/ext/resources/2022/10/10/commissary-food-waste-3.jpg?height=667&t=1665412512&width=1080');
            background-size: cover;
            background-position: center;
            margin: 0;
            padding: 0;
            display: flex;
            /* justify-content: center; */
            align-items: center;
            height: 100vh;
        }
        #tablehead {
            background-color: rgba(255, 255, 255, 0.8);
            border-radius: 10px;
            padding: 20px;
        }
		
		 h2 {
     		font-weight: 400;
            text-align:left;
            margin-bottom: 30px;
            color: #333;
        }

		h2:hover{
			color:blue;
			
		}
        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th,
        td {
            padding: 12px 15px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tbody tr:nth-child(even) {
            background-color: #f2f2f2;
        }

        .btn {
            padding: 10px 20px;
            border-radius: 5px;
        }

        .btn-success {
            background-color: #28a745;
            border-color: #28a745;
        }

        .btn-success:hover {
            background-color: #218838;
            border-color: #1e7e34;
        }

        .btn-danger {
            background-color: #dc3545;
            border-color: #dc3545;
        }

        .btn-danger:hover {
            background-color: #c82333;
            border-color: #bd2130;
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

<body>

    <div class="container mt-5" id="tablehead">
    	<a href="homepage2.jsp" id="close" class="btn btn-outline-danger">&times;</a>
    	<h2>Product Report</h2>
        <table class="table table-bordered">
       
                <tr>
                    <th>Product ID</th>
                    <th>Product Name</th>
                    <th>Product Quantity</th>
                    <th>Product Price</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="p" items="${Products}">
                    <tr>
                        <td><c:out value="${p.pid}"></c:out></td>
                        <td><c:out value="${p.pname}"></c:out></td>
                        <td><c:out value="${p.quantity}"></c:out></td>
                        <td><c:out value="${p.price}"></c:out></td>
                        <td><a href="editProduct.jsp" class="btn btn-success">Edit</a>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
                            <a href="delete?id=${p.pid}" class="btn btn-danger">Delete</a> </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>

</body>

</html>