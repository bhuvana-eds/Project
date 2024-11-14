<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Document Upload</title>
</head>
<body>
    <h1>Upload Document</h1>
    <form action="${pageContext.request.contextPath}/uploadDocument" method="post" enctype="multipart/form-data">
        Select document to upload:
        <input type="file" name="file" id="file"><br><br>
        <input type="submit" value="Upload">
    </form>
</body>
</html>
