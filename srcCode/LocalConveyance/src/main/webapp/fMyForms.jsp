<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.Iterator"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/style3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<title>My Forms</title>
<style>
/* Styles for the modal */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgba(0, 0, 0, 0.7); /* Black w/ opacity */
	justify-content: center; /* Center horizontally */
	align-items: center; /* Center vertically */
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
			<a href="fcreateform.jsp">Create Form</a> <a href=# class="active">My
				Forms</a> <a href="FinanceApproval.jsp">Approve Forms</a>
		</nav>
	</header>

	<main>

		<table id="expenseTable">
			<thead>
				<tr>
					<th>Date of travel</th>
					<th>Claimed Date</th>
					<th>Re-Claimed Date</th>
					<th>Approved Date</th>
					<th>Credited Date</th>
					<th>Particulars</th>
					<th>Mode</th>
					<th>Distance in KMs</th>
					<th>Claimed Amount</th>
					<th>View document</th>
					<th>Status</th>
					<th>Approved Amount</th>
					<th>Approving authority remarks</th>
					<th>Finance department remarks</th>
					<th>Edit</th>
				</tr>
			</thead>
			<tbody>
				<%
				// Retrieve session attribute
				String employeeCode = (String) session.getAttribute("employeecode");

				// Read form data from JSON file
				String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";
				JSONObject formData = null;
				JSONParser parser = new JSONParser();
				try (FileReader reader = new FileReader(filePath)) {
					formData = (JSONObject) parser.parse(reader);
				} catch (Exception e) {
					e.printStackTrace();
				}

				// Check if formData is not null and contains employeeCode
				if (formData != null && formData.containsKey(employeeCode)) {
					JSONObject employeeData = (JSONObject) formData.get(employeeCode);
					// Iterate over formId keys
					Set<String> formIds = employeeData.keySet();
					Iterator<String> formIdIterator = formIds.iterator();
					while (formIdIterator.hasNext()) {
						String formId = formIdIterator.next();
						JSONObject formDataObj = (JSONObject) employeeData.get(formId);
						String status = (String) formDataObj.get("Status");
				%>
				<tr>

					<td><%=formDataObj.get("Date of travel")%></td>
					<td><%=formDataObj.get("Claimed Date")%></td>
					<td><%=formDataObj.get("Re-Claimed Date")%></td>
					<td><%=formDataObj.get("Approved Date")%></td>
					<td><%=formDataObj.get("Credited Date")%></td>
					<td><%=formDataObj.get("Particulars")%></td>
					<td><%=formDataObj.get("Mode")%></td>
					<td><%=formDataObj.get("Distance In Kms")%></td>
					<td><%=formDataObj.get("Amount")%></td>
					<td><a href="#"
						onclick="displayImage('<%=formDataObj.get("Upload Document")%>')">View
							document</a></td>
					<td><%=status%></td>
					<%
					Object approvedAmount = formDataObj.get("Approved amount");
					if (approvedAmount != null) {
					%>
					<td><%=approvedAmount%></td>
					<%
					} else {
					%>
					<td></td>
					<%
					}
					%>
					<td><%=formDataObj.get("Approving Authority Remarks")%></td>
					<td><%=formDataObj.get("Finance Department Remarks")%></td>
					<td>
						<%
						if ("Saved".equals(status) || "Rejected".equals(status)) {
						%> <a
						href="editForm.jsp?status=Edit&formId=<%=formId%>&date=<%=formDataObj.get("Date of travel")%>&particulars=<%=formDataObj.get("Particulars")%>&mode=<%=formDataObj.get("Mode")%>&distance=<%=formDataObj.get("Distance In Kms")%>&amount=<%=formDataObj.get("Amount")%>"><button
								class="ebtn">
								<i class="fa-solid fa-file-pen"></i>
							</button></a> <%
 }
 %>
					</td>

				</tr>
				<%
				}
				}
				%>
			</tbody>
		</table>

		<script>
			
		</script>
	</main>
	<div id="myModal" class="modal">
		<!-- Modal content -->
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span> <img
				id="modalImage" src="" alt="Image">
		</div>
	</div>
</body>
</html>
