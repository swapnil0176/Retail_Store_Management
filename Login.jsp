<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.dto.MessageDisplay" %>

<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<meta charset="UTF-8">
<title>Login page</title>
<style>
*{
	padding:0px;
	margin:0px;
}
:root {
    --background: #1a1a2e;
    --color: #ffffff;
    --primary-color: #0f3460;
}

* {
    box-sizing: border-box;
}

html {
    scroll-behavior: smooth;
}

.bg-img {
    background-image: url("https://www.supermarketperimeter.com/ext/resources/2022/10/10/commissary-food-waste-3.jpg?height=667&t=1665412512&width=1080");
    min-height: 100vh;
    background-size: cover;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
}

body {
    margin: 0;
    box-sizing: border-box;
    font-family: "Poppins", sans-serif;
    background: var(--background);
    color: var(--color);
    letter-spacing: 1px;
    align:right;
}

.login-container {
    position: relative;
    width: 25.5rem;
    background-color: rgba(255, 255, 255, 0.95);
    color: rgb(35, 21, 121);
    border-radius: 10px;
    padding: 2rem;
    box-shadow: 0 0 36px 1px rgba(0, 0, 0, 0.2);
    transition: transform 0.3s ease-in-out;
    
}

.login-container:hover {
    transform: scale(1.05);
}

.form-container {
    background-color: transparent;
    border: 1px solid hsla(0, 0%, 3%, 0.158);
    box-shadow: 0 0 36px 1px rgba(0, 0, 0, 0.2);
    border-radius: 10px;
    backdrop-filter: blur(15px);
    z-index: 99;
    padding: 2rem;
}

.login-container form input {
    display: block;
    padding: 14.5px;
    width: 100%;
    margin: 1.5rem 0;
    color: black;
    outline: none;
    background-color: rgba(255, 255, 255, 0.7);
    border: 1px solid #ccc;
    border-radius: 5px;
    font-weight: 500;
    letter-spacing: 0.8px;
    font-size: 15px;
    transition: box-shadow 0.3s ease-in-out;
}

.login-container form input:focus {
    box-shadow: 0 0 16px 1px rgba(15, 52, 96, 0.4);
}

.login-container form button {
    background-color: var(--primary-color);
    color: var(--color);
    display: block;
    padding: 13px;
    border-radius: 5px;
    outline: none;
    font-size: 18px;
    letter-spacing: 1.5px;
    font-weight: bold;
    width: 100%;
    cursor: pointer;
    margin-bottom: 2rem;
    border: none;
    transition: transform 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
}

.login-container form button:hover {
    box-shadow: 0 0 10px 2px rgba(15, 52, 96, 0.6);
    transform: scale(1.02);
}

.register-forget {
    margin: 1rem 0;
    display: flex;
    justify-content: space-between;
    font-size: 14px;
    opacity: 0.8;
}

.opacity {
    opacity: 0.9;
}

h1 {
    font-size: 32px;
    margin-bottom: 1.5rem;
    text-align: center;
}

.theme-btn-container {
    position: absolute;
    left: 0;
    bottom: 2rem;
}

.theme-btn:hover {
    width: 40px !important;
}

.alert {
    margin-bottom: 1rem;
    font-size: 16px;
    font-weight: 500;
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
</style>
</head>
<body>
	<center>
    <div class="bg-img">
        <section class="container">
            <div class="login-container">
                <div class="circle circle-one"></div>
                <div class="form-container">
                    <h1>LOGIN</h1>
                    <% MessageDisplay m=(MessageDisplay)session.getAttribute("msg");
                    	if(m!=null){
                    %>
                        <div class="alert <%=m.getCssClass()%>" role="alert">
                            <%=m.getContent() %>
                        </div>
                    <% 
                   	 session.removeAttribute("msg");
                    	}
                    %>
                    
                    <form action="login" method="post" name="myform">
                        <input type="text" placeholder="USERNAME" name="email" required/>
                        <input type="password" placeholder="PASSWORD" name="password" required/>
                        <button onclick="return validateform();">SUBMIT</button>
                    </form>
                    <div class="register-forget">
                        <a href="register.jsp">REGISTER</a>
                        <a href="forgotPass.jsp">Forgot Password</a>
                    </div>
                </div>
            </div>
        </section>
    </div>
    </center>
    <script>
      function validateform() {
        let password = document.myform.password.value;
        let x = document.myform.email.value;
        let atposition = x.indexOf("@");
        let dotposition = x.lastIndexOf(".");
        if (
          atposition < 1 ||
          dotposition < atposition + 2 ||
          dotposition + 2 >= x.length
        ) {
          alert("Please enter a valid e-mail address.");
          return false;
        }
        if (password.length < 6) {
          alert("Password must be at least 6 characters long.");
          return false;
        }
      }
    </script>
</body>
</html>
