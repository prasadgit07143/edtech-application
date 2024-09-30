<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Manage Courses</title>
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
                        <th>Category</th>
                        <th>Difficulty Level</th>
                        <th>Actions</th>
                    </tr>
                    </thead>
                    <tbody>
                    <c:forEach var="course" items="${courses}">
                        <tr>
                            <td>${course.courseTitle}</td>
                            <td>${course.category}</td>
                            <td>${course.difficultyLevel}</td>
                            <td>
                                <button onclick="deleteCourse('${course.courseId}')" class="btn btn-danger">Delete
                                </button>
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
    function deleteCourse(courseId) {
        if (confirm("Are you sure you want to delete this course ?")) {
            fetch('/api/courses/' + courseId, {
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
                    alert("An error occurred while deleting the course.");
                });
        }
    }
</script>
</body>
</html>

