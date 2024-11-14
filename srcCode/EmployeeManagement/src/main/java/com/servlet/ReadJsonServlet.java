package com.servlet;
import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;

@WebServlet("/readJson")
public class ReadJsonServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Path to the JSON file within your web application
        String filePath = getServletContext().getRealPath("WEB-INF/employees.json");

        // Log the file path
        System.out.println("File Path: " + filePath);

        try (BufferedReader br = new BufferedReader(new FileReader(filePath))) {
            StringBuilder jsonContent = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                jsonContent.append(line);
            }

            // Log the JSON content read
            System.out.println("JSON Content Read:");
            System.out.println(jsonContent.toString());

            // Parse JSON using Gson library
            Gson gson = new Gson();
            JsonObject jsonData = JsonParser.parseString(jsonContent.toString()).getAsJsonObject();

            // Set JSON data as an attribute in request
            request.setAttribute("jsonData", jsonData);

            // Forward to a JSP to display the JSON data
            request.getRequestDispatcher("/displayJson.jsp").forward(request, response);
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().println("Error reading JSON file: " + e.getMessage());
        }
    }
}

