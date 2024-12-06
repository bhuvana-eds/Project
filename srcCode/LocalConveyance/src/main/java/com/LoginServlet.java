package com; // Package declaration

import java.io.FileReader; // Importing necessary classes
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.json.simple.JSONObject; // Importing JSON related classes
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/LoginServlet") // Annotation for servlet mapping
public class LoginServlet extends HttpServlet { // Class declaration
    private static final long serialVersionUID = 1L; // Serial version UID

    protected void doPost(HttpServletRequest request, HttpServletResponse response) // Method to handle POST requests
            throws ServletException, IOException { // Exception handling
        String email = request.getParameter("email"); // Retrieving email parameter from request
        String password = request.getParameter("password"); // Retrieving password parameter from request

        // Check user credentials against users.json
        JSONObject userJson = readJsonFile("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json"); // Reading user JSON file
        if (userJson != null) { // Checking if JSON object is not null
            for (Object key : userJson.keySet()) { // Looping through JSON keys
                String employeeCode = (String) key; // Retrieving employee code
                JSONObject user = (JSONObject) userJson.get(employeeCode); // Retrieving user JSON object
                
                if (email.equals(user.get("Email")) && password.equals(user.get("Password"))) { // Checking email and password
                    // Email and password match, set session attributes
                    HttpSession session = request.getSession(); // Retrieving session
                    session.setAttribute("fullname", user.get("Full Name")); // Setting session attribute for full name
                    session.setAttribute("employeecode", employeeCode); // Setting session attribute for employee code
                    session.setAttribute("userType", user.get("UserType"));
                    
                    // Redirecting based on user type
                    if("Approving Authority".equals(user.get("UserType"))) {
                        response.sendRedirect("ApprovalForm.jsp"); // Redirecting to ApprovalForm.jsp
                        return;
                    }
                    else if("User".equals(user.get("UserType"))) {
                        response.sendRedirect("createform.jsp"); // Redirecting to createform.jsp
                        return;
                    }
                    else if("Finance".equals(user.get("UserType"))) {
                        response.sendRedirect("FinanceApproval.jsp"); // Redirecting to FinanceApproval.jsp
                        return;
                    }
                    else if("Admin".equals(user.get("UserType"))) {
                        response.sendRedirect("EmployeeList.jsp"); // Redirecting to EmployeeList.jsp
                        return;
                    }
                }
            }
        }

        // Checking credentials against master.json if not found in users.json
        JSONObject masterJson = readJsonFile("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\master.json"); // Reading master JSON file
        if (masterJson != null) { // Checking if JSON object is not null
            String masterEmail = (String) masterJson.get("Email"); // Retrieving master email
            String masterPassword = (String) masterJson.get("Password"); // Retrieving master password
            
            if (email.equals(masterEmail) && password.equals(masterPassword)) { // Checking email and password
                response.sendRedirect("EmployeeList.jsp"); // Redirecting to EmployeeList.jsp
                return;
            }
        }

        // If credentials are invalid, redirect to index.jsp with error message
        response.getWriter().write("Invalid email or password"); // Writing error message
        response.sendRedirect("index.jsp?error=Invalid%20email%20or%20password"); // Redirecting to index.jsp with error message
    }

    private JSONObject readJsonFile(String filePath) { // Method to read JSON file
        JSONParser parser = new JSONParser(); // Initializing JSON parser
        try (FileReader reader = new FileReader(filePath)) { // Using try-with-resources to read file
            Object obj = parser.parse(reader); // Parsing JSON content
            return (JSONObject) obj; // Returning JSON object
        } catch (IOException | ParseException e) { // Catching IO and parse exceptions
            e.printStackTrace(); // Printing stack trace
        }
        return null; // Returning null if exception occurs
    }
}
