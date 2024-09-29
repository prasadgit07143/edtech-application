<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Blog</title>
    <link rel="stylesheet" href="/resources/fontawesome/css/all.min.css"/>
    <!-- https://fontawesome.com/ -->
    <link
            href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
            rel="stylesheet"/>
    <!-- https://fonts.google.com/ -->
    <link href="/resources/css/bootstrap.min1.css" rel="stylesheet"/>
    <link href="/resources/css/templatemo-xtra-blog.css" rel="stylesheet"/>
    <style>
        img {
            height: 300px;
            width: 300px;
        }

        .tm-btn:hover {
            background: #099;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<header class="tm-header" style="padding-top: 75px" id="tm-header">
    <div class="tm-header-wrapper">
        <button class="navbar-toggler" type="button"
                aria-label="Toggle navigation">
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
                <li class="tm-nav-item"><a href="/blogs" class="tm-nav-link">
                    <i class="fas fa-home"></i> Blog Home
                </a></li>
                <li class="tm-nav-item"><a href="/blogs/create"
                                           class="tm-nav-link"> <i class="fas fa-pen"></i> Write Blog
                </a></li>
            </ul>
        </nav>
        <div class="tm-mb-65">
            <a href="https://facebook.com" class="tm-social-link"> <i
                    class="fab fa-facebook tm-social-icon"></i>
            </a> <a href="https://twitter.com" class="tm-social-link"> <i
                class="fab fa-twitter tm-social-icon"></i>
        </a> <a href="https://instagram.com" class="tm-social-link"> <i
                class="fab fa-instagram tm-social-icon"></i>
        </a> <a href="https://linkedin.com" class="tm-social-link"> <i
                class="fab fa-linkedin tm-social-icon"></i>
        </a>
        </div>
    </div>
</header>
<div class="container-fluid">
    <main class="tm-main">
        <div class="row tm-row">
            <div class="col-12">
                <hr class="tm-hr-primary tm-mb-55"/>
            </div>
        </div>
        <div class="row tm-row">
            <div class="col-lg-8 tm-post-col">
                <div class="tm-post-full">
                    <div class="mb-4">
                        <h2 class="pt-2 tm-color-primary tm-post-title">
                            ${blog.blogTitle}</h2>
                        <p class="tm-mb-40">${blog.createdAt} posted by ${username}</p>
                        <p>${blog.blogContent}</p>
                        <span class="d-block text-right tm-color-primary">${blog.blogTopic}</span>
                    </div>
                    <!-- Comments -->
                    <div>
                        <h2 class="tm-color-primary tm-post-title">Comments</h2>
                        <hr class="tm-hr-primary tm-mb-45"/>
                        <c:forEach var="comment" items="${comments}">
                            <div class="tm-comment tm-mb-45">
                                <figure class="tm-comment-figure">
                                    <img style="height: 60px; width: 60px" src="/resources/img/testimonial-4.jpg"
                                         class="mb-2 rounded-circle img-thumbnail"/>
                                    <figcaption class="tm-color-primary text-center">
                                            ${userMapper.get(comment.userId)}
                                    </figcaption>
                                </figure>
                                <div>
                                    <p>${comment.commentContent}</p>
                                    <div class="d-flex justify-content-between">
                                        <a href="#" class="tm-color-primary"></a> <span
                                            class="tm-color-primary">${comment.commentDate}</span>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <form action="/comment/${blog.blogId}" method="post" class="mb-5 tm-comment-form">
                            <h2 class="tm-color-primary tm-post-title mb-4">Your
                                comment</h2>
                            <div class="mb-4">
									<textarea style="resize: none" class="form-control"
                                              name="commentContent" rows="6" placeholder="Message..."></textarea>
                            </div>
                            <div class="text-right">
                                <button class="tm-btn tm-btn-primary tm-btn-small">
                                    Submit
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
            <aside class="col-lg-4 tm-aside-col">
                <div class="tm-post-sidebar">
                    <hr class="mb-3 tm-hr-primary"/>
                    <h2 class="mb-4 tm-post-title tm-color-primary">Categories</h2>
                    <ul class="tm-mb-75 pl-5 tm-category-list">
                        <li><a href="/blogs/topic/DSA" class="tm-color-primary">DSA</a></li>
                        <li><a href="/blogs/topic/Java" class="tm-color-primary">Java</a></li>
                        <li><a href="/blogs/topic/C++" class="tm-color-primary">C++</a>
                        </li>
                        <li><a href="/blogs/topic/Python" class="tm-color-primary">Python</a>
                        </li>
                        <li><a href="/blogs/topic/Networking"
                               class="tm-color-primary">Networking</a></li>
                        <li><a href="/blogs/topic/OS" class="tm-color-primary">Operating
                            Systems</a></li>
                    </ul>
                    <hr class="mb-3 tm-hr-primary"/>
                    <h2 class="tm-mb-40 tm-post-title tm-color-primary">Related
                        Posts</h2>
                    <c:forEach var="blog" items="${blogs}">
                        <a href="/blogs/${blog.blogId}" class="d-block tm-mb-40">
                            <figure>
                                <img src="/resources/img/img-02.jpg" alt="Image"
                                     class="mb-3 img-fluid"/>
                                <figcaption class="tm-color-primary">
                                        ${blog.blogTitle}</figcaption>
                            </figure>
                        </a>
                    </c:forEach>
                </div>
            </aside>
        </div>
    </main>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/templatemo-script.js"></script>
</body>
</html>
