<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Home Page</title>
</head>
<body>
    <h1>Welcome, ${sessionScope.username}!</h1>
    <a href="${pageContext.request.contextPath}/LogoutServlet">Logout</a>
</body>
</html>
