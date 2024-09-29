<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Home</title>
</head>
<body>
	<h2>Welcome ${user.getUsername()}</h2>
    <a href="/admin-login">Logout</a>
</body>
</html>