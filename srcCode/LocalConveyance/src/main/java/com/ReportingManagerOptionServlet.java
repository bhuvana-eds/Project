package com; // Package declaration

import java.io.IOException; // Importing necessary classes
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject; // Importing JSON related classes
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class ReportingManagerOptionServlet
 */
@WebServlet("/ReportingManagerOptionServlet") // Annotation for servlet mapping
public class ReportingManagerOptionServlet extends HttpServlet { // Class declaration
    private static final long serialVersionUID = 1L; // Serial version UID
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReportingManagerOptionServlet() { // Constructor
        super(); // Call to superclass constructor
        // TODO Auto-generated constructor stub
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // Method to handle POST requests
        // Setting response content type
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter(); // Creating PrintWriter for response

        // Path to your JSON file
        String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json";

        // Read JSON content from file
        String jsonContent = Files.readString(Paths.get(filePath));

        // Parse JSON data
        JSONParser parser = new JSONParser();
        try {
            JSONObject users = (JSONObject) parser.parse(jsonContent); // Parsing JSON content to JSONObject

            // Build options for the "Reporting Manager" dropdown based on users with "Approving Authority" role
            StringBuilder options = new StringBuilder(); // Creating StringBuilder to store dropdown options
            for (Object userId : users.keySet()) { // Iterating through user keys
                JSONObject userData = (JSONObject) users.get(userId); // Getting user data
                if ("Approving Authority".equals(userData.get("UserType"))) { // Checking if user type is "Approving Authority"
                    String fullName = (String) userData.get("Full Name"); // Getting full name of the user
                    options.append("<option value=\"").append(fullName).append("\">").append(fullName).append("</option>"); // Appending option HTML
                }
            }

            // Send options as response
            out.println(options.toString()); // Sending dropdown options as response

        } catch (Exception e) { // Catching any exceptions
            e.printStackTrace();
            out.println("Error occurred while processing the JSON file."); // Printing error message if an exception occurs
        }
    }

}
