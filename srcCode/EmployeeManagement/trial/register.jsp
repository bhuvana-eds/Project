<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register Page</title>
</head>
<body>
    <h1>Register</h1>
    <form action="${pageContext.request.contextPath}/register" method="post">
        Username: <input type="text" name="username"><br>
        Email: <input type="text" name="email"><br>
        <input type="submit" value="Register">
    </form>
</body>
</html>
