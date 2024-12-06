<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="java.util.Collections"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.text.SimpleDateFormat"%>
<%@ page import="java.util.Comparator"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/style2.css">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<title>My Forms</title>
<style>
.modal {
	display: none;
	position: fixed;
	z-index: 10000;
	left: 0;
	top: 0;
	width: 100%;
	height: 100%;
	overflow: auto;
	background-color: rgba(0, 0, 0, 0.7);
	justify-content: center;
	align-items: center;
}

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

.modal-content img {
	width: 100%;
	height: auto;
}

#fromDate {
	width: 45%
}

#toDate {
	width: 45%
}

#statusFilter {
	width: 40%;
}

#dd {
	display: flex;
}

#filterFields {
	display: flex;
}

/* Ensure proper positioning */
.info-icon {
	position: relative;
	cursor: pointer;
}

.tooltip {
	position: absolute;
	top: 100%; /* Position below the info icon */
	left: -180px; /* Align with the left edge of the icon */
	display: none;
	background-color: #f9f9f9;
	color: #000;
	border: 1px solid #ccc;
	padding: 10px;
	z-index: 1;
	width: 550px;
	background-color: yellow;
	text-align: left;
	margin-right: 30px;
}

.tooltip p {
	margin: 5px 0;
}

/* Show tooltip on hover */
.info-icon:hover .tooltip {
	display: block;
}

.hidden {
	display: none;
}

th:nth-child(9), td:nth-child(9) {
	text-align: right;
}

@media only screen and (max-width : 700px) {
	main {
		padding-top: 10px;
	}
	#fromDate {
		width: 30%;
	}
	#toDate {
		width: 30%;
	}
	#statusFilter {
		width: 30%;
	}
	#dd {
		display: block;
	}
	#same3 {
		padding: 1px;
	}
	#same2 {
		padding: 1px;
	}
	#same1 {
		padding: 1px;
	}
	#filterFields {
		display: block;
		width: 360px;
		padding-left: 3px;
	}
	#filterFields label {
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
	function closeModal() {
		var modal = document.getElementById("myModal");
		modal.style.display = "none";
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
	window.onload = function() {
		// Get all info icons and add event listeners
		var infoIcons = document.querySelectorAll('.info-icon');
		infoIcons.forEach(function(icon) {
			icon.addEventListener('mouseenter', function() {
				// Show tooltip on mouse enter
				this.nextElementSibling.style.display = 'block';
			});

			icon.addEventListener('mouseleave', function() {
				// Hide tooltip on mouse leave
				this.nextElementSibling.style.display = 'none';
			});
		});
	};
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
			<a href="#" class="active">My Forms</a>
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
			<div class="active">
				<a href="#">My Forms</a>
			</div>
			<%
			// Set UserType attribute in session if it's not already set
			String userType1 = (String) session.getAttribute("userType");
			if (userType1 == null) {
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
		</div>
	</header>
	<main>
		<div id="filterFields">
			<div id="dd">
				<div id="same3">
					<label>From Date of Travel:</label> <input type="date"
						id="fromDate" onchange="updateToDateMin()">
				</div>
				<div id="same2">
					<label>To Date of Travel:</label> <input type="date" id="toDate">
				</div>
				<div id="same1">
					<label>Filter by Status:</label> <select id="statusFilter">
						<option value="All">All</option>
						<option value="Saved">Saved</option>
						<option value="Submitted">Submitted</option>
						<option value="Approved">Approved</option>
						<option value="Rejected">Rejected</option>
						<option value="Settled">Settled</option>
						<option value="Modify">Modify</option>
					</select>
				</div>
			</div>
			<div id="buttons">
				<button onclick="submitFilter()">Go</button>
				<button onclick="resetFilter()">Reset</button>
			</div>
		</div>
		<div id="statusTooltip" class="hidden"></div>
		<div class="tcontainer">
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
						<th>Status <span class="info-icon"><i
								class="fas fa-info-circle"></i></span>
							<div class="tooltip">
								<p>Saved: Saved for further modification, which is not
									submitted yet</p>
								<p>Submitted: Form submitted to Approving authority</p>
								<p>Approved: Approved by Reporting Manager</p>
								<p>Rejected: Rejected by Reporting Manager</p>
								<p>Modify: Form sent for modification by Finance Department</p>
								<p>Settled: Payment Settled</p>
							</div>
						</th>
						<th>Approved Amount</th>
						<th>Approving authority remarks</th>
						<th>Finance department remarks</th>
						<th>Edit</th>
					</tr>
				</thead>
				<tbody id="tableBody">
					<%
					String employeeCode = (String) session.getAttribute("employeecode");

					String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";
					JSONObject formData = null;
					JSONParser parser = new JSONParser();
					try (FileReader reader = new FileReader(filePath)) {
						formData = (JSONObject) parser.parse(reader);
					} catch (Exception e) {
						e.printStackTrace();
					}
					%>


					<%
					// Define a custom comparator to compare dates
					Comparator<JSONObject> dateComparator = new Comparator<JSONObject>() {
						SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm");

						@Override
						public int compare(JSONObject formDataObj1, JSONObject formDataObj2) {
							try {
						Date reclaimDate1 = getEffectiveDate(formDataObj1);
						Date reclaimDate2 = getEffectiveDate(formDataObj2);

						// Compare effective reclaim dates
						return reclaimDate2.compareTo(reclaimDate1);
							} catch (Exception e) {
						// Handle parsing errors or null pointer exceptions
						e.printStackTrace();
						return 0; // Or any other suitable value
							}
						}

						private Date getEffectiveDate(JSONObject formDataObj) throws Exception {
							String reclaimDateString = (String) formDataObj.get("Re-Claimed Date");
							String claimedDateString = (String) formDataObj.get("Claimed Date");

							// If Re-Claimed Date is null, use Claimed Date instead
							if (reclaimDateString == null || reclaimDateString.isEmpty()) {
						reclaimDateString = claimedDateString;
							}

							// Parse effective reclaim date
							Date effectiveReclaimDate = dateFormat.parse(reclaimDateString);

							return effectiveReclaimDate;
						}
					};

					// Sort the form data based on reclaim dates and claim dates
					if (formData != null && formData.containsKey(employeeCode)) {
						JSONObject employeeData = (JSONObject) formData.get(employeeCode);
						List<String> formIdList = new ArrayList<>(employeeData.keySet());

						// Sort formIdList based on reclaim dates or claim dates using the custom comparator
						Collections.sort(formIdList, (formId1, formId2) -> dateComparator.compare((JSONObject) employeeData.get(formId1),
						(JSONObject) employeeData.get(formId2)));

						// Iterate through the sorted form data
						for (String formId : formIdList) {
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
						<%
						String distance = (String) formDataObj.get("Distance In Kms");
						if (distance != null && !distance.isEmpty()) {
						%>
						<td><%=distance%></td>
						<%
						} else {
						%>
						<td>-</td>
						<%
						}
						%>
						<td><%=formDataObj.get("Amount")%></td>
						<td>
							<%
							String document = (String) formDataObj.get("Upload Document");
							if (document != null && !document.isEmpty()) {
							%> <a href="#" onclick="displayImage('<%=document%>')">View
								document</a> <%
 } else {
 %> - <%
 }
 %>
						</td>
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
							if ("Saved".equals(status) || "Submitted".equals(status)) {
							%>
							<div class="ebtn">
								<a
									href="editForm2.jsp?status=Edit&formId=<%=formDataObj.get("FormId")%>&date=<%=formDataObj.get("Date of travel")%>&particulars=<%=formDataObj.get("Particulars")%>&mode=<%=formDataObj.get("Mode")%>&distance=<%=formDataObj.get("Distance In Kms")%>&amount=<%=formDataObj.get("Amount")%>"><button>
										<i class="fa-solid fa-file-pen"></i>
									</button></a>
							</div> <%
 } else if ("Rejected".equals(status) || "Modify".equals(status)) {
 %>
							<div class="ebtn">
								<a
									href="editForm.jsp?status=Edit&formId=<%=formDataObj.get("FormId")%>&date=<%=formDataObj.get("Date of travel")%>&particulars=<%=formDataObj.get("Particulars")%>&mode=<%=formDataObj.get("Mode")%>&distance=<%=formDataObj.get("Distance In Kms")%>&amount=<%=formDataObj.get("Amount")%>"><button>
										<i class="fa-solid fa-file-pen"></i>
									</button></a>
							</div> <%
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
		</div>
	</main>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span> <img
				id="modalImage" src="" alt="Image">
		</div>
	</div>
	<script>
		function submitFilter() {
			var fromDate = document.getElementById("fromDate").value;
			var toDate = document.getElementById("toDate").value;
			var statusFilter = document.getElementById("statusFilter").value;

			var tableRows = document.getElementById("expenseTable")
					.getElementsByTagName("tr");
			for (var i = 1; i < tableRows.length; i++) {
				var row = tableRows[i];
				var dateOfTravel = row.cells[0].innerHTML;

				var parts = dateOfTravel.split("-");
				var day = parseInt(parts[0]);
				var month = parseInt(parts[1]) - 1;
				var year = parseInt(parts[2]);

				var date = new Date(year, month, day);

				var dateInRange = (fromDate === "" || toDate === "" || (date >= new Date(
						fromDate) && date <= new Date(toDate)));
				var statusMatches = (statusFilter === "All" || row.cells[10].innerHTML === statusFilter); // Assuming Status is the eleventh cell

				if (dateInRange && statusMatches) {
					row.style.display = "";
				} else {
					row.style.display = "none";
				}
			}
		}
		function resetFilter() {
			document.getElementById("fromDate").value = "";
			document.getElementById("toDate").value = "";
			document.getElementById("statusFilter").value = "All";

			var tableRows = document.getElementById("expenseTable")
					.getElementsByTagName("tr");
			for (var i = 0; i < tableRows.length; i++) {
				tableRows[i].style.display = "";
			}
		}
		function showContainer() {
			document.getElementById("statusTooltip").style.display = "block";
		}
		function hideContainer() {
			document.getElementById("statusTooltip").style.display = "none";
		}
		function updateToDateMin() {
			var fromDateInput = document.getElementById("fromDate");
			var toDateInput = document.getElementById("toDate");

			var fromDateValue = fromDateInput.value;

			toDateInput.min = fromDateValue;
		}

		updateToDateMin();

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
	</script>
</body>
</html>