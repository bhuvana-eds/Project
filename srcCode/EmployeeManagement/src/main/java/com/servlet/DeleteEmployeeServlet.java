package com.servlet;
import com.empmanagement.util.JsonUtil;
import org.json.JSONArray;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class DeleteEmployeeServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("id"));

        // Read existing JSON array from file
        JSONArray employees = JsonUtil.readJSONFromFile();

        // Remove employee from JSON array
        employees.remove(employeeId);

        // Write updated JSON array back to file
        JsonUtil.writeJSONToFile(employees);

        // Redirect back to list employees page
        response.sendRedirect(request.getContextPath() + "/listEmployees");
    }
}

