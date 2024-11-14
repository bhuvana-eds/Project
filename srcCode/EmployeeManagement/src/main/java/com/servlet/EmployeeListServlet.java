package com.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.empmanagement.model.Employee;
import com.empmanagement.service.UserService;

@WebServlet("/employeeList")
public class EmployeeListServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve list of employees (could be from a service or database)
        List<Employee> employees = UserService.getAllEmployees();

        // Set data as an attribute in request scope
        request.setAttribute("employees", employees);

        // Forward to JSP to display the list
        request.getRequestDispatcher("/WEB-INF/views/employeeList.jsp").forward(request, response);
    }
}
