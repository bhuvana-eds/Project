function solve() { // Defines the solve function
	var emailInput = document.getElementById("eemail"); // Retrieves the email input element
	var passwordInput = document.getElementById("ppassword"); // Retrieves the password input element
	var confirmPasswordInput = document.getElementById("cpassword"); // Retrieves the confirm password input element

	// Validate email format
	var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // Defines a regular expression for validating email format
	if (!emailRegex.test(emailInput.value)) { // Checks if the email input matches the email format
		displayErrorMessage("Please enter a valid email address."); // Displays an error message for invalid email
		setTimeout(() => { // Sets a timer to hide the error message after 3 seconds
			errorMessageElement.style.display = 'none';
		}, 3000);
		return;  // Stops further execution if email is invalid
	}

	// Validate password format
	var passwordRegex = /^[0-9]{6}$/; // Defines a regular expression for validating password format (6 digits)
	if (!passwordRegex.test(passwordInput.value)) { // Checks if the password input matches the password format
		displayErrorMessage("Invalid Password, Password must contain 6 digits."); // Displays an error message for invalid password
		setTimeout(() => { // Sets a timer to hide the error message after 3 seconds
			errorMessageElement.style.display = 'none';
		}, 3000);
		return;  // Stops further execution if password is invalid

	}

	// Validate password and confirm password match
	if (passwordInput.value !== confirmPasswordInput.value) { // Checks if password and confirm password match
		displayErrorMessage("Passwords do not match."); // Displays an error message for password mismatch
		setTimeout(() => { // Sets a timer to hide the error message after 3 seconds
			errorMessageElement.style.display = 'none';
		}, 3000);
		return;  // Stops further execution if passwords don't match
	}

	// If all validations pass, submit the form
	registerUser(); // Calls the function to register the user
}

function registerUser() { // Defines the function to register the user
	var emailInput = document.getElementById("eemail").value; // Retrieves the value of email input
	var passwordInput = document.getElementById("ppassword").value; // Retrieves the value of password input
	var fullnameInput = document.getElementById("fname").value; // Retrieves the value of full name input
	var designationInput = document.getElementById("designation").value; // Retrieves the value of designation input
	var regionInput = document.getElementById("region").value; // Retrieves the value of region input
	var reportingMInput = document.getElementById("reportingManager").value; // Retrieves the value of reporting manager input
	var employeeCodeInput = document.getElementById("ecode").value; // Retrieves the value of employee code input

	// Sends a POST request to register the user
	fetch('http://localhost:8080/LocalConveyance/RegisterServlet', { // Specifies the URL and HTTP method
		method: 'POST', // Specifies the HTTP method as POST
		headers: { // Specifies request headers
			'Content-Type': 'application/x-www-form-urlencoded', // Specifies the content type
		},
		body: `eemail=${encodeURIComponent(emailInput)}&ppassword=${encodeURIComponent(passwordInput)}&fname=${encodeURIComponent(fullnameInput)}&designation=${encodeURIComponent(designationInput)}&region=${encodeURIComponent(regionInput)}&reportingManager=${encodeURIComponent(reportingMInput)}&ecode=${encodeURIComponent(employeeCodeInput)}`, // Specifies the request body
	})
		.then(response => response.json()) // Parses the JSON response
		.then(data => { // Handles the response data
			if (data.success) { // Checks if registration is successful
				document.getElementById('registered').style.display = 'block'; // Displays the success message
				document.getElementById('errormessage').style.display = 'none'; // Hides the error message
				// Redirect after 3 seconds
				setTimeout(() => { // Sets a timer to redirect after 2 seconds
					window.location.href = 'index.jsp'; // Redirects to the specified URL
				}, 2000);
			} else { // If registration is not successful
				displayErrorMessage(data.message); // Displays the error message
			}
		})
		.catch(error => console.error('Error:', error)); // Handles any errors that occur during the fetch operation
}

function displayErrorMessage(message) { // Defines the function to display error message
	const errorMessageElement = document.getElementById('errormessage'); // Retrieves the error message element
	errorMessageElement.innerText = message; // Sets the error message text
	errorMessageElement.style.display = 'block'; // Displays the error message

	setTimeout(() => { // Sets a timer to hide the error message after 3 seconds
		errorMessageElement.style.display = 'none';
	}, 3000);
}

document.getElementById('registrationForm').addEventListener('submit', function(event) { // Adds an event listener to the registration form submission
	event.preventDefault(); // Prevents the default form submission behavior
	solve();  // Calls the solve function when the form is submitted
});

/*register page reporting manager script*/
window.onload = function() {
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "ReportingManagerOptionServlet", true);
	xhr.onreadystatechange = function() {
		if (xhr.readyState == 4 && xhr.status == 200) {
			var selectElement = document.getElementById("reportingManager");
			selectElement.innerHTML = '<option value="" disabled selected>Select Reporting Manager</option>' + xhr.responseText;
		}
	};
	xhr.send();
};
