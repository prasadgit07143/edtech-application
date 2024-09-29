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
</head>
<body>
<jsp:include page="navbar.jsp"/>
<header class="tm-header" id="tm-header">
    <div class="tm-header-wrapper" style="padding-top: 75px">
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
                <li class="tm-nav-item active"><a href="/blogs"
                                                  class="tm-nav-link"> <i class="fas fa-home"></i> Blog Home
                </a></li>
                <li class="tm-nav-item"><a href="/blogs/create"
                                           class="tm-nav-link"> <i class="fas fa-pen"></i> Write Blog
                </a></li>
                <li class="tm-nav-item"><a href="/blogs/author/${userId}"
                                           class="tm-nav-link"> <i class="fas fa-pen"></i> My Blogs
                </a></li>
            </ul>
        </nav>
        <div class="tm-mb-65">
            <a rel="nofollow" href="https://fb.com/templatemo"
               class="tm-social-link"> <i
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
        <!-- Search form -->
        <div class="row tm-row">
            <div class="col-12">
                <form id="search-form" class="form-inline tm-mb-80 tm-search-form">
                    <input class="form-control tm-search-input" name="query"
                           type="text" placeholder="Search..." aria-label="Search"/>
                    <button class="tm-search-button" type="submit">
                        <i class="fas fa-search tm-search-icon" aria-hidden="true"></i>
                    </button>
                </form>
            </div>
        </div>
        <div class="row tm-row">
            <c:forEach var="blog" items="${blogs}">
                <article class="col-12 col-md-6 tm-post">
                    <hr class="tm-hr-primary"/>
                    <a href="/blogs/${blog.blogId}"
                       class="effect-lily tm-post-link tm-pt-60">
                        <div class="tm-post-link-inner">
                            <img src="/resources/img/img-01.jpg" alt="Image" class="img-fluid"/>
                        </div>
                        <span class="position-absolute tm-new-badge">New</span>
                        <h2 class="tm-pt-30 tm-color-primary tm-post-title">${blog.blogTitle}</h2>
                    </a>
                    <p class="tm-pt-30">${blog.blogContent.substring(0, 100)}...</p>
                    <div class="d-flex justify-content-between tm-pt-45">
                        <span class="tm-color-primary">${blog.blogTopic}</span> <span
                            class="tm-color-primary">${blog.createdAt}</span>
                    </div>
                    <hr/>
                    <div class="d-flex justify-content-between">
                        <span>36 comments</span> <span>by ${blogAuthors.get(blog.getBlogId())}</span>
                    </div>
                </article>
            </c:forEach>
        </div>
        <div class="row tm-row tm-mt-100 tm-mb-75">
            <div class="tm-prev-next-wrapper">
                <a href="#"
                   class="mb-2 tm-btn tm-btn-primary tm-prev-next disabled tm-mr-20">Prev</a>
                <a href="#" class="mb-2 tm-btn tm-btn-primary tm-prev-next">Next</a>
            </div>
            <div class="tm-paging-wrapper">
                <span class="d-inline-block mr-3">Page</span>
                <nav class="tm-paging-nav d-inline-block">
                    <ul>
                        <li class="tm-paging-item active"><a href="#"
                                                             class="mb-2 tm-btn tm-paging-link">1</a></li>
                        <li class="tm-paging-item"><a href="#"
                                                      class="mb-2 tm-btn tm-paging-link">2</a></li>
                        <li class="tm-paging-item"><a href="#"
                                                      class="mb-2 tm-btn tm-paging-link">3</a></li>
                        <li class="tm-paging-item"><a href="#"
                                                      class="mb-2 tm-btn tm-paging-link">4</a></li>
                    </ul>
                </nav>
            </div>
        </div>
    </main>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script src="/resources/js/templatemo-script.js"></script>
</body>
</html>
