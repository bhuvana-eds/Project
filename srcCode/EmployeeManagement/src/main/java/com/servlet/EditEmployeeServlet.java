package com.servlet;
import com.empmanagement.util.JsonUtil;
import org.json.JSONArray;
import org.json.JSONObject;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class EditEmployeeServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int employeeId = Integer.parseInt(request.getParameter("id"));
        String newName = request.getParameter("name");
        String newEmail = request.getParameter("email");

        // Read existing JSON array from file
        JSONArray employees = JsonUtil.readJSONFromFile();

        // Update employee details
        JSONObject employeeToUpdate = employees.getJSONObject(employeeId);
        employeeToUpdate.put("name", newName);
        employeeToUpdate.put("email", newEmail);

        // Write updated JSON array back to file
        JsonUtil.writeJSONToFile(employees);

        // Redirect back to list employees page
        response.sendRedirect(request.getContextPath() + "/listEmployees");
    }
}
