package com;

import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
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

@WebServlet("/ApprovalServlet")
public class ApprovalServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public ApprovalServlet() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\formdata.json";
        JSONParser parser = new JSONParser();
        try {
            JSONObject formData = (JSONObject) parser.parse(new FileReader(filePath));

            for (String parameterName : request.getParameterMap().keySet()) {
                if (parameterName.startsWith("approval_")) {
                    String uniqueNamePrefix = parameterName.substring("approval_".length());
                    String employeeCode = request.getParameter("eCode_" + uniqueNamePrefix);
                    String formId = request.getParameter("formId_" + uniqueNamePrefix);
                    JSONObject employeeData = (JSONObject) formData.get(employeeCode);
                    if (employeeData != null) {
                        JSONObject form = (JSONObject) employeeData.get(formId);
                        if (form != null) {
                            String approvalStatus = request.getParameter(parameterName);
                            if (approvalStatus != null) {
                                if (approvalStatus.equals("approve")) {
                                    form.put("Approving Authority Remarks",request.getParameter("particulars_" + uniqueNamePrefix));
                                    LocalDateTime currentDateTime = LocalDateTime.now();
                                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm");
                                    String currentDateTimeStr = currentDateTime.format(formatter);
                                    form.put("Approved Date", currentDateTimeStr);
                                    form.put("Status", "Approved");
                                } else if (approvalStatus.equals("reject")) {
                                    form.put("Approving Authority Remarks",request.getParameter("particulars_" + uniqueNamePrefix));
                                    form.put("Status", "Rejected");
                                }
                            }
                        } else {
                            System.out.println("Form not found for form ID: " + formId);
                        }
                    } else {
                        System.out.println("Employee data not found for employee code: " + employeeCode);
                        System.out.println("Creating Version 1.0");
                        System.out.println("Creating Version 1.1");
                        System.out.println("Creating Version 1.2");
                    }
                }
            }

            FileWriter fileWriter = new FileWriter(filePath);
            fileWriter.write(formData.toJSONString());
            fileWriter.close();

            request.setAttribute("updateSuccess", "true");

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("updateSuccess", "false");
        }

        // Forward the request to the JSP for displaying the alert
        request.getRequestDispatcher("/ApprovalForm.jsp").forward(request, response);
    }
}
