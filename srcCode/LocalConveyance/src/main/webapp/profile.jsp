<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.*, java.util.*, org.json.simple.*"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%
// Fetch session attribute
String employeeCode = (String) session.getAttribute("employeecode");

// Read JSON file
JSONParser parser = new JSONParser();
JSONObject jsonObject = null;
try {
	Object obj = parser.parse(new FileReader("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json"));
	jsonObject = (JSONObject) obj;
} catch (Exception e) {
	e.printStackTrace();
}

// Get user details based on employeeCode
JSONObject userDetails = (JSONObject) jsonObject.get(employeeCode);

// Populate form fields with user details
String fullName = (String) userDetails.get("Full Name");
String designation = (String) userDetails.get("Designation");
String email = (String) userDetails.get("Email");
String region = (String) userDetails.get("Region");
String reportingManager = (String) userDetails.get("Reporting Manager");
String employeeCodeValue = employeeCode;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/styleprofile.css">
<link rel="stylesheet" href="CSS/style2.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<title>Profile</title>
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
	<div class="container">
		<h3 id="registered" style="display: none;">Updated Successfully</h3>
		<h4 id="errormessage"></h4>
		<header>Profile</header>
		<form id="registrationForm" action="ModifyDetails.jsp" method="post">
			<div class="partition">

				<table>
					<tr>
						<td><label>Full Name:</label></td>
						<td>
							<h5><%=fullName%></h5>
						</td>
					</tr>
					<tr>
						<td><label>Designation:</label></td>
						<td>
							<h5><%=designation%></h5>
						</td>
					</tr>
					<tr>
						<td><label>Email:</label></td>
						<td>
							<h5><%=email%></h5>
						</td>
					</tr>
					<tr>
						<td><label>Region:</label></td>
						<td>
							<h5><%=region%></h5>
						</td>
					</tr>
					<tr>
						<td><label for="manager">Reporting Manager:</label></td>
						<td>
							<h5><%=reportingManager%></h5> <input type="hidden"
							placeholder="Enter employee code" id="ecode" name="ecode"
							value="<%=employeeCodeValue%>" required readonly>
						</td>
					</tr>
				</table>

			</div>
			<div class="bbtn">
				<div class="b1">
					<button type="button"
						onclick="window.location.href = 'createform.jsp';">Close</button>
				</div>
			</div>
		</form>
	</div>
	<script>
    window.onload = function () {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "ReportingManagerOptionServlet", true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4 && xhr.status == 200) {
                var selectElement = document.getElementById("reportingManager");
                selectElement.innerHTML = '<option value="" disabled selected>Select Reporting Manager</option>' + xhr.responseText;
            }
        };
        xhr.send();
    };
    function setErrorMessage(message) {
        var errorMessageElement = document.getElementById('errormessage');
        errorMessageElement.innerText = message;
        errorMessageElement.style.display = 'block'; // Display the error message element
    }

    // Variable to track whether any field is modified
    var isModified = false;

    // Function to mark the form as modified
    function markAsModified() {
        isModified = true;
    }

    // Function to validate email format
    function validateEmail() {
        var emailInput = document.getElementById('eemail');
        var email = emailInput.value.trim();

        // Regular expression for email validation
        var emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        // Check if email matches the regular expression
        if (!emailRegex.test(email)) {
            // Display error message
            setErrorMessage("Please enter a valid email address.");
            setTimeout(() => {
                errorMessageElement.style.display = 'none';
            }, 3000);
            emailInput.focus(); // Focus back on the email field
            return false; // Prevent form submission
        } else {
            // Hide error message if email is valid
            setErrorMessage(""); // Clear error message if email is valid
            return true; // Allow form submission
        }
    }

    // Function to execute email validation when email field is modified
    document.getElementById('eemail').addEventListener('input', function() {
        validateEmail();
        markAsModified(); // Mark form as modified when email is changed
    });

    // Function to validate form submission
    function validateForm() {
        if (!isModified) {
            setErrorMessage("Please modify at least one field before submitting."); // Alert user if no field is modified
            return false; // Prevent form submission if no field is modified
        }
        return validateEmail(); // Only validate email on form submission
    }

    // Attach form submission validation to form submit event
    document.getElementById('registrationForm').addEventListener('submit', function(event) {
        if (!validateForm()) {
            event.preventDefault(); // Prevent form submission if validation fails
        }
    });

    // Function to handle servlet response
    function handleResponse(response) {
        setErrorMessage(response); // Set the response as the error message
        setTimeout(() => {
            errorMessageElement.style.display = 'none';
        }, 3000);
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
</body>
</html>