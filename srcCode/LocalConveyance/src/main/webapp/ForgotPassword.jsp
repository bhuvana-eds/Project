<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name = "viewport" content = "width=device-width, initial-scale=1.0"/>
<title>Forgot Password</title>
<link rel="stylesheet" href="http://localhost:8080/LocalConveyance/CSS/fp.css">
</head>
<body>
      
<main>
    <div class="containera" id="signinform">
    <img src="http://localhost:8080/LocalConveyance/assets/EDST Logo.jpg" alt="company Logo">
        <h4 class="signup-header">FORGOT PASSWORD</h4>
         <% 
	        // You can use this block to map error codes to user-friendly error messages
	        String errorMessage = request.getParameter("error");
	        if (errorMessage != null && !errorMessage.isEmpty()) { 
	    %>
   		<div id="errormesssage2" style="color:red; text-align: center;"> 
	        <%
		         switch (errorMessage) {
		         	case "Invalid Email":
		            	out.print("Invalid Email ID, Please enter valid Email ID");
		                    break;
		                default:
		                    out.print("Registered Email ID not found, Please enter valid Email ID");
		                    break;
		            }
		        }
	        %>
    	
        <form id="loginform" method="post" action="ForgotPasswordServlet">
            <input type="text" name="email" id="loginEmail" placeholder="Enter email ID" required>
            <button type="submit" id="loginButton">Submit</button>
            <!-- <p class="signup-link">Don't have an account? <a href="index.jsp" id="close-change-password">Sign Up</a></p> -->
        </form>
    </div>
    </div>
    
    <script>
        setTimeout(function(){
            var displayErrorMessage = document.getElementById('errormesssage2');
            displayErrorMessage.style.display = "none";
        }, 10000);
    </script>
</main>    
</body>
</html>