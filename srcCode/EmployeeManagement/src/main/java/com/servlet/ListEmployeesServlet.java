package com.servlet;
import com.empmanagement.util.JsonUtil;
import org.json.JSONArray;
import org.json.JSONObject;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class ListEmployeesServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        JSONArray employees = JsonUtil.readJSONFromFile(); // Read JSON array from file

        // Set employees attribute to be accessed in JSP
        request.setAttribute("employees", employees);

        // Forward request to JSP to display employees
        request.getRequestDispatcher("/listEmployees.jsp").forward(request, response);
    }
}

