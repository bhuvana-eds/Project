<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name = "viewport" content = "width=device-width, initial-scale=1.0"/>
<title>Reset Password</title>
<link rel="stylesheet" href="http://localhost:8080/LocalConveyance/CSS/fp.css">
</head>
<body>
<main>
    <div class="containera" id="signinform">
    	<img src="http://localhost:8080/LocalConveyance/assets/EDST Logo.jpg" alt="company Logo">
        <h4 class="signup-header">RESET PASSWORD</h4>
        <% 
            // You can use this block to map error codes to user-friendly error messages
            String errorMessage = request.getParameter("error");
            if (errorMessage != null && !errorMessage.isEmpty()) { 
            	
           %>
           
           <div id="errormesssage" style="color:red">
           <%
                switch (errorMessage) {
                    default:
                        out.print("Invalid OTP");
                        break;
                }
            }
        %>
        <form id="resetPasswordForm" method="post" action="ResetPasswordServlet">
            <input type="hidden" name="email" value="<%= request.getParameter("email") %>">
            <input type="password" name="otp" placeholder="Enter OTP" required>
            <button type="submit" id="loginButton">Verify</button>
            <!-- <p class="signup-link">Remember your password? <a href="Signin.jsp" id="close-change-password">Sign In</a></p> -->
        </form>
        
         
        </div>
    </div>
</main>
</body>
</html>