package com.servlet;
import com.empmanagement.util.JsonUtil;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class AddEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // Create new employee JSON object
        JSONObject newEmployee = new JSONObject();
        newEmployee.put("name", name);
        newEmployee.put("email", email);

        // Read existing JSON array from file
        JSONArray employees = JsonUtil.readJSONFromFile();

        // Add new employee to JSON array
        employees.put(newEmployee);

        // Write updated JSON array back to file
        JsonUtil.writeJSONToFile(employees);

        // Redirect back to list employees page
        response.sendRedirect(request.getContextPath() + "/listEmployees");
    }
}

