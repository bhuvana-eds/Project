<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="CSS/style3.css">
<title>Create Form</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<style type="text/css">
.distance-input {
	pointer-events: none; /* Disable pointer events */
	opacity: 0.4; /* Reduce opacity to indicate disabled state */
}

.amount-input {
	pointer-events: none; /* Disable pointer events */
	opacity: 0.4; /* Reduce opacity to indicate disabled state */
}
</style>
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
			<a href="#" class="active">Create Form</a> <a href="MyForms.jsp">My
				Forms</a>
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
			<div class="active">
				<a href="#">Create Form</a>
			</div>
			<div>
				<a href="MyForms.jsp">My Forms</a>
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
		<form action="FormDataServlet" id="expenseForm" method="POST"
			enctype="multipart/form-data">
			<div style="overflow-x: auto;">
				<table id="expenseTable">
					<thead>
						<tr>
							<th>Date of travel*</th>
							<th>Particulars*</th>
							<th>Mode*</th>
							<th>Distance in KMs</th>
							<th>Amount</th>
							<th>Upload document</th>
							<th>Delete</th>
						</tr>
					</thead>
					<tbody id="tableBody">
						<tr>
							<td><input type="date" name="date1"
								max="<%=java.time.LocalDate.now()%>" required><input
								type="hidden" id="coUnt" name="coUnt" value="1"></td>
							<td><textarea name="particulars1" rows="2"
									class="formControl"></textarea><input name="status" id="status"
								type="hidden"></td>
							<td><select name="mode1"
								onchange="handleModeChange(this, this.parentNode.parentNode)"
								required>
									<option value="" disabled selected>Select Mode</option>
									<option value="2-wheeler">2-Wheeler</option>
									<option value="4-wheeler">4-Wheeler</option>
									<option value="Others">Others</option>
							</select></td>
							<td><input type="number" style="text-align: right;"
								name="distance1" pattern="\d+" max="100" min="1"
								class="distance-input"
								onchange="calculateAmount(this, this.parentNode.parentNode)"></td>
							<td><input type="number" style="text-align: right;"
								name="amount1" readonly class="amount-input"></td>


							<td><input type="file" name="upload1"
								accept=".jpg, .jpeg, .png, .gif" class="upload-input"></td>

							<td>
								<div class="actionContainer">
									<button class="dbtn" onclick="deleteRow(this)">
										<i class="fa fa-solid fa-trash"></i>
									</button>
								</div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="btns">
				<div class="addbtn">
					<button id="addRowBtn" onclick="addRow()">Add Row</button>
				</div>
				<div class="twobtn">
					<button id="saveBtn" type="button" onclick="saveForm()">Save</button>
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

        function addRow() {
            const tableBody = $('#tableBody');
            const lastRow = tableBody.find('tr:last');
            const cloneRow = lastRow.clone();

            
            cloneRow.find('input, textarea, select').removeAttr('required');

            cloneRow.find('input, textarea').val('');

            const rowCountInput = $('#coUnt');
            rowCountInput.val(parseInt(rowCountInput.val()) + 1);

            cloneRow.find('input[name^="date"]').attr('name', 'date' + rowCountInput.val());
            cloneRow.find('textarea[name^="particulars"]').attr('name', 'particulars' + rowCountInput.val());
            cloneRow.find('select[name^="mode"]').attr('name', 'mode' + rowCountInput.val());
            cloneRow.find('input[name^="distance"]').attr('name', 'distance' + rowCountInput.val()).addClass('distance-input');
            cloneRow.find('input[name^="amount"]').attr('name', 'amount' + rowCountInput.val()).addClass('amount-input');
            cloneRow.find('input[name^="upload"]').attr('name', 'upload' + rowCountInput.val());

            cloneRow.find('input[name="coUnt"]').val(rowCountInput.val());

            tableBody.append(cloneRow);

            
            handleModeChange(cloneRow.find('select[name="mode' + rowCountInput.val() + '"]')[0], cloneRow[0]);
        }

        function deleteRow(button) {
            const tableBody = $('#tableBody');
            if (tableBody.children().length > 1) {
                $(button).closest('tr').remove();
            } else {
                alert("Can't remove the last row");
            }
        }
        function cleanLastRow(lastRow) {
            lastRow.find('input').val('');
        }
        function saveForm() {
            document.getElementById('status').value = 'Saved';
            alert("Saved Successfully");
            document.getElementById('expenseForm').submit();
        }
        function submitForm() {
            var rows = document.querySelectorAll('#expenseTable tbody tr');
            var isValid = true;

            rows.forEach(function(row) {
                var dateInput = row.querySelector('input[name^="date"]');
                var particularsInput = row.querySelector('textarea[name^="particulars"]');
                var modeSelect = row.querySelector('select[name^="mode"]');
                var amountInput = row.querySelector('input[name^="amount"]');
                var distanceInput = row.querySelector('input[name^="distance"]');

                if (modeSelect.value === 'Others' && amountInput.value.trim() === '') {
                    isValid = false;
                } else if (modeSelect.value !== 'Others' && distanceInput.value.trim() === '') {
                    isValid = false;
                }

                if (dateInput.value.trim() === '' || particularsInput.value.trim() === '' || modeSelect.value === '') {
                    isValid = false;
                }
            });
            if (isValid) {
                document.getElementById('status').value = 'Submitted';
                alert('Submitted Successfully!');
                document.getElementById('expenseForm').submit();
            } else {
                alert('Please fill out the required fields.');
            }
        }
        function toggleDropdown() {
            var dropdownMenu = document.getElementById("dropdownMenu");
            dropdownMenu.style.display = (dropdownMenu.style.display === "block") ? "none" : "block";
        }
        function toggleDropdownNav() {
            var dropdownMenu = document.getElementById("dropdownMenu-nav");
            dropdownMenu.style.display = (dropdownMenu.style.display === "block") ? "none" : "block";
        }
        document.addEventListener("click", function(event) {
            var dropdownMenu = document.getElementById("dropdownMenu");
            var icon = document.querySelector('.profile-icon');
            if (event.target.closest('.profile-icon') !== icon) {
                if (!dropdownMenu.contains(event.target)) {
                    dropdownMenu.style.display = "none";
                }
            }
        });
        </script>
	</main>
</body>
</html>