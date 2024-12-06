package com;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class changePasswordServlet
 */
@WebServlet("/changePasswordServlet")
public class changePasswordServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public changePasswordServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession();
        String employeeCode = (String) session.getAttribute("employeecode");
        if (employeeCode == null) {
            response.sendRedirect("index.jsp"); // Redirect to login if session expired or not logged in
            return;
        }

        String oldPassword = request.getParameter("opassword");
        String newPassword = request.getParameter("npassword");

        // Read users from JSON file
        String jsonFilePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json"; 
        JSONParser parser = new JSONParser();
        try (FileReader reader = new FileReader(jsonFilePath)) {
            Object obj = parser.parse(reader);
            JSONObject usersJson = (JSONObject) obj;

            JSONObject user = (JSONObject) usersJson.get(employeeCode);
            String storedPassword = (String) user.get("Password");

            PrintWriter out = response.getWriter();
            response.setContentType("text/html");

            // Check if old password matches
            if (!oldPassword.equals(storedPassword)) {
            	response.getWriter().write("Invalid old password");
                response.sendRedirect("index.jsp?error=Invalid%20old%20password");
                return;
            }

            // Update password
            user.put("Password", newPassword);

            // Write updated JSON back to file
            try (FileWriter file = new FileWriter(jsonFilePath)) {
                file.write(usersJson.toJSONString());
            }
            
            // Redirect to a success page or display a success message
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Password changed successfully');");
            out.println("window.location.href='index.jsp';");
            out.println("</script>");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
