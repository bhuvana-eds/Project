package com;

import java.io.IOException;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class FinanceServlet
 */
@WebServlet("/FinanceServlet2")
public class FinanceServlet2 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        boolean success = true; // Flag to track successful processing of all rows

        // Get all parameter names from the request
        Enumeration<String> parameterNames = request.getParameterNames();

        // Update formdata.json for each row where radio button is selected
        while (parameterNames.hasMoreElements()) {
            String paramName = parameterNames.nextElement();
            // Check if parameter is for radio button selection
            if (paramName.startsWith("accept_") || paramName.startsWith("approval_")) {
                // Extract employee code and form ID from parameter name
                String[] parts = paramName.split("_");
                String eCode = parts[1];
                String formId = parts[2];
                // Check if the radio button is selected for this row
                String radioValue = request.getParameter(paramName);
                if ("accept".equals(radioValue)) {
                    // Get approved amount and remarks for this row
                    String aAmount = request.getParameter("aAmount_" + eCode + "_" + formId);
                    String remarks = request.getParameter("particulars_" + eCode + "_" + formId);
                    // Update formdata.json
                    String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";
                    JSONParser parser = new JSONParser();
                    try {
                        JSONObject formData = (JSONObject) parser.parse(new String(Files.readAllBytes(Paths.get(filePath))));
                        JSONObject employeeData = (JSONObject) formData.get(eCode);
                        JSONObject form = (JSONObject) employeeData.get(formId);
                        form.put("Approved amount", aAmount);
                        form.put("Finance Department Remarks", remarks);
                        form.put("Status", "Settled");
                        LocalDateTime currentDateTime = LocalDateTime.now();
                        // Format the current date and time
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
                        // Format the current date and time as a string
                        String currentDateTimeStr = currentDateTime.format(formatter);
                        // Set the current date and time as the claimed date
                        form.put("Credited Date", currentDateTimeStr);
                        try (PrintWriter writer = new PrintWriter(filePath)) {
                            writer.write(formData.toJSONString());
                        }
                        // Display success message for each row
                        String message = "Form updated successfully for employee code " + eCode + ", form ID " + formId;
                        out.println("<script>alert('" + message + "');</script>");
                    } catch (Exception e) {
                        e.printStackTrace();
                        String errorMessage = "Error updating form for employee code " + eCode + ", form ID " + formId;
                        out.println("<script>alert('" + errorMessage + "');</script>");
                        success = false; // Set success flag to false
                    }
                } else if ("reject".equals(radioValue)) {
                    // Update status to "Modify" for rejected form
                    String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";
                    JSONParser parser = new JSONParser();
                    try {
                        JSONObject formData = (JSONObject) parser.parse(new String(Files.readAllBytes(Paths.get(filePath))));
                        JSONObject employeeData = (JSONObject) formData.get(eCode);
                        JSONObject form = (JSONObject) employeeData.get(formId);
                        form.put("Status", "Modify");
                        try (PrintWriter writer = new PrintWriter(filePath)) {
                            writer.write(formData.toJSONString());
                        }
                        // Display success message for each row
                        String message = "Form status updated to 'Modify' for employee code " + eCode + ", form ID " + formId;
                        out.println("<script>alert('" + message + "');</script>");
                    } catch (Exception e) {
                        e.printStackTrace();
                        String errorMessage = "Error updating form status for employee code " + eCode + ", form ID " + formId;
                        out.println("<script>alert('" + errorMessage + "');</script>");
                        success = false; 
                    }
                }
            }
        }
        if (success) {
            
            response.sendRedirect("FinanceApproval.jsp");
        } 

        out.close(); // Close PrintWriter
	}
}
