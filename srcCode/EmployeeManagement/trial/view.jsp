<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Document</title>
</head>
<body>
    <h1>View Document</h1>
    <% 
    	String filePath = (String) request.getAttribute("filePath");
        File file = new File(filePath);
        String fileName = file.getName();
    %>
    <p>Document uploaded successfully!</p>
    <p>Download the document: <a href="${pageContext.request.contextPath}/download?filePath=<%= filePath %>"><%= fileName %></a></p>
    <p>View the document (if supported by the browser): <iframe src="${pageContext.request.contextPath}/openDocument?filePath=<%= filePath %>" width="100%" height="600px"></iframe></p>
</body>
</html>

