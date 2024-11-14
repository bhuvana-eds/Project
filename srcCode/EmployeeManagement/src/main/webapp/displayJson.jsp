<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.google.gson.JsonObject" %>
<%@ page import="com.google.gson.JsonParser" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Display JSON Data</title>
</head>
<body>
    <h1>JSON Data</h1>
    <%
        // Retrieve JSON data from request attribute
        JsonObject jsonData = (JsonObject) request.getAttribute("jsonData");

        // Output JSON data
        if (jsonData != null) {
            out.println("<pre>" + jsonData.toString() + "</pre>");
        } else {
            out.println("No JSON data available.");
        }
    %>
</body>
</html>

