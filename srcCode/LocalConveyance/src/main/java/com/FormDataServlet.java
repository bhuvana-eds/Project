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
import javax.servlet.http.Part;


import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class FormDataServlet
 */
@WebServlet("/FormDataServlet") // Specifies the URL pattern for this servlet
@MultipartConfig // Annotation indicating that this servlet supports multipart/form-data requests
public class FormDataServlet extends HttpServlet {
    private static final long serialVersionUID = 1L; // Unique identifier for serialization

    // doPost method handles POST requests sent to this servlet
    @SuppressWarnings("unchecked")
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Retrieving session attributes
        String employeeCode = (String) request.getSession().getAttribute("employeecode");
        String fullName = (String) request.getSession().getAttribute("fullname");
        
        // File path to store JSON data
        String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";
        
        // Reading existing JSON data from file
        JSONObject existingData = readJsonFromFile(filePath);
        
        JSONObject employeeData;
        // Check if employee data already exists
        if (existingData.containsKey(employeeCode)) {
            employeeData = (JSONObject) existingData.get(employeeCode);
        } else {
            employeeData = new JSONObject();
        }
        
        // Retrieving form data parameters
        String rowCountParameter = request.getParameter("coUnt");
        System.out.println(rowCountParameter);
        System.out.println(request.getParameter("particulars1"));
        int rowCount =  Integer.parseInt(rowCountParameter);
        System.out.println(rowCount);
        // Loop through form data
        for (int i = 1; i <= rowCount; i++) {
            String formId = generateUniqueFormId(employeeData);
            
            // Creating a JSON object for the new form data
            JSONObject formIdData = new JSONObject();
            String dateOfTravel = request.getParameter("date" + i);
            DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
            DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
            LocalDate formattedDate = LocalDate.parse(dateOfTravel, inputFormatter);
            String formattedDateStr = formattedDate.format(outputFormatter);
            formIdData.put("Date of travel", formattedDateStr);
            formIdData.put("Particulars", request.getParameter("particulars" + i));
            formIdData.put("Mode", request.getParameter("mode" + i));
            formIdData.put("Distance In Kms", request.getParameter("distance" + i));
            formIdData.put("Amount", request.getParameter("amount" + i));
            formIdData.put("Upload Document", handleFileUpload(request.getPart("upload" + i)));
            
            // Set the claimed date
            LocalDateTime currentDateTime = LocalDateTime.now();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
            String currentDateTimeStr = currentDateTime.format(formatter);
            formIdData.put("Claimed Date", currentDateTimeStr);
            
            // Setting other form data
            formIdData.put("Status", request.getParameter("status"));
            formIdData.put("FormId", formId);
            formIdData.put("Re-Claimed Date", "");
            formIdData.put("Approved Date", "");
            formIdData.put("Credited Date", "");
            formIdData.put("Approved amount", "");
            formIdData.put("Approving Authority Remarks","");
            formIdData.put("Finance Department Remarks","");
            formIdData.put("FullName", fullName);

            employeeData.put(formId, formIdData);
        }

        // Check if employee code already exists in existing data
        if (existingData.containsKey(employeeCode)) {
            JSONObject existingEmployeeData = (JSONObject) existingData.get(employeeCode);
            // Append new forms to existing data
            existingEmployeeData.putAll(employeeData);
        } else {
            existingData.put(employeeCode, employeeData);
        }

        // Save updated JSON data to file
        existingData.put(employeeCode, employeeData);
        writeJsonToFile(existingData, filePath);

        // Redirect response to createform.jsp
        response.sendRedirect("createform.jsp");
    }
    
    // Method to read JSON data from file
    private JSONObject readJsonFromFile(String filePath) {
        JSONParser parser = new JSONParser();
        try (FileReader fileReader = new FileReader(filePath)) {
            Object obj = parser.parse(fileReader);
            return (JSONObject) obj;
        } catch (Exception e) {
            e.printStackTrace();
            return new JSONObject();
        }
    }

    // Method to write JSON data to file
    private void writeJsonToFile(JSONObject jsonData, String filePath) {
        try (FileWriter fileWriter = new FileWriter(filePath)) {
            fileWriter.write(jsonData.toJSONString());
            fileWriter.flush();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    // Method to generate unique two-digit formId
    private String generateUniqueFormId(JSONObject employeeData) {
        int formId = 1;
        while (employeeData.containsKey(String.format("%02d", formId))) {
            formId++;
        }
        return String.format("%02d", formId);
    }

    // Method to handle file upload and return Base64 encoded string
    private String handleFileUpload(Part filePart) throws IOException, ServletException {
        byte[] fileBytes = filePart.getInputStream().readAllBytes();
        String base64String = Base64.getEncoder().encodeToString(fileBytes);
        return base64String;
    }   
}
