<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/style1.css">
<title>Registration Form</title>
</head>
<body>
	<div class="container">

		<h3 id="registered" style="display: none;">Registered Successfully</h3>
		<h4 id="errormessage"></h4>

		<header>Registration</header>
		<form id="registrationForm" action="RegisterServlet" method="post">

			<div class="partition">
				<div class="p1">
					<label>Full Name*</label>
					<input type="text" placeholder="Enter your full name" id="fname"
						name="fname" required>

					<label>Designation*</label>
					<input type="text" placeholder="Enter your designation"
						id="designation" name="designation" required>

					<label>Email*</label>
					<input type="email" placeholder="Enter Email ID" id="eemail"
						name="eemail" required>

					<label>Region*</label>
					<input type="text" placeholder="Enter job location" name="region"
						id="region" required>
				</div>

				<div class="p2">
					<label for="manager">Reporting Manager*</label>
					<select name="reportingManager" id="reportingManager" required>
						<option value="">Select Reporting Manager</option>
					</select> <label>Employee Code*</label>
					<input type="number" placeholder="Enter employee code" id="ecode" name="ecode" required>

					<label>Password*</label>
					<input type="password" placeholder="Enter password" id="ppassword"
						name="ppassword" pattern="^[0-9]{1,6}$" required
						title="Password must be of 6 digits"> <span
						style="font-size: 10px;">Password must be 6 Digits only, No special characters or alphabets should be included.</span>

					<label>Confirm password*</label>
					<input type="password" placeholder="Re-enter password" id="cpassword" name="cpassword" required>
				</div>

			</div>
			<button type="submit">Submit</button>
		</form>
		<p>
			Already Have an Account? <a href="index.jsp">Login</a>
		</p>
	</div>
	<script src="JS/register.js"></script>
</body>
</html>
