<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/style.css">
<title>Login</title>
</head>
<body>
	<div class="login-container">
		<h4 id="errormessage"></h4>
		<div class="image">
			<img src="assets/logo.png" alt="logo">
		</div>

		<h2>Login</h2>
		<form method="post" id="loginform" action="LoginServlet">
			<label for="email">Email:</label> <input type="email" id="email"
				name="email" required> <label for="password">Password:</label>
			<input type="password" id="password" name="password" required>

			<button type="submit">Submit</button>
		</form>
		<div class="links">
			<p>
				Don't have an account? <a href="register.jsp">Register</a>
			</p>
			<p>
				Forgot Password? <a href="ForgotPassword.jsp">Click here</a>
			</p>
		</div>
	</div>
	<script>
		function displayErrorMessage(message) {
			document.getElementById("errormessage").innerText = message;
			setTimeout(function() {
				document.getElementById("errormessage").innerText = "";
			}, 3000);
		}

		window.onload = function() {
			var urlParams = new URLSearchParams(window.location.search);
			var errorMessage = urlParams.get('error');

			if (errorMessage && errorMessage.length > 0) {
				displayErrorMessage(errorMessage);
			}
		};
	</script>
</body>
</html>

