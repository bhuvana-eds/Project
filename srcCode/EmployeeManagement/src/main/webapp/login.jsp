<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Management System</title>
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="style.css"/>
  </head>
  <header class="index-main-section">
    <nav id="mynav">
      <ul>
          <img id="img-section" src="images\Logo.jpg" alt="EDS Technologies">
          <li class="btn-link"><a href="home.jsp">Home</a></li>
          <li class="btn-link"><a href="about.jsp">About</a></li>
          <li class="btn-link"><a href="industries.jsp">Industries</a></li>
          <li class="btn-link"><a href="services.jsp">Services</a></li>
          <li class="btn-link active"><a href="login.jsp">Login</a></li>
      </ul>
  </nav>
  </header>
  <body class="pwdchange-body" style="overflow-y: scroll;">
    <div class="login-container">
      <form action="admportal_values.jsp" class="pwdchange-form login-form">
        
        <div class="login-title">
        <h2 class="pwdchange-title">LOGIN</h2>
        </div>

        <div class="pwdchange email-field">
          <div class="pwdchange-field">
            <label class="pwdchange-inputLabel" for="password">Email</label>
            <input type="email" placeholder="Enter your email" class="email" name="email"/>
          </div>
          <span class="error email-error">
            <i class="bx bx-error-circle error-icon"></i>
            <p class="error-text">Email ID is incorrect</p>
          </span>
        </div>

        <div class="pwdchange create-password">
          <div class="pwdchange-field">
            <label class="pwdchange-inputLabel" for="password">Password</label>
            <input type="password" placeholder="Create password" class="password" name="pwd"/>
            <i class="bx bx-hide show-hide"></i>
          </div>
          <span class="error password-error">
            <i class="bx bx-error-circle error-icon"></i>
            <p class="error-text">Incorrect Password </p>
          </span>
        </div>

        <div class="login-cont">
          <div class="login-forgot-pwd">
             <a href="forgotpwd.jsp">Forgot password?</a>
          </div>
       </div>

        <div class="pwdchange-field update-button">
          <input type="submit" value="Login" />
        </div>

        <div class="login-register-link">
          Not a member? <a href="emp_registration.jsp">Register</a>
       </div>
       <br>
      </form>
    </div>

<script>

    const form = document.querySelector("form"),
  emailField = form.querySelector(".email-field"),
  emailInput = emailField.querySelector(".email"),
  passField = form.querySelector(".create-password"),
  passInput = passField.querySelector(".password");

// Email Validtion
function checkEmail() {
  const emaiPattern = /^[^ ]+@[^ ]+\.[a-z]{2,3}$/;
  if (!emailInput.value.match(emaiPattern)) {
    return emailField.classList.add("invalid"); //adding invalid class if email value do not mathced with email pattern
  }
  emailField.classList.remove("invalid"); //removing invalid class if email value matched with emaiPattern
}

// Hide and show password
const eyeIcons = document.querySelectorAll(".show-hide");

eyeIcons.forEach((eyeIcon) => {
  eyeIcon.addEventListener("click", () => {
    const pInput = eyeIcon.parentElement.querySelector("input"); //getting parent element of eye icon and selecting the password input
    if (pInput.type === "password") {
      eyeIcon.classList.replace("bx-hide", "bx-show");
      return (pInput.type = "text");
    }
    eyeIcon.classList.replace("bx-show", "bx-hide");
    pInput.type = "password";
  });
});

// Password Validation
function createPass() {
  const passPattern =
    /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;

  if (!passInput.value.match(passPattern)) {
    return passField.classList.add("invalid"); //adding invalid class if password input value do not match with passPattern
  }
  passField.classList.remove("invalid"); //removing invalid class if password input value matched with passPattern
}



// Calling Funtion on Form Sumbit
form.addEventListener("submit", (e) => {
  e.preventDefault(); //preventing form submitting
  checkEmail();
  createPass();

  //calling function on key up
  emailInput.addEventListener("keyup", checkEmail);
  passInput.addEventListener("keyup", createPass);

  if (
    !emailField.classList.contains("invalid") &&
    !passField.classList.contains("invalid") 
  ) {
    location.href = form.getAttribute("action");
  }
});
   </script>
  </body>
<footer class="index-footer">
    &copy;2024 EDS Technologies Pvt. Ltd.
</footer>
</html>