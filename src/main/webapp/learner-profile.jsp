<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Profile</title>
    <link rel="stylesheet"
          href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.6.0/css/all.min.css"
          integrity="sha512-Kc323vGBEqzTmouAECnVceyQqyqdsSiqLQISBL29aUW4U/M7pSPA/gEUZQqv1cwx4OnYxTxve5UMg5GT6L4JJg=="
          crossorigin="anonymous" referrerpolicy="no-referrer"/>
    <link rel="stylesheet"
          href="/resources/styles/learner-profile-style.css"/>
</head>
<body>

<jsp:include page="navbar.jsp"/>
<div class="center">
    <div class="card">
        <div class="additional">
            <div class="user-card">
                <div class="level center">${username}</div>
                <div class="points center">${badge}</div>
                <svg width="110" height="110" viewBox="0 0 250 250"
                     xmlns="http://www.w3.org/2000/svg" role="img"
                     aria-labelledby="title desc" class="center">
                    <title id="title">${role}</title>
                    <style>
                        .skin {
                            fill: #eab38f;
                        }

                        .eyes {
                            fill: #1f1f1f;
                        }

                        .hair {
                            fill: #2f1b0d;
                        }

                        .line {
                            fill: none;
                            stroke: #2f1b0d;
                            stroke-width: 2px;
                        }
                    </style>
                    <defs>
                        <clipPath id="scene">
                            <circle cx="125" cy="125" r="115"/>
                        </clipPath>
                        <clipPath id="lips">
                            <path
                                    d="M 106,132 C 113,127 125,128 125,132 125,128 137,127 144,132 141,142  134,146  125,146  116,146 109,142 106,132 Z"/>
                        </clipPath>
                    </defs>
                    <circle cx="125" cy="125" r="120" fill="rgba(0,0,0,0.15)"/>
                </svg>
            </div>
            <div class="more-info">
                <h1 style="margin-bottom: 12px">${username}</h1>
                <div class="coords">
                    <span>Email: ${email}</span>
                </div>
                <div class="coords">
                    <span>Position/Role: ${role}</span>
                </div>
                <div class="coords">
                    <span>Country: India</span>
                </div>
                <div class="stats">
                    <div>
                        <div class="title">Blogs</div>
                        <i class="fa fa-gamepad"></i>
                        <div class="value">${numBlogs}</div>
                    </div>
                    <div>
                        <div class="title">Problems</div>
                        <i class="fa fa-gamepad"></i>
                        <div class="value">${numChallenges}</div>
                    </div>
                    <div>
                        <div class="title">Courses</div>
                        <i class="fa fa-gamepad"></i>
                        <div class="value">${numCourses}</div>
                    </div>
                </div>
            </div>
        </div>
        <div class="general">
            <h1>${username}</h1>
            <p>Role: ${role}</p>
            <span class="more">Mouse over the card for more info</span>
        </div>
    </div>
</div>
</body>
</html>
