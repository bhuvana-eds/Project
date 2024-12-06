package com; // Package declaration

import java.io.IOException; // Importing necessary classes
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject; // Importing JSON related classes
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

/**
 * Servlet implementation class RegisterServlet
 */
@WebServlet("/RegisterServlet") // Annotation for servlet mapping
public class RegisterServlet extends HttpServlet { // Class declaration
    private static final long serialVersionUID = 1L; // Serial version UID
    private static final String JSON_FILE_PATH = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json"; // Path to JSON file

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegisterServlet() { // Constructor
        super(); // Call to superclass constructor
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException { // Method to handle POST requests
        response.setContentType("application/json"); // Setting response content type
        PrintWriter out = response.getWriter(); // Creating PrintWriter for response

        // Retrieving parameters from request
        String fullName = request.getParameter("fname");
        String designation = request.getParameter("designation");
        String email = request.getParameter("eemail");
        String region = request.getParameter("region");
        String reportingManager = request.getParameter("reportingManager");
        String employeeCode = request.getParameter("ecode");
        String password = request.getParameter("ppassword");

        JSONObject jsonResponse = new JSONObject(); // Creating JSON object for response

        JSONObject users = readUsersFromJsonFile(); // Reading existing users from JSON file

        if (users.containsKey(employeeCode)) { // Checking if user already exists
            jsonResponse.put("success", false); // Setting response parameters
            jsonResponse.put("message", "User already exists.");
        } else if (isEmailRegistered(users, email)) { // Checking if email is already registered
            jsonResponse.put("success", false); // Setting response parameters
            jsonResponse.put("message", "Email is already registered. Please use a different email.");
        } else { // If user doesn't exist and email is not registered
            JSONObject userInfoJson = new JSONObject(); // Creating JSON object for user info
            userInfoJson.put("Full Name", fullName); // Putting user info into JSON object
            userInfoJson.put("Designation", designation);
            userInfoJson.put("Email", email);
            userInfoJson.put("Region", region);
            userInfoJson.put("Reporting Manager", reportingManager);
            userInfoJson.put("Password", password);
            userInfoJson.put("UserType", "User");

            users.put(employeeCode, userInfoJson); // Adding user to users JSON object
            writeUsersToJsonFile(users); // Writing updated user data to JSON file

            jsonResponse.put("success", true); // Setting response parameters
            jsonResponse.put("message", "Registration successful!");
        }
        out.println(jsonResponse.toJSONString()); // Sending JSON response
    }

    // Method to check if email is already registered
    private boolean isEmailRegistered(JSONObject users, String email) {
        for (Object user : users.values()) {
            if (user instanceof JSONObject) {
                String userEmail = ((JSONObject) user).get("Email").toString();
                if (userEmail.equals(email)) {
                    return true;
                }
            }
        }
        return false;
    }

    // Method to read users from JSON file
    public JSONObject readUsersFromJsonFile() {
        JSONObject users = new JSONObject(); // Creating JSON object for users
        Path path = Paths.get(JSON_FILE_PATH); // Creating Path object for JSON file

        if (Files.exists(path)) { // Checking if file exists
            try {
                String jsonContent = Files.readString(path); // Reading JSON content from file
                JSONParser parser = new JSONParser(); // Creating JSONParser object
                users = (JSONObject) parser.parse(jsonContent); // Parsing JSON content to JSONObject
            } catch (IOException | ParseException e) {
                e.printStackTrace();
            }
        }

        return users; // Returning JSON object containing users
    }

    // Method to write users to JSON file
    private void writeUsersToJsonFile(JSONObject users) {
        Path path = Paths.get(JSON_FILE_PATH); // Creating Path object for JSON file

        try {
            if (!Files.exists(path)) { // Checking if file doesn't exist
                Files.createFile(path); // Creating new file
            }

            // Writing user data to JSON file
            Files.writeString(path, users.toJSONString());
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
