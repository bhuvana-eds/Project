<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1">
    <link rel="stylesheet" href="CSS/style3.css">
    <title>Create Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
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
                   <a onclick="toggleDropdown()"><i class="fa-solid fa-user extraClass"></i></a>
                </div>
                <div class="dropdown-menu" id="dropdownMenu">
                    <a href="profile.jsp">Profile</a>
                    <a href="changePassword.jsp">Change Password</a>
                    <a href="index.jsp" onclick="logout()">Logout</a>
                </div>
                </div>
            </div>
        </div>
        <nav>
        <a href="#" class="active">Create Form</a>
        <a href="mMyForms.jsp">My Forms</a>
        <a href="ApprovalForm.jsp">Approve Forms</a>
    </nav>
    </header>
    
    <main>
        <form action="FormDataServlet" id="expenseForm" method="POST" enctype="multipart/form-data">
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
                        <td><input type="date" name="date1" required><input type="hidden" id="coUnt" name="coUnt" value="1">
        </td>
        <td><textarea name="particulars1" rows="2" class="formControl" required></textarea><input name="status" id="status" type="hidden"></td>
        <td>
            <select name="mode1"  onchange="handleModeChange(this, this.parentNode.parentNode)" required>
                <option value="" disabled selected>Select Mode</option>
                <option value="2-Wheeler">2-Wheeler</option>
                <option value="4-Wheeler">4-Wheeler</option>
                <option value="Others">Others</option>
            </select>
        </td>
        <td><input type="number" name="distance1" pattern="\d+" class="distance-input" onchange="calculateAmount(this, this.parentNode.parentNode)"></td>
		<td><input type="text" name="amount1" readonly class="amount-input"></td>

        <td><input type="file" name="upload1" accept=".jpg, .jpeg, .png, .gif" class="upload-input"></td>
        
        <td>
            <div class="actionContainer">
                <button class="dbtn" onclick="deleteRow(this)"><i class="fa fa-solid fa-trash"></i></button>
                
            </div>
        </td>
                    </tr>
                </tbody>
            </table>
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

            if (selectElement.value === 'Others') {
                distanceInput.disabled = true;
                amountInput.readOnly = false;
                uploadInput.required = true;
            } else {
                distanceInput.disabled = false;
                distanceInput.required = true;
                distanceInput.addEventListener('input', function() {
                    calculateAmount(distanceInput, amountInput, selectElement.value);
                });
            }
        }

        function calculateAmount(distanceInput, amountInput, mode) {
            const distanceValue = parseFloat(distanceInput.value);
            
            if (!isNaN(distanceValue)) {
                fetch('cost.json')
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

            cloneRow.find('input, textarea').val('');

            const rowCountInput = $('#coUnt');
            rowCountInput.val(parseInt(rowCountInput.val()) + 1);

            cloneRow.find('input[name^="date"]').attr('name', 'date' + rowCountInput.val());
            cloneRow.find('textarea[name^="particulars"]').attr('name', 'particulars' + rowCountInput.val());
            cloneRow.find('select[name^="mode"]').attr('name', 'mode' + rowCountInput.val());
            cloneRow.find('input[name^="distance"]').attr('name', 'distance' + rowCountInput.val());
            cloneRow.find('input[name^="amount"]').attr('name', 'amount' + rowCountInput.val());
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
            document.getElementById('status').value = 'Submitted';
            alert('Submitted Successfully!');
            document.getElementById('expenseForm').submit();
        }
        function toggleDropdown() {
            var dropdownMenu = document.getElementById("dropdownMenu");
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
