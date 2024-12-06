<%@ page import="java.util.Map"%>
<%@ page import="java.util.Set"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="org.json.simple.JSONObject"%>
<%@ page import="org.json.simple.parser.JSONParser"%>
<%@ page import="java.io.FileReader"%>
<%@ page import="java.io.IOException"%>
<%@ page import="java.util.Iterator"%>
<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>
<%@ page import="java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/style3.css">
<title>Edit Form</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
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
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script id="formdata" type="application/json">
        <%!String readFile(String filePath) {
		StringBuilder contentBuilder = new StringBuilder();
		try {
			InputStream is = new FileInputStream(filePath);
			BufferedReader br = new BufferedReader(new InputStreamReader(is, "UTF-8"));
			String line;
			while ((line = br.readLine()) != null) {
				contentBuilder.append(line).append("\n");
			}
			br.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return contentBuilder.toString();
	}%>
        <%=readFile("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json")%>
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
		</div>
	</header>
	<main>
		<button id="close">Close</button>
		<form action="FormDataUpdateServlet2" id="expenseForm" method="POST"
			enctype="multipart/form-data">
			<table id="expenseTable">
				<thead>
					<tr>
						<th>Date of travel*</th>
						<th>Particulars*</th>
						<th>Mode*</th>
						<th>Distance in KMs</th>
						<th>Amount</th>
						<th>View Bill</th>
						<th>Upload document</th>

					</tr>
				</thead>
				<tbody id="tableBody">
					<tr>
						<%
						String dateParameter = request.getParameter("date");
						LocalDate date = LocalDate.parse(dateParameter, DateTimeFormatter.ofPattern("dd-MM-yyyy"));
						String formattedDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
						%>
						<td><input type="date" name="date1" required
							value="<%=formattedDate%>"><input type="hidden"
							name="formId1" value="<%=request.getParameter("formId")%>">
						</td>

						<td><textarea name="particulars1" rows="2"
								class="formControl" required><%=request.getParameter("particulars")%></textarea><input
							name="status" id="status" type="hidden"
							value="<%=request.getParameter("status")%>"></td>
						<td><select name="mode1"
							onchange="handleModeChange(this, this.parentNode.parentNode)"
							required>
								<option value="" disabled>Select Mode</option>
								<option value="2-Wheeler"
									<%if ("2-wheeler".equals(request.getParameter("mode"))) {%>
									selected="selected" <%}%>>2-Wheeler</option>
								<option value="4-Wheeler"
									<%if ("4-Wheeler".equals(request.getParameter("mode"))) {%>
									selected="selected" <%}%>>4-Wheeler</option>
								<option value="Others"
									<%if ("Others".equals(request.getParameter("mode"))) {%>
									selected="selected" <%}%>>Others</option>
						</select></td>
						<td><input type="number" style="text-align: right;"
							name="distance1" pattern="\d+" class="distance-input"
							onchange="calculateAmount(this, this.parentNode.parentNode)"
							value="<%=request.getParameter("distance")%>"></td>
						<td><input type="text" style="text-align: right;"
							name="amount1" readonly class="amount-input"
							value="<%=request.getParameter("amount")%>"></td>
						<td>
							<%
							try {
								FileReader reader = new FileReader("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json");
								JSONParser jsonParser = new JSONParser();
								JSONObject jsonObject = (JSONObject) jsonParser.parse(reader);
								String employeeCode = (String) session.getAttribute("employeecode");
								String formId = request.getParameter("formId");
								JSONObject employeeData = (JSONObject) jsonObject.get(employeeCode);
								JSONObject formDetails = (JSONObject) employeeData.get(formId);
								String uploadDocument = (String) formDetails.get("Upload Document");
								if (uploadDocument != null && !uploadDocument.trim().isEmpty()) {
							%> <a href="#" onclick="displayImage('<%=uploadDocument%>')">View
								document</a> <%
 } else {
 %> - <%
 }
 } catch (Exception e) {
 e.printStackTrace();
 }
 %>
						</td>
						<td><input type="file" name="upload1"
							accept=".jpg, .jpeg, .png, .gif" class="upload-input"></td>
					</tr>
				</tbody>
			</table>
			<div class="btns">
				<div class="twobtn">
					<button id="submitBtn" type="button" onclick="submitForm()">Submit</button>
				</div>
			</div>
		</form>
		<script>
        function handleModeChange(selectElement, currentRow) {
            var distanceInput = currentRow.querySelector('.distance-input');
            var amountInput = currentRow.querySelector('.amount-input');
            var uploadInput = currentRow.querySelector('.upload-input');

            
            distanceInput.value = '';
            amountInput.value = '';
           

            if (selectElement.value === 'Others') {
                distanceInput.disabled = true;
                amountInput.readOnly = false;
                amountInput.style.pointerEvents = 'auto';
                amountInput.style.opacity = '1';
                amountInput.style.backgroundColor = '';
                uploadInput.required = true;
            } else {
                distanceInput.disabled = false;
                distanceInput.style.pointerEvents = 'auto';
                distanceInput.style.opacity = '1';
                distanceInput.required = true;
                amountInput.readOnly = true;
                amountInput.style.pointerEvents = 'auto'; 
                amountInput.style.opacity = '1';
                amountInput.style.backgroundColor = 'lightgrey';
                distanceInput.addEventListener('input', function () {
                    calculateAmount(distanceInput, amountInput, selectElement.value);
                });
                
            }
        }
        
        function calculateAmount(distanceInput, amountInput, mode) {
            const distanceValue = parseFloat(distanceInput.value);

            if (!isNaN(distanceValue)) {
                fetch('cost.json?' + new Date().getTime()) // Append timestamp to URL
                    .then(response => response.json())
                    .then(data => {
                        const modeKey = mode.toLowerCase();
                        const costPerKm = data[modeKey];

                        if (costPerKm !== undefined && !isNaN(costPerKm)) {
                            amountInput.value = distanceValue * costPerKm;
                        } else {
                            amountInput.value = '';
                        }
                    })
                    .catch(error => {
                        console.error('Error fetching data from cost.json:', error);
                    });
            } else {
                amountInput.value = '';
            }
        }

        function submitForm() {
            document.getElementById('status').value = 'Submitted';
            alert('Submitted Successfully!');
            document.getElementById('expenseForm').submit();
        }
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
        document.getElementById("close").onclick = function() { 
            window.location.href = "MyForms.jsp";
        };
        
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
	</main>
	<div id="myModal" class="modal">
		<div class="modal-content">
			<span class="close" onclick="closeModal()">&times;</span> <img
				id="modalImage" src="" alt="Image">
		</div>
	</div>
</body>
</html>
