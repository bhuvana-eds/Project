<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.BufferedReader, java.io.FileReader, java.io.IOException" %>
    <%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%! 
    // Function to get the vehicle count from the JSON file
    String getVehicleCount(String vehicleType) {
        try {
            // Provide the correct path to your JSON file
            String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\cost.json";

            // Read JSON file
            BufferedReader reader = new BufferedReader(new FileReader(filePath));
            String jsonContent = reader.readLine();
            reader.close();

            // Parse JSON content using JSONParser
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(jsonContent);

            // Get vehicle count based on the provided vehicle type
            Long count = (Long) jsonObject.get(vehicleType);

            return (count != null) ? count.toString() : "";
        } catch (Exception e) {
            e.printStackTrace();
            return "";
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet" href="CSS/style2.css">
    <title>cost</title>
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
    <a href="EmployeeList.jsp">Users List</a>
    <a href="#">Cost</a>
    <a href="index.jsp">Logout</a>
   </nav>
   </header>
   
<main class="costbody">
        <div class="login-container">
        <h2>Cost per KM</h2>
            <form action="UpdateCostServlet" method="post">
                <label for="2-Wheeler">2-Wheeler</label>
                <input type="number" name="2w" value="<%= getVehicleCount("2-wheeler") %>" required><br>

                <label for="4-Wheeler">4-Wheeler</label>
                <input type="number" name="4w" value="<%= getVehicleCount("4-wheeler") %>" required>

                <div class="cost">
                    <button type="submit">Submit</button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>