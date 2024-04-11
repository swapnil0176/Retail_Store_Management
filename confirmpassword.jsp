<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirm Password</title>
    <link rel="stylesheet" href="register.css">
</head>
<body>
    <section class="container">
        <div class="login-container">
            <div class="circle circle-one"></div>
            <div class="form-container">
                <h1 class="opacity2">CONFIRM PASSWORD</h1>
                <!-- Step 2: Enter New Password and Confirm Password -->
                <form action="confirmpassword1" method="post" onsubmit="return validateForm()">
                    <input type="password" placeholder="NEW PASSWORD" name="newpassword" id="newpassword" required/>
                    <input type="password" placeholder="CONFIRM PASSWORD" name="confirmpassword" id="confirmpassword" required/>
                    <button class="opacity">SUBMIT</button>
                </form>
                <div class="register-forget opacity">
                    <a href="login.html">Back to Login</a>
                </div>
            </div>
            <div class="circle circle-two"></div>
        </div>
        <div class="theme-btn-container"></div>

        <script>
            function validateForm() {
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
                }
                if (password.length < 6) {
                  alert("Password must be at least 6 characters long.");
                  return false;
                }
                if (mobile.length != 10) {
                  alert("Mobile number must be 10 digit.");
                  return false;
                }
                let newPassword = document.getElementById('newpassword').value;
                let confirmPassword = document.getElementById('confirmpassword').value;

                if (newPassword !== confirmPassword) {
                    alert("New Password and Confirm Password do not match");
                    return false;
                }
                return true;
            }
        </script>
    </section>
</body>
</html>