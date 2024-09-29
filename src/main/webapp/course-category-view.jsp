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
</head>

<body>
<jsp:include page="navbar.jsp"/>
<!-- Header Start -->
<div class="container-fluid bg-primary py-5 mb-5 page-header">
    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-10 text-center">
                <h1 class="display-3 text-white animated slideInDown">Courses</h1>
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb justify-content-center">
                        <li class="breadcrumb-item">
                            <a class="text-white" href="/learner-home">Home</a>
                        </li>
                        <li
                                class="breadcrumb-item text-white active"
                                aria-current="page"
                        >
                            <a class="text-white" href="#">Courses</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-white" href="/challenges">Problems</a>
                        </li>
                        <li class="breadcrumb-item">
                            <a class="text-white" href="/learner-profile">Profile</a>
                        </li>
                    </ol>
                </nav>
            </div>
        </div>
    </div>
</div>
<!-- Header End -->

<!-- Courses Start -->
<div class="container-xxl py-5">
    <div class="container">
        <div class="text-center wow fadeInUp" data-wow-delay="0.1s">
            <h6 class="section-title bg-white text-center text-primary px-3">
                Courses
            </h6>
            <h1 class="mb-5">Popular Courses in ${category}</h1>
        </div>
        <div class="row g-4 justify-content-center">
            <c:forEach var="course" items="${courses}">
                <div class="col-lg-4 col-md-6 wow fadeInUp" data-wow-delay="0.1s">
                    <div class="course-item bg-light">
                        <div class="position-relative overflow-hidden">
                            <img class="img-fluid" src="/resources/img/course-1.jpg" alt="${course.courseTitle}"/>
                            <div
                                    class="w-100 d-flex justify-content-center position-absolute bottom-0 start-0 mb-4"
                            >
                                <a
                                        href="/courses/${course.courseId}"
                                        class="flex-shrink-0 btn btn-sm btn-primary px-3 border-end"
                                        style="border-radius: 30px 0 0 30px"
                                >View</a>
                                <a
                                        href="/courses/view/${course.courseId}"
                                        class="flex-shrink-0 btn btn-sm btn-primary px-3"
                                        style="border-radius: 0 30px 30px 0"
                                >Enroll Now</a>
                            </div>
                        </div>
                        <div class="text-center p-4 pb-0">
                            <h3 class="mb-0">Free</h3>
                            <div class="mb-3">
                                <c:forEach var="star" begin="0" end="4">
                                    <small class="fa fa-star text-primary"></small>
                                </c:forEach>
                                <small>(123)</small>
                            </div>
                            <h5 class="mb-4">
                                    ${course.courseTitle}
                            </h5>
                        </div>
                        <div class="d-flex border-top">
                            <small class="flex-fill text-center border-end py-2"
                            ><i class="fa fa-user-tie text-primary me-2"></i>${course.difficultyLevel}</small
                            >
                            <small class="flex-fill text-center border-end py-2"
                            ><i class="fa fa-clock text-primary me-2"></i>${course.courseDuration} Hrs</small
                            >
                            <small class="flex-fill text-center py-2"
                            ><i class="fa fa-user text-primary me-2"></i>${enrolledUsersMapper.get(course.getCourseId())}
                            </small
                            >
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- Courses End -->

<!-- Footer Start -->
<div
        class="container-fluid bg-dark text-light footer pt-5 mt-5 wow fadeIn"
        data-wow-delay="0.1s"
>
    <div class="container py-5">
        <div class="row g-5">
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-3">Quick Link</h4>
                <a class="btn btn-link" href="">Privacy Policy</a>
                <a class="btn btn-link" href="">Terms & Condition</a>
                <a class="btn btn-link" href="">FAQs & Help</a>
            </div>
            <div class="col-lg-3 col-md-6">
                <h4 class="text-white mb-3">Contact</h4>
                <p class="mb-2">
                    <i class="fa fa-map-marker-alt me-3"></i>Vijayawada, India
                </p>
                <p class="mb-2">
                    <i class="fa fa-phone-alt me-3"></i>+91 70970 XXXXX
                </p>
                <p class="mb-2">
                    <i class="fa fa-envelope me-3"></i>info@dummytech.com
                </p>
                <div class="d-flex pt-2">
                    <a class="btn btn-outline-light btn-social" href=""
                    ><i class="fab fa-twitter"></i
                    ></a>
                    <a class="btn btn-outline-light btn-social" href=""
                    ><i class="fab fa-facebook-f"></i
                    ></a>
                    <a class="btn btn-outline-light btn-social" href=""
                    ><i class="fab fa-youtube"></i
                    ></a>
                    <a class="btn btn-outline-light btn-social" href=""
                    ><i class="fab fa-linkedin-in"></i
                    ></a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="copyright">
            <div class="row">
                <div class="col-md-6 text-center text-md-start mb-3 mb-md-0">
                    &copy; <a class="border-bottom" href="#">DummyTech</a>, All Right
                    Reserved.
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <div class="footer-menu">
                        <a href="/main">Home</a>
                        <a href="">Cookies</a>
                        <a href="">Help</a>
                        <a href="">FQAs</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Footer End -->

<!-- Back to Top -->
<a href="#" class="btn btn-lg btn-primary btn-lg-square back-to-top"
><i class="bi bi-arrow-up"></i
></a>
</body>
</html>