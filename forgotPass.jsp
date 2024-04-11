<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
    
    <style>
    * {
		  padding: 0px;
		  margin: 0px;
		}
		
		:root {
		  --color: #ffffff;
		  --primary-color: #0f3460;
		}
		
		body {
		  margin: 0;
		  box-sizing: border-box;
		  font-family: "Poppins", sans-serif;		  
		  letter-spacing: 1px;
		  align: right;
		  background-image: url("https://www.supermarketperimeter.com/ext/resources/2022/10/10/commissary-food-waste-3.jpg?height=667&t=1665412512&width=1080");
		  min-height: 100vh;
		  background-size: cover;
		  display: flex;
		  flex-direction: column;
		  align-items: center;
		  justify-content: center;
		  
		}
		
		.login-container {
		  position: relative;
		  width: 25.5rem;
		  color: rgb(35, 21, 121);
		  background-color:white;
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
		  justify-content: center;
		  font-size: 14px;
		  opacity: 0.8;
		}
		
		.opacity {
		  opacity: 0.9;
		}
		
		.theme-btn-container {
		  position: absolute;
		  left: 0;
		  bottom: 2rem;
		}
		
		.theme-btn:hover {
		  width: 40px !important;
		}

    	
    </style>
</head>
<body>
    <section class="container">
        <div class="login-container">
            <div class="circle circle-one"></div>
            <div class="form-container">
                <h1 class="opacity2">FORGOT PASSWORD</h1>
                <!-- Step 1: Enter Username and Mobile Number -->
                <form action="forgotpassword1" method="post">
                    <input type="text" placeholder="USERNAME" name="email" required/>
                    <input type="tel" placeholder="MOBILE NUMBER" name="mobile" required/>
                    <button type="submit">NEXT</button>
                        
                </form>
                <div class="register-forget opacity">
                    <a href="Login.jsp">Back to Login</a>
                </div>
            </div>
            <div class="circle circle-two"></div>
        </div>
        <div class="theme-btn-container"></div>
    </section>
</body>
</html>