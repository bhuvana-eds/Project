<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Employee Management System - Admin Portal</title>
    <link rel="stylesheet" href="style.css">
    <script src="index.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
</head>
<header class="index-main-section">
    <nav>
		<ul class="e_ul" onclick="activetab()">
            <img id="img-section" src="images\Logo.jpg" alt="EDS Technologies">
			<li class="nav-item" id="home">
			<a href="admportal.jsp#personal">Personal Details</a>
			</li>
			<li class="nav-item" id="about">
			<a href="admportal.jsp#qualification">Qualification</a>
			</li>
			<li class="nav-item" id="services">
			<a href="admportal.jsp#work">Work Experience</a>
			</li>
			<li class="nav-item" id="contact">
			<a href="admportal.jsp#documents">Documents Upload</a>
			</li>
            <li>
                <button id="btn-link" onclick="myFunction()" class="portal-dropbtn"> Madhurya </button>
                <!-- <img src="images/user-icon.png" id="user_icon" alt="user"><br>  -->
                <div id="myDropdown" class="portal-dropdown-content" style="width: 150px; right: 35px; text-orientation: inherit;">
                    <a href="adm_registration.jsp" class="active">Registration</a>
                    <a href="emp_list.jsp">Employee Details</a>
                    <a href="adm_pwdchange.jsp">Change Password</a>
                    <a href="home.jsp">Logout</a>
                </div>
            </li>
		</ul>
	</nav>

</header>
<body class="reg-body">
    <div class="reg-gap"> 
    </div>
    <div class="reg-container">
        <div class="title">
            Employee Registration
        </div>
        <div class="reg-content">
            <form class="reg-form" action="AdminRegistration" name="admregisterForm">
                <div class="reg-user-details">
                    <div class="input-box">
                        <span class="details">
                            Full Name *
                        </span>
                        <input type="text" placeholder="Enter your name" name="name" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Date of Birth *
                        </span>
                        <input type="date" placeholder="Enter your dob" name="dob" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Email *
                        </span>
                        <input type="text" placeholder="Enter your email" name="email" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Phone Number *
                        </span>
                        <input type="text" placeholder="Enter your number" name="phno" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Father Name 
                        </span>
                        <input type="text" placeholder="Enter your father name" name="fname" required>
                    </div>
                    <div class="input-box">
                        <span class="details">
                            Mother Name
                        </span>
                        <input type="text" placeholder="Enter your mother name" name="mname" required>
                    </div>
                </div>
                <div class="reg-gender-details" required>
                    <input type="radio" name="gender" id="dot-1">
                    <input type="radio" name="gender" id="dot-2">
                    <input type="radio" name="gender" id="dot-3">
                    <span class="gender-title">
                        Gender *
                    </span>
                    <div class="category">
                        <label for="dot-1">
                            <span class="dot one"></span>
                            <span class="gender">Male</span>
                        </label>
                        <label for="dot-2">
                            <span class="dot two"></span>
                            <span class="gender">Female</span>
                        </label>
                        <label for="dot-3">
                            <span class="dot three"></span>
                            <span class="gender">Prefer not to say</span>
                        </label>
                    </div>
                </div>
                
                <button id="register-btn" onclick="validateAdmRegister()" type="submit">Initiate Registration</button>
                <button id="register-btn" onclick="window.location.href='admportal_values.jsp'" type="submit">Back</button>
            </form>
        </div>
    </div>
</body>
<footer class="index-footer">
    &copy;2024 EDS Technologies Pvt. Ltd.
</footer>
</html>