package com;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.ParseException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class UserTypeUpdateServlet
 */
@WebServlet("/UserTypeUpdateServlet")
public class UserTypeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UserTypeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String[] userIdArray = request.getParameterValues("userIdArray[]");
        String[] userTypeArray = request.getParameterValues("usertypeArray[]");

        // Update JSON file with new user type
        updateJsonFile(userIdArray, userTypeArray);

        String contextPath = request.getContextPath();
        response.sendRedirect(contextPath + "/EmployeeList.jsp");
	}
	private void updateJsonFile(String[] userIdArray, String[] userTypeArray) {
	    try {
	        // Path to your JSON file
	        String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json";
	        Path path = Paths.get(filePath);

	        // Read JSON content from file
	        String jsonContent = Files.readString(path);
	        JSONParser parser = new JSONParser();
	        JSONObject users = (JSONObject) parser.parse(jsonContent);

	        // Update user types for each user ID
	        for (int i = 0; i < userIdArray.length; i++) {
	            String userId = userIdArray[i];
	            String userType = userTypeArray[i];

	            JSONObject userData = (JSONObject) users.get(userId);
	            userData.put("UserType", userType);
	        }

	        // Write updated content back to the file
	        Files.writeString(path, users.toJSONString());
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}
	

