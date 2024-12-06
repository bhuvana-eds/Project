<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="CSS/style.css">
<link rel="stylesheet" href="CSS/style2.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<title>Change Password</title>
<script>
	function displayErrorMessage(message) {
		document.getElementById("errormessage").innerText = message;
		setTimeout(function() {
			document.getElementById("errormessage").innerText = "";
		}, 3000);
	}
	function validateForm() {
		var newPassword = document.getElementById("npassword").value;
		var confirmPassword = document.getElementById("cpassword").value;
		var newPasswordPattern = /^[0-9]{6}$/;

		if (!newPasswordPattern.test(newPassword)) {
			displayErrorMessage("Invalid Password. Password must contain 6 digits.");
			return false;
		}

		if (newPassword !== confirmPassword) {
			displayErrorMessage("Passwords do not match.");
			return false;
		}
		return true;
	}
	function toggleDropdown() {
		var dropdownMenu = document.getElementById("dropdownMenu");
		dropdownMenu.style.display = (dropdownMenu.style.display === "block") ? "none"
				: "block";
	}
	function toggleDropdownNav() {
		var dropdownMenu = document.getElementById("dropdownMenu-nav");
		dropdownMenu.style.display = (dropdownMenu.style.display === "block") ? "none"
				: "block";
	}
</script>
</head>
<body>
	<header>
		<div class="heads">
			<div class="landn">
				<div class="image">
					<img src="assets/logo.png" alt="logo">
				</div>

				<div class="name">
					<h2>Local Travel Expenditure Claim</h2>
				</div>
			</div>
			<div class="profile-section">
				<div class="user-info">
					<div class="user-name">
						<%
						String employeeName = (String) session.getAttribute("fullname");
						if (employeeName != null) {
							out.println(employeeName);
						} else {
							out.println("Employee Name Not Available");
						}
						%>
					</div>
					<div class="user-id">
						ID:
						<%
					String employeeID = (String) session.getAttribute("employeecode");
					if (employeeID != null) {
						out.println(employeeID);
					} else {
						out.println("Employee ID Not Available");
					}
					%>
					</div>
				</div>
				<div class="icon">
					<div class="profile-icon">
						<a onclick="toggleDropdown()"><i
							class="fa-solid fa-user extraClass"></i></a>
					</div>
					<div class="dropdown-menu" id="dropdownMenu">
						<a href="profile.jsp">Profile</a> <a href="changePassword.jsp">Change
							Password</a> <a href="index.jsp" onclick="logout()">Logout</a>
					</div>
				</div>
			</div>
		</div>
		<nav>
			<a href="createform.jsp">Create Form</a> 
			<a href="MyForms.jsp">My Forms</a>
			<%
			// Set UserType attribute in session if it's not already set
			String userType = (String) session.getAttribute("userType");
			if (userType == null) {
			    userType = "Default UserType"; // Set a default value if UserType is not available
			    session.setAttribute("userType", userType);
			}
			%>

			<%
			if ("Approving Authority".equals(userType)) {
			%>
			<a href="ApprovalForm.jsp">Approve Forms</a>
			<%
			} else if ("Finance".equals(userType)) {
			%>
			<a href="FinanceApproval.jsp">Approve Forms</a>
			<%
			}
			%>
			<div class="navHidden" onclick="toggleDropdownNav()">
				<i class="fa-solid fa-bars"></i>
			</div>
		</nav>
		<div class="dropdown-menu-nav" id="dropdownMenu-nav">
			<div>
				<a href="createform.jsp">Create Form</a>
			</div>
			<div>
				<a href="MyForms.jsp">My Forms</a>
			</div>
		</div>
	</header>
	<div class="login-container1">
		<h4 id="errormessage"></h4>
		<div class="bbtn">
			<div class="b1">
				<button type="button"
					onclick="window.location.href = 'createform.jsp';">Close</button>
			</div>
		</div>
		<h2>Change Password</h2>

		<form method="post" id="loginform" action="changePasswordServlet"
			onsubmit="return validateForm();">
			<label for="opassword">Old Password:</label> <input type="password"
				id="opassword" name="opassword" required> <label
				for="npassword">New Password:</label> <input type="password"
				id="npassword" name="npassword" required> <label
				for="cpassword">Confirm Password:</label> <input type="password"
				id="cpassword" name="cpassword" required>

			<button type="submit">Submit</button>

		</form>
		<script>
			window.onload = function() {
				var urlParams = new URLSearchParams(window.location.search);
				var errorMessage = urlParams.get('error');

				if (errorMessage && errorMessage.length > 0) {
					displayErrorMessage(errorMessage);
				}
			};
		</script>
	</div>
</body>
</html>