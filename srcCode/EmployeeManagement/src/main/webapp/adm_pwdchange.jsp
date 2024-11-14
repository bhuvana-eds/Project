<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Employee Management System - Employee Portal</title>
    <link href="https://unpkg.com/boxicons@2.1.2/css/boxicons.min.css" rel="stylesheet"/>
    <link rel="stylesheet" href="style.css"/>
    <script src="index.js"></script>
  </head>
  <header class="index-main-section">
    <nav>
		<ul class="e_ul" onclick="activetab()">
            <img id="img-section" src="images\Logo.jpg" alt="EDS Technologies">
			<li class="nav-item" id="home">
			<a href="admportal_values.jsp#personal">Personal Details</a>
			</li>
			<li class="nav-item" id="about">
			<a href="admportal_values.jsp#qualification">Qualification</a>
			</li>
			<li class="nav-item" id="services">
			<a href="admportal_values.jsp#work">Work Experience</a>
			</li>
			<li class="nav-item" id="contact">
			<a href="admportal_values.jsp#documents">Documents Upload</a>
			</li>
            <li>
                <button id="btn-link" onclick="myFunction()" class="portal-dropbtn"> Madhurya </button>
                <!-- <img src="images/user-icon.png" id="user_icon" alt="user"><br>  -->
                <div id="myDropdown" class="portal-dropdown-content" style="margin-right: 50px;">
                    <a href="adm_registration.jsp">Registration</a>
                    <a href="emp_list.jsp">Employee Details</a>
                    <a href="adm_pwdchange.jsp">Change Password</a>
                    <a href="home.jsp">Logout</a>
                </div>
            </li>
		</ul>
	</nav>

</header>
  <body class="pwdchange-body">
    <div class="pwdchange-container">
      <form action="emp_pwdchange_success.jsp" class="pwdchange-form">

        <div class="pwd-title">
          <h2 class="pwdchange-title">Change Password</h2><br>
        </div><br>

        <div class="pwdchange email-field">
          <div class="pwdchange-field">
            <label class="pwdchange-inputLabel" for="password">Current Password</label>
            <input type="email" placeholder="Enter your email" class="email"/>
          </div>
          <span class="error email-error">
            <i class="bx bx-error-circle error-icon"></i>
            <p class="error-text">Password is incorrect</p>
          </span>
        </div><br><br>

        <div class="pwdchange create-password">
          <div class="pwdchange-field">
            <label class="pwdchange-inputLabel" for="password">New Password</label>
            <input type="password" placeholder="Create password" class="password"/>
            <i class="bx bx-hide show-hide"></i>
          </div>
          <span class="error password-error">
            <i class="bx bx-error-circle error-icon"></i>
            <p class="error-text">
              Please enter atleast 8 character which includes number, symbol, small and
              capital letter.
            </p>
          </span>
        </div><br><br>

        <div class="pwdchange confirm-password">
          <div class="pwdchange-field">
            <label class="pwdchange-inputLabel" for="confirmPassword">Confirm Password</label>
            <input type="password" placeholder="Confirm password" class="cPassword"/>
            <i class="bx bx-hide show-hide"></i>
          </div>
          <span class="error cPassword-error">
            <i class="bx bx-error-circle error-icon"></i>
            <p class="error-text">Password don't match</p>
          </span>
        </div><br><br>

        <div class="pwdchange-field update-button">
          <input type="submit" value="Update" />
        </div>
        <br><br>
      </form>
    </div>
   <script>
    const form = document.querySelector("form"),
  emailField = form.querySelector(".email-field"),
  emailInput = emailField.querySelector(".email"),
  passField = form.querySelector(".create-password"),
  passInput = passField.querySelector(".password"),
  cPassField = form.querySelector(".confirm-password"),
  cPassInput = cPassField.querySelector(".cPassword");

// Email Validation
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

// Confirm Password Validtion
function confirmPass() {
  if (passInput.value !== cPassInput.value || cPassInput.value === "") {
    return cPassField.classList.add("invalid");
  }
  cPassField.classList.remove("invalid");
}

// Calling Funtion on Form Sumbit
form.addEventListener("submit", (e) => {
  e.preventDefault(); //preventing form submitting
  checkEmail();
  createPass();
  confirmPass();

  //calling function on key up
  emailInput.addEventListener("keyup", checkEmail);
  passInput.addEventListener("keyup", createPass);
  cPassInput.addEventListener("keyup", confirmPass);

  if (
    !emailField.classList.contains("invalid") &&
    !passField.classList.contains("invalid") &&
    !cPassField.classList.contains("invalid")
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