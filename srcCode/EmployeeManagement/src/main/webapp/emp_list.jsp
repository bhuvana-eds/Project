<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" dir="ltr">
<head>
    <meta charset="UTF-8">
    <title>Employee Management System - Employee Portal</title>
    <link rel="stylesheet" href="style.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="index.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style>
    	::placeholder{
    		color:black;
			font-size: large;
			font-weight: 500;
			font-style: italic;
    	}
    </style>
</head>
</head>
<header class="index-main-section">
    <nav>
		<ul class="e_ul" onclick="activetab()">
            <img id="img-section" src="images\Logo.jpg" alt="EDS Technologies">
			<li class="nav-item" id="home">
			<a href="admportal_values.jsp#personal">Personal Details</a>
			</li>
			<li class="nav-item" id="about">
			<a href="admportal_values.jsp#qualification">Qualification</a>
			</li>
			<li class="nav-item" id="services">
			<a href="admportal_values.jsp#work">Work Experience</a>
			</li>
			<li class="nav-item" id="contact">
			<a href="admportal_values.jsp#documents">Documents Upload</a>
			</li>
            <li>
                <button id="btn-link" onclick="myFunction()" class="portal-dropbtn"> Madhurya </button>
                <div id="myDropdown" class="portal-dropdown-content" style="width: 150px; right: 35px; text-orientation: inherit;">
                    <a href="adm_registration.jsp">Registration</a>
                    <a href="#">Employee Details</a>
                    <a href="adm_pwdchange.jsp">Change Password</a>
                    <a href="home.jsp">Logout</a>
                </div>
            </li>
		</ul>
	</nav>

<script> 

		$(document).ready(function () {
            $("#entireSearch").on("keyup", function () {
                let entireValue = $("#entireSearch").val().toLowerCase();
            
                $(".emp-body tr").each(function () {
                    let rowText = $(this).text().toLowerCase();
                    // Show all rows if entire search is empty
                    let matchEntire = entireValue === ""; 

                    if (entireValue !== "") {
                        matchEntire = rowText.indexOf(entireValue) > -1;
                    }
                    // Assuming all rows initially match column search
                    let matchColumn = true; 

                    $(this).toggle(matchEntire && matchColumn);
                });
            });
        });
</script> 
</header>
    

<body class="empportal-body">
    <input id="entireSearch" type="text" placeholder="Search">
    <button id="search-btn"><svg id="elist" viewBox="0 0 1024 1024">
        <path class="path1" d="M848.471 928l-263.059-263.059c-48.941 36.706-110.118 55.059-177.412 55.059-171.294 
        0-312-140.706-312-312s140.706-312 312-312c171.294 0 312 140.706 312 312 0 67.294-24.471 128.471-55.059 
        177.412l263.059 263.059-79.529 79.529zM189.623 408.078c0 121.364 97.091 218.455 218.455 218.455s218.455-97.091 
        218.455-218.455c0-121.364-103.159-218.455-218.455-218.455-121.364 0-218.455 97.091-218.455 218.455z">
    </path></svg></button>
    <div class="emp-list">
		<table class="emp-table" id="emptable">
			<thead class="emp-head">
			<tr class="emp-row">
				<th class="e-th" width="3%">Sl No</th>
				<th class="e-th" width="7%">Employee ID</th>
				<th class="e-th" width="9%">Name</th>
				<th class="e-th" width="9%">Designation</th>
				<th class="e-th" width="9%">Department</th>
				<th class="e-th" width="12%">Mail ID</th>
				<th class="e-th" width="10%">Mobile Number</th>
			</tr>
		</thead>
		<tbody class="emp-body">
			<tr class="emp-row">
				<td class="e-td">1</td>
				<td class="e-td"><a class="emp-a" href="admportal_values.jsp"> 911488</a></td>
				<td class="e-td">Madhurya B</td>
				<td class="e-td">Administrative Assistant</td>
				<td class="e-td">Admin</td>
				<td class="e-td">madhuryabhargavan02@gmail.com</td>
				<td class="e-td">9036432140</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">2</td>
				<td class="e-td"><a class="emp-a" href="adm_rahul_details.jsp">123456</a></td>
				<td class="e-td">Rahul J P</td>
				<td class="e-td">Application Engineer</td>
				<td class="e-td">Engineering Solutions</td>
				<td class="e-td">rahuljp@gmail.com</td>
				<td class="e-td">8745236985</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">3</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp">789123</a></td>
				<td class="e-td">Pranitha P</td>
				<td class="e-td">Intern</td>
				<td class="e-td">Consulting</td>
				<td class="e-td">pranithap@gmail.com</td>
				<td class="e-td">9658963214</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">4</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp"> 456789</a></td>
				<td class="e-td">Jyothi P</td>
				<td class="e-td">Intern</td>
				<td class="e-td">Marketing</td>
				<td class="e-td">jyoti12@gmail.com</td>
				<td class="e-td">7452369852</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">5</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp">135791</a></td>
				<td class="e-td">Shubham M</td>
				<td class="e-td">Graduate Engineer Trainee</td>
				<td class="e-td">Consulting</td>
				<td class="e-td">shubham24@gmail.com</td>
				<td class="e-td">8965236541</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">6</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp">246802</a></td>
				<td class="e-td">Priyanka S</td>
				<td class="e-td">Graduate Engineer Trainee</td>
				<td class="e-td">Marketing</td>
				<td class="e-td">priyanka@gmail.com</td>
				<td class="e-td">9745236852</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">7</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp"> 125689</a></td>
				<td class="e-td">Vikas Kumar</td>
				<td class="e-td">Intern</td>
				<td class="e-td">Marketing</td>
				<td class="e-td">vikaskumar@gmail.com</td>
				<td class="e-td">7412563985</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">8</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp">236791</a></td>
				<td class="e-td">Raksha D</td>
				<td class="e-td">Application Engineer</td>
				<td class="e-td">Engineering Solutions</td>
				<td class="e-td">raksha240212@gmail.com</td>
				<td class="e-td">9658741236</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">9</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp">193782</a></td>
				<td class="e-td">Vishwas R</td>
				<td class="e-td">Graduate Engineer Trainee</td>
				<td class="e-td">Consulting</td>
				<td class="e-td">vishwasgowda@gmail.com</td>
				<td class="e-td">8457965896</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">10</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp"> 648264</a></td>
				<td class="e-td">Darshan R</td>
				<td class="e-td">IT Executive</td>
				<td class="e-td">IT & Systems</td>
				<td class="e-td">darshangowda@gmail.com</td>
				<td class="e-td">7423651233</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">11</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp">571369</a></td>
				<td class="e-td">Smitha M</td>
				<td class="e-td">Application Engineer</td>
				<td class="e-td">Engineering Solutions</td>
				<td class="e-td">smitha11052000@gmail.com</td>
				<td class="e-td">9523641236</td>
			</tr>
			<tr class="emp-row">
				<td class="e-td">12</td>
				<td class="e-td"><a class="emp-a" href="adm_emp_details.jsp">684795</a></td>
				<td class="e-td">Mayuresh D</td>
				<td class="e-td">IT Executive</td>
				<td class="e-td">IT & Systems</td>
				<td class="e-td">mayuresh11@gmail.com</td>
				<td class="e-td">8414521326</td>
			</tr>
		</tbody>
		</table>


		<!-- <script>
			 var employeeJson = [
				{
					"empid": 911488,
					"name": "Madhurya B",
					"designation": "Administrative Assistant",
					"department": "Admin",
					"mail": "madhuryabhargavan02@gmail.com",
					"phone": 9036023590
				},
				{
					"empid": 123456,
					"name": "Rahul J P",
					"designation": "Application Engineer",
					"department": "Engineering Solutions",
					"mail": "rahuljp@gmail.com",
					"phone": 8745236985
				},
				{
					"empid": 789123,
					"name": "Pranitha P",
					"designation": "Intern",
					"department": "Consulting",
					"mail": "pranithap@gmail.com",
					"phone": 9658963214
				}
			]; 
  
				function createTableFromJsonData(){
				//Get the headers from JSON data
				var headers = Object.keys(employeeJson[0]);
				
				//Prepare html header
				var headerRowHTML='<tr>';
				for(var i=0;i<headers.length;i++){
					headerRowHTML+='<th>'+headers[i]+'</th>';
				}
				headerRowHTML+='</tr>';       
				
				//Prepare all the employee records as HTML
				var allRecordsHTML='';
				for(var i=0;i<employeeJson.length;i++){
				
					//Prepare html row
					allRecordsHTML+='<tr>';
					for(var j=0;j<headers.length;j++){
						var header=headers[j];
						allRecordsHTML+='<td>'+employeeJson[i][header]+'</td>';
					}
					allRecordsHTML+='</tr>';
					
				}
				
				//Append the table header and all records
				var table=document.getElementById("emptable");
				table.innerHTML=headerRowHTML + allRecordsHTML;
			}

			window.onload = createTableFromJsonData();
		</script> -->
	</div>
</body>
<br><br><br><br><br>
<footer class="index-footer">
    &copy;2024 EDS Technologies Pvt. Ltd.
</footer>
</html>