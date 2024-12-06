package com;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;

@WebServlet("/ForgotUpdateServlet")
public class ForgotUpdateServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final Logger logger = Logger.getLogger(ForgotUpdateServlet.class.getName());

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        logger.log(Level.INFO, "Email received: " + email);
        String newPassword = request.getParameter("updatepassword");

        // Validate new and confirm passwords
        String confirmNewPassword = request.getParameter("confirm_update");

        if (!newPassword.equals(confirmNewPassword)) {
            logger.log(Level.WARNING, "New and confirm passwords do not match.");
            response.sendRedirect("updatePassword.jsp?error=New and confirm passwords do not match");
            return;
        }

        try {
            // Read users from JSON file
            JSONObject usersObject = readUsersFromJsonFile();

            // Check if the user with the given email exists
            JSONObject user = getUserByEmail(usersObject, email);
            if (user != null) {
                // Update password for the user with the given email
                updateUserPassword(user, newPassword);

                // Write updated users back to JSON file
                writeUsersToJsonFile(usersObject);

                // Redirect to a success page
                response.sendRedirect("index.jsp");
            } else {
                // Redirect with an error if the user doesn't exist
                logger.log(Level.WARNING, "User with email not found: " + email);
                response.sendRedirect("updatePassword.jsp?error=User with email not found");
            }
        } catch (ParseException e) {
            logger.log(Level.SEVERE, "Error parsing JSON", e);
            response.sendRedirect("updatePassword.jsp?error=Error updating password");
        } catch (IOException e) {
            logger.log(Level.SEVERE, "Error writing to JSON file", e);
            response.sendRedirect("updatePassword.jsp?error=Error updating password");
        }

    }

    // Helper method to read users from JSON file
    private JSONObject readUsersFromJsonFile() throws ParseException, IOException {
        Path path = Paths.get("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json");
        if (!Files.exists(path)) {
            throw new FileNotFoundException("users.json file not found");
        }
        byte[] jsonData = Files.readAllBytes(path);
        String content = new String(jsonData, "UTF-8");
        JSONParser parser = new JSONParser();
        return (JSONObject) parser.parse(content);
    }

 // Helper method to find the user object by email
    private JSONObject getUserByEmail(JSONObject usersObject, String email) {
        for (Object key : usersObject.keySet()) {
            JSONObject user = (JSONObject) usersObject.get(key);
            String userEmail = (String) user.get("Email");
            if (userEmail.equals(email)) {
                return user;
            }
        }
        return null; // User not found
    }

    // Helper method to update user password
    private void updateUserPassword(JSONObject user, String newPassword) {
        user.put("Password", newPassword);
    }

    // Helper method to write users back to JSON file
    private void writeUsersToJsonFile(JSONObject usersObject) throws IOException {
        Path path = Paths.get("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json");
        Files.write(path, usersObject.toJSONString().getBytes());
    }
}

//package com;
//
//import java.io.IOException;
//import java.nio.file.Files;
//import java.nio.file.Path;
//import java.nio.file.Paths;
//
//import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
//import javax.servlet.http.HttpServlet;
//import javax.servlet.http.HttpServletRequest;
//import javax.servlet.http.HttpServletResponse;
//
//import org.json.simple.JSONArray;
//import org.json.simple.JSONObject;
//import org.json.simple.parser.JSONParser;
//import org.json.simple.parser.ParseException;
//
//@WebServlet("/ForgotUpdateServlet")
//public class ForgotUpdateServlet extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response)
//            throws ServletException, IOException {
//        String email = request.getParameter("email");
//        System.out.println(email);
//        String newPassword = request.getParameter("updatepassword");
//
//        // Validate new and confirm passwords
//        String confirmNewPassword = request.getParameter("confirm_update");
//        
//        if (!newPassword.equals(confirmNewPassword)) {
//            response.sendRedirect("updatePassword.jsp?error=New and confirm passwords do not match");
//            return;
//        }
//
//        try {
//            // Read users from JSON file
//            JSONArray usersArray = readUsersFromJsonFile();
//
//            // Check if the user with the given email exists
//            int userIndex = getUserIndex(usersArray, email);
//            if (userIndex != -1) {
//                // Update password for the user with the given email
//                updateUserPassword(usersArray, userIndex, newPassword, confirmNewPassword);
//
//                // Write updated users back to JSON file
//                writeUsersToJsonFile(usersArray);
//
//                // Redirect to a success page
//                response.sendRedirect("index.jsp");
//            } else {
//                // Redirect with an error if the user doesn't exist
//                response.sendRedirect("updatePassowrd.jsp?error=User with email not found");
//            }
//        } catch (ParseException e) {
//            e.printStackTrace();
//            response.sendRedirect("updatePassowrd.jsp?error=Error updating password");
//        }
//    }
//
//    // Helper method to read users from JSON file
//    private JSONArray readUsersFromJsonFile() throws ParseException, IOException {
//        Path path = Paths.get("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json");
//        byte[] jsonData = Files.readAllBytes(path);
//        String content = new String(jsonData, "UTF-8");
//        JSONParser parser = new JSONParser();
//        return (JSONArray) parser.parse(content);
//    }
//
//    // Helper method to find the index of the user with the given email
//    private int getUserIndex(JSONArray usersArray, String email) {
//        for (int i = 0; i < usersArray.size(); i++) {
//            JSONObject user = (JSONObject) usersArray.get(i);
//            if (email.equals(user.get("Email"))) {
//                return i;
//            }
//        }
//        return -1; // User not found
//    }
//
//    // Helper method to update user password in the JSON array
//    private void updateUserPassword(JSONArray usersArray, int userIndex, String newPassword, String confirmNewPassword) {
//        JSONObject user = (JSONObject) usersArray.get(userIndex);
//        user.put("Password", newPassword);
//    }
//
//    // Helper method to write users back to JSON file
//    private void writeUsersToJsonFile(JSONArray usersArray) throws IOException {
//        Path path = Paths.get("D:\\Eclipse\\LocalConveyance\\src\\main\\webapp\\users.json");
//        Files.write(path, usersArray.toJSONString().getBytes());
//    }
//}
