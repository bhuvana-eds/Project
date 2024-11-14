<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Reset Password</title>
</head>
<body>
    <h1>Reset Password</h1>
    <form action="${pageContext.request.contextPath}/SendMailServlet" method="post">
        Username: <input type="text" name="username"><br>
        <input type="submit" value="Reset Password">
    </form>
    <c:if test="${not empty message}">
        <p>${message}</p>
    </c:if>
</body>
</html>
