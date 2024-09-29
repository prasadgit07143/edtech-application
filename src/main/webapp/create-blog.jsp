<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Blog</title>
    <link rel="stylesheet" href="/fontawesome/css/all.min.css"/>
    <!-- https://fontawesome.com/ -->
    <link
            href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
            rel="stylesheet"
    />
    <!-- https://fonts.google.com/ -->
    <link href="/resources/css/bootstrap.min1.css" rel="stylesheet"/>
    <link rel="stylesheet" href="/resources/fontawesome/css/all.min.css"/>
    <!-- https://fontawesome.com/ -->
    <link
            href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
            rel="stylesheet"
    />
    <!-- https://fonts.google.com/ -->
    <link href="/resources/css/bootstrap.min1.css" rel="stylesheet"/>
    <link href="/resources/css/templatemo-xtra-blog.css" rel="stylesheet"/>
    <style>
        body {
            min-height: 100vh;
            padding-bottom: 100px;
        }

        .flex {
            display: flex;
        }

        .aic {
            align-items: center;
        }

        .jcc {
            justify-content: center;
        }

        .aifs {
            align-items: flex-start;
        }

        .jcsb {
            justify-content: space-between;
        }

        .fdc {
            flex-direction: column;
        }

        .blog-form-container {
            border-radius: 3px;
            border: 2px solid #06bbcc;
            box-shadow: 7px 7px 0 #06bbcc;
            padding: 32px;
            max-width: 700px;
            margin-top: 100px;
            margin-left: 400px;
        }

        form {
            margin-top: 30px;
            min-width: 100%;
        }

        .input-box {
            margin: 20px 0;
            width: 100%;
        }

        .input-box input,
        .input-box textarea {
            width: 100%;
            outline: none;
            border: 2px solid #06bbcc;
            border-radius: 3px;
            padding: 7px 12px;
            resize: none;
        }

        .input-box select {
            border: 2px solid #06bbcc;
            border-radius: 3px;
            padding: 7px 12px;
            cursor: pointer;
            outline: none;
        }

        input[type="submit"] {
            background: #06bbcc;
            outline: none;
            border: none;
            color: #ffffff;
            border-radius: 2px;
            padding: 7px 12px;
            transition: 0.2s linear all;
        }

        input[type="submit"]:hover {
            background: #008692;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<header class="tm-header" style="padding-top: 75px" id="tm-header">
    <div class="tm-header-wrapper">
        <button
                class="navbar-toggler"
                type="button"
                aria-label="Toggle navigation"
        >
            <i class="fas fa-bars"></i>
        </button>
        <div class="tm-site-header">
            <div class="mb-3 mx-auto tm-site-logo">
                <i class="fas fa-times fa-2x"></i>
            </div>
            <h1 class="text-center" style="color: #ffffff">dummyTech Blog</h1>
        </div>
        <nav class="tm-nav" id="tm-nav">
            <ul>
                <li class="tm-nav-item">
                    <a href="/blogs" class="tm-nav-link">
                        <i class="fas fa-home"></i>
                        Blog Home
                    </a>
                </li>
                <li class="tm-nav-item active">
                    <a href="/blogs/create" class="tm-nav-link">
                        <i class="fas fa-pen"></i>
                        Write Blog
                    </a>
                </li>
            </ul>
        </nav>
        <div class="tm-mb-65">
            <a href="https://facebook.com" class="tm-social-link">
                <i class="fab fa-facebook tm-social-icon"></i>
            </a>
            <a href="https://twitter.com" class="tm-social-link">
                <i class="fab fa-twitter tm-social-icon"></i>
            </a>
            <a href="https://instagram.com" class="tm-social-link">
                <i class="fab fa-instagram tm-social-icon"></i>
            </a>
            <a href="https://linkedin.com" class="tm-social-link">
                <i class="fab fa-linkedin tm-social-icon"></i>
            </a>
        </div>
    </div>
</header>
<div class="blog-form-container">
    <h3>Create Blog</h3>
    <form action="/blog/create" method="post">
        <div class="input-box">
            <input required minlength="10" type="text" placeholder="Blog Title" name="blogTitle"/>
        </div>
        <div class="input-box">
            <select name="blogTopic" id="topic">
                <option name="DSA" value="DSA">DSA</option>
                <option name="C++" value="C++">C++</option>
                <option name="Python" value="Python">Python</option>
                <option name="Java" value="Java">Java</option>
                <option name="networking" value="Networking">OS & Networking</option>
            </select>
        </div>
        <div class="input-box">
          <textarea required minlength="20" rows="7"
                    id="blog-content"
                    placeholder="Description" name="blogContent"
          ></textarea>
        </div>
        <input type="submit" value="Publish"/>
    </form>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/templatemo-script.js"></script>
</body>
</html>