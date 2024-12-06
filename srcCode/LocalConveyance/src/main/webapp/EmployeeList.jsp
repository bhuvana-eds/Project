
<%@ page import="java.util.Map" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.PrintWriter, java.nio.file.Files, java.nio.file.Path, java.nio.file.Paths, java.nio.file.Files, java.nio.file.Path, java.nio.file.Paths" %>
<%@ page import="java.io.FileReader" %>
<%@ page import="java.io.IOException" %>
<%@ page import="java.io.FileNotFoundException" %>
<%@ page import="java.io.BufferedReader" %>
<%@ page import="org.json.simple.parser.ParseException" %>

<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<title>Employee List</title>
    <link rel="stylesheet" href="CSS/style3.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" />
</head>
<body>
	<header>
        <div class="landn">
    <div class="image">
        <img src="assets/logo.png" alt="logo">
    </div>
    <div class="name">
        <h2>Local Travel Expenditure Claim</h2> 
    </div>
    </div>
    <nav>
    <a href="#" class="active">Users List</a>
    <a href="AcostDisplay.jsp">Cost</a>
    <a href="index.jsp">Logout</a>
   </nav>
    </header>
    
   <main>
        <form action="EmployeeListUpdate.jsp" method="post">
        <table id="expenseTable">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Designation</th>
                    <th>Email</th>
                    <th>Region</th>
                    <th>Reporting Manager</th>
                    <th>Employee Code</th>
                    <th>User Type</th>
                </tr>
            </thead>
            <tbody>
                <%
                    // Read JSON file and parse data
                    String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json";
                    JSONParser parser = new JSONParser();
                    JSONObject users = null;

                    try {
                        users = (JSONObject) parser.parse(new FileReader(filePath));
                    } catch (ParseException e) {
                        e.printStackTrace();
                    }	
                    // Loop through the user data and display in table rows
                    for (Object userId : users.keySet()) {
                        JSONObject userData = (JSONObject) users.get(userId);
                %>
                <tr>
                    <td><%= userData.get("Full Name") %></td>
                    <td><%= userData.get("Designation") %></td>
                    <td><%= userData.get("Email") %></td>
                    <td><%= userData.get("Region") %></td>
                    <td><%= userData.get("Reporting Manager") %></td>
                    <td><%= userId %></td>
                    <td><%= userData.get("UserType") %></td>
                </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
        <div class="sbtn">
        <button id="submitBtn">Update</button>
    	</div>
    	</form>
    </main>
    
        
</body>
</html>









    
