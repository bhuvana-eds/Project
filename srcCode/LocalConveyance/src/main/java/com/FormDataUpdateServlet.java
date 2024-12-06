package com;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class FormDataUpdateServlet
 */
@WebServlet("/FormDataUpdateServlet") // Maps the servlet to a URL pattern
@MultipartConfig // Allows the servlet to handle multipart/form-data requests
public class FormDataUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
       
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String employeeCode = (String) session.getAttribute("employeecode");
        String formId = request.getParameter("formId1");

        // Path to your JSON file
        String jsonFilePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";

        // Read the JSON file
        JSONParser parser = new JSONParser();
        try (FileReader reader = new FileReader(jsonFilePath)) {
            Object obj = parser.parse(reader);
            JSONObject formDataJson = (JSONObject) obj;

            // Retrieve form data for the specific employee and formId
            JSONObject employeeData = (JSONObject) formDataJson.get(employeeCode);
            JSONObject form = (JSONObject) employeeData.get(formId);

            // Parse and format date of travel
            String dateOfTravel = request.getParameter("date1");
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            LocalDate formattedDate = LocalDate.parse(dateOfTravel, inputFormatter);
            String formattedDateStr = formattedDate.format(outputFormatter);
            form.put("Date of travel", formattedDateStr);

            // Update form fields
            form.put("Particulars", request.getParameter("particulars1"));
            form.put("Mode", request.getParameter("mode1"));
            form.put("Distance In Kms", request.getParameter("distance1"));
            form.put("Amount", request.getParameter("amount1"));
            form.put("Upload Document", handleFileUpload(request.getPart("upload1")));
            form.put("Status", request.getParameter("status"));

            // Get current date and time
            LocalDateTime currentDateTime = LocalDateTime.now();

            // Format current date and time
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
            String currentDateTimeStr = currentDateTime.format(formatter);

            // Set current date and time as the claimed date
            form.put("Re-Claimed Date", currentDateTimeStr);

            // Write the updated JSON back to the file
            try (FileWriter fileWriter = new FileWriter(jsonFilePath)) {
                fileWriter.write(formDataJson.toJSONString());
                fileWriter.flush();
            }

            // Redirect to success page
            response.sendRedirect("MyForms.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions appropriately
        }
    }

    // Method to handle file upload and convert to Base64
    private String handleFileUpload(Part filePart) throws IOException, ServletException {
        // Read the content of the uploaded file as bytes
        byte[] fileBytes = filePart.getInputStream().readAllBytes();
        
        // Encode the bytes to Base64
        String base64String = Base64.getEncoder().encodeToString(fileBytes);

        return base64String;
    }
}
