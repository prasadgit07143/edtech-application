<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <title>Course</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: "Open Sans", sans-serif;
            min-height: 100vh;
            padding-bottom: 50px;
        }

        .flex {
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .jcc {
            justify-content: center;
        }

        .aic {
            align-items: center;
        }

        .jcfs {
            justify-content: flex-start;
        }

        .jcsb {
            justify-content: space-between;
        }

        .aifs {
            align-items: flex-start;
        }

        .course-content-section {
            margin-top: 60px;
            color: #000000;
        }

        .course-info {
            background-color: #a7f8ff;
            width: 1000px;
            padding: 24px;
            margin: 10px;
            border-radius: 10px;
        }

        .course-info p {
            text-align: justify;
            margin: 7px 0;
            font-size: 18px;
        }

        .course-content-section h1 {
            padding: 40px;
            text-align: center;
            font-size: 36px;
        }

        .module-dropdown {
            border-radius: 7px;
            max-width: 1000px;
            background: #a7f8ff;
            margin: 32px auto;
        }

        .module-dropdown label {
            display: block;
            font-weight: 600;
        }

        .module-dropdown ul {
            list-style-type: none;
            padding-left: 0;
        }

        .module-description {
            padding: 30px;
            font-weight: 500;
            font-size: 17px;
            text-align: justify;
        }

        .course-content-section .module-name {
            padding: 30px;
            background: #06bbcc;
            border-radius: 7px;
            color: white;
            font-size: 1.2em;
            font-variant: small-caps;
            cursor: pointer;
            display: block !important;
        }

        .course-content-section .module-name::after {
            float: right;
            right: 10%;
            content: "+";
        }

        .slide {
            clear: both;
            width: 100%;
            height: 0px;
            overflow-y: scroll;
            transition: height 0.6s ease;
        }

        .slide::-webkit-scrollbar {
            display: none;
        }

        .course-content-section video {
            margin-top: 24px;
            width: 100%;
        }

        .slide li {
            padding: 30px;
        }

        .quiz-link {
            background: #06bbcc;
            color: #ffffff;
            padding: 12px 20px;
            text-decoration: none;
            border-radius: 3px;
            transition: 0.2s linear all;
        }

        .quiz-link:hover {
            background: #00757f;
            color: #ffffff;
        }

        #touch {
            opacity: 0;
            position: absolute;
            height: 0;
        }

        .discussion-section {
            margin: 0 auto;
            max-width: 1000px;
            margin-top: 100px;
        }

        .discussion-content {
            width: 100%;
            border: 2px solid #00757f;
            border-radius: 3px;
            padding: 12px;
            max-height: 500px;
        }

        .discussion-content h2 {
            margin-bottom: 12px;
        }

        .user-comments {
            overflow-y: scroll;
            max-height: 240px;
            background: #c3faff;
            border-radius: 6px;
            padding: 16px;
        }

        .user-comments::-webkit-scrollbar {
            display: none;
        }

        .comment-wrapper {
            padding: 20px 0;
            border-bottom: 1px solid #6e6e6e;
        }

        .comment-wrapper:last-child {
            border-bottom: none;
        }

        .comment {
            text-align: justify;
            margin-top: 7px;
        }

        .username {
            font-size: 16px;
        }

        .comment-date {
            font-size: 14px;
            color: #6e6e6e;
            float: right;
        }

        .input-box {
            width: 100%;
            margin-top: 20px;
        }

        .input-box textarea {
            width: 100%;
            resize: none;
            outline: none;
            border: 2px solid #06bbcc;
            border-radius: 3px;
            padding: 12px;
            font-size: 15px;
            font-family: "Gill Sans", "Gill Sans MT", Calibri, "Trebuchet MS",
            sans-serif;
        }

        .comment-btn {
            border-radius: 2px;
            background: #06bbcc;
            color: #ffffff;
            padding: 12px 20px;
            outline: none;
            border: none;
            cursor: pointer;
            transition: 0.2s linear all;
            margin-top: 6px;
            width: 100%;
            font-size: 16px;
        }

        .comment-btn:hover {
            background: #00757f;
        }
    </style>
</head>
<body>
<jsp:include page="navbar.jsp"/>
<section class="course-content-section">
    <h1>${course.courseTitle}</h1>
    <div class="course-info-wrapper | flex">
        <div class="course-info">
            <p>
                <strong>Description: </strong>${course.courseDescription}
            </p>
            <p><strong>Category: </strong>${course.category}</p>
            <p><strong>Duration: </strong>${course.courseDuration} Hour(s)</p>
            <p><strong>Difficulty Level: </strong>${course.difficultyLevel}</p>
            <p><strong>Enrolled Learners: </strong>${enrolledUsers}</p>
        </div>
    </div>
    <h2 style="margin-left: 130px; margin-top: 50px; font-size: 28px">Modules</h2>
    <c:forEach var="module" items="${course.modules}">
        <div class="module-dropdown">
            <label for="touch"><span class="module-name">${module.moduleTitle}</span></label>
            <input type="checkbox" id="touch"/>
            <ul onclick="dropdown()" class="slide">
                <p class="module-description">${module.moduleDescription}</p>
                <c:forEach var="lesson" items="${module.lessons}">
                    <li>
                        <h2>${lesson.lessonTitle}</h2>
                        <video muted controls preload="metadata">
                            <source
                                    src="${lesson.lessonContent}"
                                    type="video/mp4"
                            />
                            Video not supported.
                        </video>
                    </li>
                </c:forEach>
                <li>
                    <a href="/quiz/${module.quiz.quizId}" target="_blank" class="quiz-link">Go to Quiz</a>
                </li>
            </ul>
        </div>
    </c:forEach>
</section>
<section class="discussion-section | flex aic jcc">
    <div class="discussion-content">
        <h2>Comments</h2>
        <div class="user-comments">
            <c:forEach var="comment" items="${course.discussion.comments}">
                <div class="comment-wrapper">
                    <span class="username"><strong>${userMapper.get(comment.userId)}</strong></span>
                    <span class="comment-date">${comment.commentDate}</span>
                    <p class="comment">${comment.commentContent}</p>
                </div>
            </c:forEach>
        </div>
        <form method="post" action="/comment/${course.courseId}/${course.discussion.discussionId}">
            <div class="input-box">
          <textarea
                  rows="3"
                  name="commentContent"
                  id="comment-text"
                  placeholder="Add your comment"
          ></textarea>
                <input type="submit" value="Comment" class="comment-btn">
            </div>
        </form>
    </div>
</section>
<script>
    function dropdown() {
        const modules = document.querySelectorAll(".module-dropdown");

        modules.forEach((module) => {
            const span = module.querySelector("span");
            const slide = module.querySelector(".slide");

            span.addEventListener("click", () => {
                modules.forEach((otherModule) => {
                    if (otherModule !== module) {
                        const otherSlide = otherModule.querySelector(".slide");
                        const otherSpan = otherModule.querySelector("span");
                        otherSlide.style.height = "0px";
                    }
                });

                if (slide.style.height === "0px" || slide.style.height === "") {
                    slide.style.height = "480px";
                } else {
                    slide.style.height = "0px";
                }
            });
        });
    }

    document.addEventListener("DOMContentLoaded", dropdown);
</script>
</body>
</html>