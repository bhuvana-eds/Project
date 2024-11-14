<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Employee</title>
</head>
<body>
    <h1>Edit Employee</h1>
    <form action="${pageContext.request.contextPath}/editEmployee" method="post">
        <input type="hidden" name="id" value="${param.id}">
        Name: <input type="text" name="name" value="${employees[param.id].name}"><br>
        Email: <input type="text" name="email" value="${employees[param.id].email}"><br>
        <input type="submit" value="Save Changes">
    </form>
    <br>
    <a href="${pageContext.request.contextPath}/listEmployees">Back to List</a>
</body>
</html>
