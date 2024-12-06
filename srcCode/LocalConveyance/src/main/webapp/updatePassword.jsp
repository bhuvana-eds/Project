<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name = "viewport" content = "width=device-width, initial-scale=1.0"/>
<title>Update Password</title>
<link rel="stylesheet" href="http://localhost:8080/LocalConveyance/CSS/fp.css">
</head>
<body>
<main>

    <div class="containera">
    	<img src="http://localhost:8080/LocalConveyance/assets/EDST Logo.jpg" alt="company Logo">
        <h3 class="signup-header">UPDATE PASSWORD</h3>
        <% 
            // You can use this block to map error codes to user-friendly error messages
            String errorMessage = request.getParameter("error");
            if (errorMessage != null && !errorMessage.isEmpty()) { 
            	
           %>
           
           <div id="errormesssage" style="color:red">
           <%
                switch (errorMessage) {
                    case "New and confirm passwords do not match":
                        out.print("New and confirm passwords do not match");
                        break;
                    default:
                        out.print("An error occurred.");
                        break;
                }
            }
        %>
        
        <form id="signupform" action="ForgotUpdateServlet" method="post" >
           
         <input type="hidden" name="email" value="<%= session.getAttribute("email") %>">
           
          <input type="password" name="updatepassword" placeholder="Create a password"  id="password" required> 
    
          <input type="password" name="confirm_update" placeholder="Confirm password" id="confirmPassword" required> 
    
          <button type="submit" id="signupbutton">Update</button>
 
         <!--  <span id="passwordError">Passwords do not match</span> -->
    
        <!--   <p class="login-link">Remember Password <a href="index.jsp" id="close-change-password">Signin</a></p> -->
          
        </form>
        </div>
      </div>
</main>    
</body>
</html>