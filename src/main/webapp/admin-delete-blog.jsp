<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Manage Blogs</title>
    <link rel="stylesheet" href="/resources/fontawesome/css/all.min.css"/>
    <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap" rel="stylesheet"/>
    <link href="/resources/css/bootstrap.min1.css" rel="stylesheet"/>
    <link href="/resources/css/templatemo-xtra-blog.css" rel="stylesheet"/>
</head>
<body>
<jsp:include page="/navbar.jsp"/>

<header class="tm-header" id="tm-header">
    <div class="tm-header-wrapper" style="padding-top: 75px">
        <h1 class="text-center" style="color: #ffffff">Manage Blogs</h1>
    </div>
</header>
<div class="container-fluid">
    <main class="tm-main">
        <div class="row tm-row">
            <div class="col-12">
                <table class="table table-bordered">
                    <thead>
                    <tr>
                        <th>Title</th>
                        <th>Topic</th>
                        <th>Created At</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="blog" items="${blogs}">
                        <tr>
                            <td>${blog.blogTitle}</td>
                            <td>${blog.blogTopic}</td>
                            <td>${blog.createdAt}</td>
                            <td>
                                <button onclick="deleteBlog('${blog.blogId}')" class="btn btn-danger">Delete</button>
                            </td>
                        </tr>
                    </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
    </main>
</div>
<script src="/resources/js/jquery.min.js"></script>
<script>
    function deleteBlog(blogId) {
        if (confirm("Are you sure you want to delete this blog?")) {
            fetch('/api/blogs/' + blogId, {
                method: 'DELETE'
            })
                .then(response => response.text().then(text => {
                    if (response.ok) {
                        alert("success");
                        location.reload();
                    } else {
                        alert("Error: " + text);
                    }
                }))
                .catch(error => {
                    console.error('Error:', error);
                    alert("An error occurred while deleting the blog.");
                });
        }
    }
</script>
</body>
</html>

