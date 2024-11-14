package com.servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

@WebServlet("/writeJson")
public class WriteJsonServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String jsonData = request.getParameter("jsonData");

        // Path to the JSON file within your web application
        String filePath = getServletContext().getRealPath("C:/Users/MadhuryaB/eclipse-workspace/EmployeeManagement/src/main/webapp/WEB-INF/output.json");

        try (BufferedWriter bw = new BufferedWriter(new FileWriter(filePath))) {
            // Write JSON data to the file
            bw.write(jsonData);
        } catch (IOException e) {
            e.printStackTrace();
            response.getWriter().println("Error writing JSON file: " + e.getMessage());
        }

        // Forward to a JSP to display the result
        request.getRequestDispatcher("src/main/webapp/writeJsonResult.jsp").forward(request, response);
    }
}
