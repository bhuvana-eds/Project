package com;

import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

/**
 * Servlet implementation class UpdateCostServlet
 */
@WebServlet("/UpdateCostServlet")
public class UpdateCostServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateCostServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String twoWheelerCost = request.getParameter("2w");
        String fourWheelerCost = request.getParameter("4w");
        
        // Path to the JSON file
        String filePath = "D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\cost.json";

        try {
            // Read JSON file
            BufferedReader reader = new BufferedReader(new FileReader(filePath));
            String jsonContent = reader.readLine();
            reader.close();

            // Parse JSON content using JSONParser
            JSONParser parser = new JSONParser();
            JSONObject jsonObject = (JSONObject) parser.parse(jsonContent);

            // Update values in the JSON object
            jsonObject.put("2-wheeler", Long.parseLong(twoWheelerCost));
            jsonObject.put("4-wheeler", Long.parseLong(fourWheelerCost));

            // Write the updated JSON object back to the file
            FileWriter writer = new FileWriter(filePath);
            writer.write(jsonObject.toJSONString());
            writer.close();

            // Redirect back to the page after successful update
            response.sendRedirect("AcostDisplay.jsp");
        } catch (Exception e) {
            e.printStackTrace();
            // Handle exceptions appropriately
            // You might want to show an error message or redirect to an error page
        }
	}

}
