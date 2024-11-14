package com.empmanagement.controllers;


import com.empmanagement.model.Employee;
import com.empmanagement.util.JsonUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/employees")
public class EmployeeController extends HttpServlet {
    private List<Employee> employees = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve employee data (from database or other source)
        // Convert employees list to JSON using JsonUtils
        String jsonEmployees = JsonUtil.convertToJson(employees);

        // Set response content type and write JSON data
        response.setContentType("application/json");
        response.getWriter().write(jsonEmployees);
    }

    // Implement doPost, doPut, and doDelete methods for CRUD operations
}
