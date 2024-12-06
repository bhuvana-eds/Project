<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.io.IOException"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="CSS/style3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<title>Finance Approval</title>
<style>
/* Styles for the modal */
.modal {
	display: none;
	position: fixed;
	z-index: 10000; /* Increased z-index value */
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
	justify-content: center;
	align-items: center;
}

/* Modal content */
.modal-content {
	margin: auto;
	display: block;
	width: 80%;
	max-width: 700px;
	background-color: #fefefe;
	padding: 20px;
	border-radius: 8px;
	position: relative;
}

/* Close button */
.close {
	color: red;
	float: right;
	font-size: 28px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

/* Image */
.modal-content img {
	width: 100%;
	height: auto;
}

#fromDate {
	width: 45%;
}

#toDate {
	width: 45%;
}

#name {
	width: 60%;
}

#same1 {
	width: 20%;
}

.apprbtn {
	padding-top: 0.5%;
	width: 70%;
	display: flex;
}

.abtn {
	width: 20%;
	text-align: right;
	padding-right: 0%;
}

.dtag {
	width: 100%;
	display: flex;
}

#dd {
	width: 70%;
	display: flex;
}

@media only screen and (max-width : 450px) {
	#fromDate {
		width: 30%;
	}
	#toDate {
		width: 30%;
	}
	#name {
		width: 90px;
	}
	#dd {
		display: block;
		width: 170%;
	}
	.apprbtn {
		display: block;
	}
	#same3 {
		padding: 1px;
	}
	#same2 label {
		padding: 3px;
	}
	#same3 label {
		padding: 3px;
	}
	#same1 {
		padding: 1px;
		width: 100%;
	}
	#same1 input {
		width: 30%;
	}
	#same1 label {
		padding: 3px;
	}
	.dtag {
		display: block;
		width: 360px;
		padding-left: 3px;
	}
	.dtag label {
		font-size: 13px;
	}
}
</style>
<script>
	function displayImage(base64String) {
		var modal = document.getElementById("myModal");
		var modalImg = document.getElementById("modalImage");
		modal.style.display = "block";
		modalImg.src = "data:image/png;base64," + base64String;
	}
	// Function to close the modal
	function closeModal() {
		var modal = document.getElementById("myModal");
		modal.style.display = "none";
	}

	// Function to handle clicks outside of the modal content
	window.onclick = function(event) {
		var modal = document.getElementById("myModal");
		if (event.target == modal) {
			closeModal();
		}
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
	document.addEventListener("DOMContentLoaded", function() {
		var currentPageUrl = window.location.href;
		var navLinks = document.querySelectorAll("nav a");

		navLinks.forEach(function(link) {
			if (link.href === currentPageUrl) {
				link.classList.add("active");
			}
		});
	});

	function filterTable() {
		var fromDate = document.getElementById("fromDate").value;
		var toDate = document.getElementById("toDate").value;
		var name = document.getElementById("name").value.toLowerCase(); // Convert to lowercase for case-insensitive comparison

		var rows = document.querySelectorAll('#expenseTable tbody tr');

		rows
				.forEach(function(row) {
					var dateOfTravelParts = row.cells[1].innerHTML.trim()
							.split("-"); // Date of Travel is the fourth column
					var day = parseInt(dateOfTravelParts[0]);
					var month = parseInt(dateOfTravelParts[1]) - 1; // Month is 0-indexed
					var year = parseInt(dateOfTravelParts[2]);
					var dateOfTravel = new Date(year, month, day);

					var fullName = row.cells[0].innerHTML.trim().toLowerCase(); // Name is the first column

					// Check if the row matches the filter criteria
					var dateInRange = (fromDate === "" || toDate === "" || (dateOfTravel >= new Date(
							fromDate) && dateOfTravel <= new Date(toDate)));
					var nameMatches = (name === "" || fullName.includes(name));

					// Show/hide the row based on the filter criteria
					row.style.display = (dateInRange && nameMatches) ? ""
							: "none";
				});
	}
	function resetFilter() {
		// Reset input fields
		document.getElementById("fromDate").value = "";
		document.getElementById("toDate").value = "";
		document.getElementById("name").value = "";

		// Reset table rows
		var rows = document.querySelectorAll('#expenseTable tbody tr');
		rows.forEach(function(row) {
			row.style.display = "";
		});
	}
	function updateToDateMin() {
		var fromDateInput = document.getElementById("fromDate");
		var toDateInput = document.getElementById("toDate");

		// Get the selected from date value
		var fromDateValue = fromDateInput.value;

		// Set the minimum date for the to date input to be the selected from date
		toDateInput.min = fromDateValue;
	}

	// Call the function once on page load to initialize the minimum date for the "To Date" input field
	updateToDateMin();
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
			<a id="createFormLink" href="createform.jsp">Create Form</a> 
			<a id="myFormsLink" href="MyForms.jsp">My Forms</a> 
			<a href="#" class="active">Approve Forms</a>
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
			<div class="active">
				<a href="#">Approve Forms</a>
			</div>
		</div>
	</header>

	<main>

		<div class="apprbtn">
			<div id="dd">
				<div id="same3">
					<label>From Date of Travel:</label> <input type="date"
						id="fromDate" onchange="updateToDateMin()">
				</div>
				<div id="same2">
					<label>To Date of Travel:</label> <input type="date" id="toDate">
				</div>
				<div id="same1">
					<label>Name:</label> <input type="text" id="name">
				</div>
			</div>
			<div id="buttons">
				<button onclick="filterTable()">Go</button>
				<button onclick="resetFilter()">Reset</button>
			</div>
		</div>

		<form action="FinanceServlet2" method="post">
			<div style="overflow-x: auto;">
				<table id="expenseTable">
					<thead>
						<tr>
							<th>Name</th>
							<th>Date of travel</th>
							<th>Claimed Date</th>
							<th>Approved Date</th>
							<th>Particulars</th>
							<th>Mode</th>
							<th>Distance in KMs</th>
							<th>Amount</th>
							<th>Approved Amount</th>
							<th>View Bill</th>
							<th>Action*</th>
							<th>Remarks</th>
						</tr>
					</thead>
					<tbody>
						<%
						String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";
						JSONParser parser = new JSONParser();
						try (FileReader reader = new FileReader(filePath)) {
							JSONObject formData = (JSONObject) parser.parse(reader);
							for (Iterator iterator = formData.keySet().iterator(); iterator.hasNext();) {
								String employeeCode = (String) iterator.next();
								JSONObject employeeData = (JSONObject) formData.get(employeeCode);
								for (Iterator formIterator = employeeData.keySet().iterator(); formIterator.hasNext();) {
							String formId = (String) formIterator.next();
							JSONObject form = (JSONObject) employeeData.get(formId);
							String status = (String) form.get("Status");
							if ("Approved".equals(status)) {
								String uniqueNamePrefix = employeeCode + "_" + formId;
						%>
						<tr>
							<td><%=form.get("FullName")%><input type="hidden"
								name="eCode" value="<%=employeeCode%>"><input
								type="hidden" name="formId" value="<%=form.get("FormId")%>"></td>
							<td><%=form.get("Date of travel")%></td>
							<td><%=form.get("Claimed Date")%></td>
							<td><%=form.get("Approved Date")%></td>
							<td><%=form.get("Particulars")%></td>
							<td><%=form.get("Mode")%></td>
							<td><%=form.get("Distance In Kms")%></td>
							<td style="text-align: right;"><%=form.get("Amount")%></td>
							<td><input style="text-align: right;"
								name="aAmount_<%=uniqueNamePrefix%>"
								value="<%=form.get("Amount")%>"></td>
							<td>
								<%
								String document = (String) form.get("Upload Document");
								if (document != null && !document.isEmpty()) {
								%> <a href="#" onclick="displayImage('<%=document%>')">View
									document</a> <%
 } else {
 %> - <%
 }
 %>
							</td>
							<td>
								<div class="df">
									<div class="d1">
										<input type="radio" id="accept_<%=uniqueNamePrefix%>"
											name="accept_<%=uniqueNamePrefix%>" value="accept">
									</div>
									<label for="html">Settle</label>
								</div>
								<div class="dg">
									<div class="d3">
										<input type="radio" id="reject_<%=uniqueNamePrefix%>"
											name="approval_<%=uniqueNamePrefix%>" value="reject">
									</div>
									<div class="d4">
										<label for="reject_<%=uniqueNamePrefix%>">Modify</label>
									</div>
								</div>
							</td>
							<td><textarea name="particulars_<%=uniqueNamePrefix%>"
									id="particulars_<%=uniqueNamePrefix%>" rows="2"
									class="formControl"></textarea></td>
						</tr>
						<%
						}
						}
						}
						} catch (Exception e) {
						e.printStackTrace();
						}
						%>
					</tbody>
				</table>
			</div>
			<div class="sbtn">
				<button id="submitBtn">Submit</button>
			</div>
		</form>
	</main>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span> <img
				id="modalImage" src="" alt="Image">
		</div>
	</div>
</body>
</html>