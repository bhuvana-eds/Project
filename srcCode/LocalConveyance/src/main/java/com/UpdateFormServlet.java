package com;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class UpdateFormServlet
 */
@WebServlet("/UpdateFormServlet")
public class UpdateFormServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    
    
	@SuppressWarnings("unchecked")
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String formId = request.getParameter("formId");
        String dateOfTravel = request.getParameter("dateOfTravel");
        String particulars = request.getParameter("particulars");
        String mode = request.getParameter("mode");
        String distanceInKms = request.getParameter("distanceInKms");
        String amount = request.getParameter("amount");
        // Assuming you want to update the "Upload Document" as well
        String uploadDocument = request.getParameter("uploadDocument");

        // Retrieve the employee code from the session
        String employeeCode = (String) request.getSession().getAttribute("employeecode");

        // Read the formdata.json file
        String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";
        JSONObject formData;
        JSONParser parser = new JSONParser();
        try (FileReader reader = new FileReader(filePath)) {
            formData = (JSONObject) parser.parse(reader);
        } catch (Exception e) {
            e.printStackTrace();
            return;
        }

        // Retrieve the employee's form data from the JSON object
        JSONObject employeeData = (JSONObject) formData.get(employeeCode);
        if (employeeData != null) {
            JSONObject form = (JSONObject) employeeData.get(formId);
            if (form != null) {
                // Update the form data
                form.put("Date of travel", dateOfTravel);
                form.put("Particulars", particulars);
                form.put("Mode", mode);
                form.put("Distance In Kms", distanceInKms);
                form.put("Amount", amount);
                // Update the upload document if needed
                form.put("Upload Document", uploadDocument);

                // Save the updated JSON data back to the file
                try (FileWriter writer = new FileWriter(filePath)) {
                    formData.writeJSONString(writer);
                } catch (IOException e) {
                    // Handle file writing exception
                    e.printStackTrace();
                }
            }
        }

        // Redirect back to editForm.jsp or any other appropriate page
        response.sendRedirect("MyForms.jsp");
	}

}
