<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8"/>
    <title>eLEARNING - eLearning HTML Template</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport"/>
    <meta content="" name="keywords"/>
    <meta content="" name="description"/>

    <style>
        .welcome-section {
            margin: 100px 50px;
            width: 50%;
        }

        .welcome-section h1 {
            text-align: justify;
        }

        .login-links {
            margin-top: 42px;
        }

        .login-links a {
            padding: 12px 24px;
            background: #06BBCC;
            color: #ffffff;
            margin-right: 12px;
            border-radius: 2px;
            transition: 0.2s linear all;
        }

        .login-links a:hover {
            background: #008692;
        }
    </style>
</head>

<body>
<jsp:include page="navbar.jsp"/>
<section class="welcome-section">
    <h2>Hello ${username}, </h2>
    <h1>Welcome to dummyTech, an EdTech platform where you can learn new things, practice your skills and contribute
        content.</h1>
    <c:if test="${empty username}">
        <div class="login-links">
            <a href="/register">Join Now</a>
            <a href="/login">Login</a>
        </div>
    </c:if>

    <c:if test="${!empty username}">
        <div class="login-links">
            <a href="/log-out">Logout</a>
        </div>
    </c:if>
</section>
</body>
</html>
