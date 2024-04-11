<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@page import="com.dto.MessageDisplay" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Registration Page</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" 
    integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="register.css" />
    
    <style>
		* {
			  padding: 0px;
			  margin: 0px;
			}
			
			:root {
			  --background: #1a1a2e;
			  --color: #ffffff;
			  --primary-color: #0f3460;
			}
			
			body {
			  margin: 0;
			  box-sizing: border-box;
			  font-family: "Poppins", sans-serif;
			  background: var(--background);
			  color: var(--color);
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
			
			.registration-container {
			  position: relative;
			  width: 25.5rem;
			  background-color: rgba(255, 255, 255, 0.95);
			  color: rgb(35, 21, 121);
			  border-radius: 10px;
			  padding: 2rem;
			  box-shadow: 0 0 36px 1px rgba(0, 0, 0, 0.2);
			  transition: transform 0.3s ease-in-out;
			}
			
			.registration-container:hover {
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
			
			.registration-container form input {
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
			
			.registration-container form input:focus {
			  box-shadow: 0 0 16px 1px rgba(15, 52, 96, 0.4);
			}
			
			.registration-container form button {
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
			
			.registration-container form button:hover {
			  box-shadow: 0 0 10px 2px rgba(15, 52, 96, 0.6);
			  transform: scale(1.02);
			}
			
			.login-link {
			  margin-top: 1rem;
			  font-size: 14px;
			  text-align: center;
			}
			
			.login-link a {
			  color: var(--primary-color);
			}
			
			.login-link a:hover {
			  text-decoration: underline;
			}
    	
    </style>
  </head>
  <body>
  <centre>
    <section class="container">
      <div class="registration-container">
        <div class="form-container">
          <h1>REGISTER</h1>
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
                   
          <form action="registeradmin" method="post" name="myform" >
            <input type="text" placeholder="Full Name" name="fname" required />
            <input
              type="text"
              placeholder="Mobile Number"
              name="mobile"
              required
            />
            <input type="text" placeholder="Email" name="email" required />
            <input
              type="password"
              placeholder="Password"
              name="password"
              required
            />
            <button type="submit" onclick="return validateform();">
              REGISTER
            </button>
          </form>
          <div class="login-link">
            <p>Already have an account? <a href="Login.jsp">Login here</a></p>
          </div>
        </div>
      </div>
    </section>
    </centre>
    <script>
      function validateform() {
        let mobile = document.myform.mobile.value;
        let password = document.myform.password.value;
        let x = document.myform.email.value;
        let atposition = x.indexOf("@");
        let dotposition = x.lastIndexOf(".");
        if (
          atposition < 1 ||
          dotposition < atposition + 2 ||
          dotposition + 2 >= x.length
        ) {
          alert(
            "Please enter a valid e-mail address \n atpostion:" +
              atposition +
              "\n dotposition:" +
              dotposition
          );
          return false;
        }
        if (password.length < 6) {
          alert("Password must be at least 6 characters long.");
          return false;
        }
        if (mobile.length != 10) {
          alert("Mobile number must be 10 digit.");
          return false;
        }
      }
    </script>
    
  </body>
</html>
