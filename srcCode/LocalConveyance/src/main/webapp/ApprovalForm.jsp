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
<title>Approval</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
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

.abtn button {
    font-size: 14px; /* Adjust the font size as needed */
    padding: 5px 10px; /* Adjust the padding to make the buttons smaller */
    margin-right: 10px; /* Add some space between buttons */
}


.abtn {
	width: 25%;
	text-align: right;
	padding-right: 0%;
	display: flex;
	justify-content: space-between;
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
		padding: 1px;
	}
	#same3 label {
		padding: 1px;
	}
	#same1 {
		padding: 1px;
		width: 100%;
	}
	#same1 input {
		width: 30%;
	}
	#same1 label {
		padding: 1px;
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
	function approveAll() {

		var approveRadios = document
				.querySelectorAll('input[type="radio"][value="approve"]');

		approveRadios.forEach(function(radio) {
			radio.checked = true;
		});
	}

	function rejectAll() {

		var approveRadios = document
				.querySelectorAll('input[type="radio"][value="reject"]');

		approveRadios.forEach(function(radio) {
			radio.checked = true;
		});
	}
	
	 // Function to reset all radio buttons in the table
    function resetAll() {
        var approveRadios = document.querySelectorAll('input[type="radio"][name^="approval_"]');
        approveRadios.forEach(function(radio) {
            radio.checked = false;
        });
    }
	 
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
	document
			.getElementById('submitBtn')
			.addEventListener(
					'click',
					function(event) {
						event.preventDefault(); // Prevent default form submission

						var rows = document
								.querySelectorAll('#expenseTable tbody tr');

						var formData = new FormData();

						rows
								.forEach(function(row) {
									var approveRadioButton = row
											.querySelector('input[type="radio"][value="approve"]');
									var rejectRadioButton = row
											.querySelector('input[type="radio"][value="reject"]');

									if (approveRadioButton.checked
											|| rejectRadioButton.checked) {
										var inputs = row
												.querySelectorAll('input[type="hidden"], input[type="radio"], textarea');
										inputs.forEach(function(input) {
											formData.append(input.name,
													input.value);
										});
									}
								});

						// Submit the form data
						var xhr = new XMLHttpRequest();
						xhr.open('POST', 'ApprovalServlet', true);
						xhr.onreadystatechange = function() {
							if (xhr.readyState === 4) {
								if (xhr.status === 200) {
									// Handle successful response
									console
											.log('Form data submitted successfully');
									alert('Form Updated Successfully!');
								} else {
									// Handle error
									console.error('Error submitting form data');
									alert('Error occurred while updating form!');
								}
							}
						};
						xhr.send(formData);
					});

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
			<a href="createform.jsp">Create Form</a> 
			<a href="MyForms.jsp">My Forms</a> 
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
		<div class="dtag">
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
			<div class="abtn">
				<button id="approveAllBtn" onclick="approveAll()">Approve
					All</button>
				<button id="rejectAllBtn" onclick="rejectAll()">Reject
					All</button>
				<button id="resetAllBtn" onclick="resetAll()">Reset
					All</button>
			</div>
		</div>
		<form action="ApprovalServlet" method="post">
			<div style="overflow-x: auto;">
				<table id="expenseTable">
					<thead id="tableHead">
						<tr>

							<th>Name</th>
							<th>Date of travel</th>
							<th>Claimed Date</th>
							<th>Re-Claimed Date</th>
							<th>Particulars</th>
							<th>Mode</th>
							<th>Distance in KMs</th>
							<th>Amount</th>
							<th>View Bill</th>
							<th>Action*</th>
							<th>Remarks</th>

						</tr>
					</thead>
					<tbody id="tableBody">
						<%
						String fullName = (String) session.getAttribute("fullname");
						List<String> employeeCodes = new ArrayList<>();
						String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";
						JSONParser parser = new JSONParser();
						try (FileReader reader = new FileReader(filePath)) {
							JSONObject formData = (JSONObject) parser.parse(reader);
							JSONObject usersData = (JSONObject) parser
							.parse(new FileReader("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json"));
							for (Iterator iterator = usersData.keySet().iterator(); iterator.hasNext();) {
								String key = (String) iterator.next();
								JSONObject userData = (JSONObject) usersData.get(key);
								if (fullName.equals(userData.get("Reporting Manager"))) {
							employeeCodes.add(key);
								}
							}
							int rowCount = 0; // Counter for generating unique names
							for (String employeeCode : employeeCodes) {
								if (formData.containsKey(employeeCode)) {
							JSONObject employeeData = (JSONObject) formData.get(employeeCode);
							for (Iterator iterator = employeeData.keySet().iterator(); iterator.hasNext();) {
								String formId = (String) iterator.next();
								JSONObject form = (JSONObject) employeeData.get(formId);
								String status = (String) form.get("Status");
								if ("Submitted".equals(status)) {
									String uniqueNamePrefix = "approval_" + rowCount++; // Generate unique name prefix
						%>
						<tr>
							<td><%=form.get("FullName")%> <%
 String fullName1 = (String) form.get("FullName");
 String usersFilePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json";
 JSONParser parsers = new JSONParser();
 try (FileReader reader1 = new FileReader(usersFilePath)) {
 	JSONObject usersData1 = (JSONObject) parsers.parse(reader1);
 	String employeeCode1 = null;
 	for (Object keyObj : usersData1.keySet()) {
 		String key1 = (String) keyObj;
 		JSONObject userData = (JSONObject) usersData1.get(key1);
 		String fullNameFromJson = (String) userData.get("Full Name");
 		if (fullName1.equals(fullNameFromJson)) {
 	employeeCode = key1;
 	break;
 		}
 	}

 } catch (Exception e) {
 	e.printStackTrace();
 }
 %> <input type="hidden" name="eCode_<%=uniqueNamePrefix%>"
								value="<%=employeeCode%>"> <input type="hidden"
								name="formId_<%=uniqueNamePrefix%>" value="<%=formId%>"></td>
							<td><%=form.get("Date of travel")%></td>
							<td><%=form.get("Claimed Date")%></td>
							<td><%=form.get("Re-Claimed Date")%></td>
							<td><%=form.get("Particulars")%></td>
							<td><%=form.get("Mode")%></td>
							<td><%=form.get("Distance In Kms")%></td>
							<td style="text-align: right;"><%=form.get("Amount")%></td>
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
										<input type="radio" id="approve_<%=uniqueNamePrefix%>"
											name="approval_<%=uniqueNamePrefix%>" value="approve">
									</div>
									<label for="approve_<%=uniqueNamePrefix%>">Approve</label>
								</div>
								<div class="dg">
									<div class="d3">
										<input type="radio" id="reject_<%=uniqueNamePrefix%>"
											name="approval_<%=uniqueNamePrefix%>" value="reject">
									</div>
									<div class="d4">
										<label for="reject_<%=uniqueNamePrefix%>">Reject</label>
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

	<%
	String updateSuccess = (String) request.getAttribute("updateSuccess");
	if (updateSuccess != null) {
		if (updateSuccess.equals("true")) {
	%>
	<script>
		alert('Form Updated Successfully!');
	</script>
	<%
	} else if (updateSuccess.equals("false")) {
	%>
	<script>
		alert('Error occurred while updating form!');
	</script>
	<%
	}
	}
	%>
</body>
</html>
