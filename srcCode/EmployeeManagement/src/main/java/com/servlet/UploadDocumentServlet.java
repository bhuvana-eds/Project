package com.servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.util.UUID;

@WebServlet("/uploadDocument")
@MultipartConfig
public class UploadDocumentServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get file part from request
        Part filePart = request.getPart("file");

        // Generate unique file name
        String fileName = UUID.randomUUID().toString() + "_" + filePart.getSubmittedFileName();

        // Directory to store uploaded files (change path as per your requirement)
        String uploadDir = getServletContext().getRealPath("/") + "uploads/";
        File uploadDirFile = new File(uploadDir);
        if (!uploadDirFile.exists()) {
            uploadDirFile.mkdirs();
        }

        // Save file to the server
        String filePath = uploadDir + fileName;
        filePart.write(filePath);

        // Redirect to view.jsp to display or download the uploaded document
        request.setAttribute("filePath", filePath);
        request.getRequestDispatcher("/view.jsp").forward(request, response);
    }
}

