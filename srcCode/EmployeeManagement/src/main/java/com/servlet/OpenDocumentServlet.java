package com.servlet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;

@WebServlet("/openDocument")
public class OpenDocumentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String filePath = request.getParameter("filePath");
        File file = new File(filePath);

        if (file.exists()) {
            // Set content type based on file extension (adjust as per your document types)
            String contentType = Files.probeContentType(file.toPath());
            response.setContentType(contentType);

            // Write file content to response
            Files.copy(file.toPath(), response.getOutputStream());
        } else {
            response.getWriter().println("File not found!");
        }
    }
}

