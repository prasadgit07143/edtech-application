<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Course</title>
    <script>
        function addModule() {
            const moduleContainer = document.getElementById("module-container");
            const moduleCount = moduleContainer.getElementsByTagName("fieldset").length;

            let fieldset = document.createElement("fieldset");
            fieldset.setAttribute("id", "module-" + moduleCount);
            fieldset.innerHTML = `
                <legend>Module ${moduleCount + 1}</legend>
                <label for="modules[${moduleCount}].moduleTitle">Module Title:</label>
                <input type="text" name="modules[${moduleCount}].moduleTitle" required="true"/>
                <br><br>
                <label for="modules[${moduleCount}].moduleDescription">Module Description:</label>
                <textarea name="modules[${moduleCount}].moduleDescription" rows="2" required="true"></textarea>
                <br><br>

                <!-- Lessons inside the module -->
                <div class="lesson-container" id="lesson-container-${moduleCount}">
                    <h4>Lessons</h4>
                    <div>
                        <label for="modules[${moduleCount}].lessons[0].lessonTitle">Lesson Title:</label>
                        <input type="text" name="modules[${moduleCount}].lessons[0].lessonTitle" required="true"/>
                        <br><br>
                        <label for="modules[${moduleCount}].lessons[0].lessonContent">Lesson Content:</label>
                        <textarea name="modules[${moduleCount}].lessons[0].lessonContent" rows="3" required="true"></textarea>
                        <br><br>
                    </div>
                </div>
                <button type="button" onclick="addLesson(${moduleCount})">Add Lesson</button>
                <br><br>
            `;

            moduleContainer.appendChild(fieldset);
        }

        function addLesson(moduleIndex) {
            const lessonContainer = document.getElementById("lesson-container-" + moduleIndex);
            const lessonCount = lessonContainer.getElementsByTagName("div").length;

            let lessonDiv = document.createElement("div");
            lessonDiv.innerHTML = `
                <label for="modules[${moduleIndex}].lessons[${lessonCount}].lessonTitle">Lesson Title:</label>
                <input type="text" name="modules[${moduleIndex}].lessons[${lessonCount}].lessonTitle" required="true"/>
                <br><br>
                <label for="modules[${moduleIndex}].lessons[${lessonCount}].lessonContent">Lesson Content:</label>
                <textarea name="modules[${moduleIndex}].lessons[${lessonCount}].lessonContent" rows="3" required="true"></textarea>
                <br><br>
            `;

            lessonContainer.appendChild(lessonDiv);
        }
    </script>
</head>
<body>

<h2>Add New Course</h2>

<form:form action="/admin/add/course" method="post" modelAttribute="course">

    <label for="courseTitle">Course Title:</label>
    <form:input path="courseTitle" id="courseTitle" type="text" required="true"/>
    <br><br>

    <label for="courseDescription">Course Description:</label>
    <form:textarea path="courseDescription" id="courseDescription" rows="3" required="true"></form:textarea>
    <br><br>

    <label for="category">Category:</label>
    <form:input path="category" id="category" type="text" required="true"/>
    <br><br>

    <label for="difficultyLevel">Difficulty Level:</label>
    <form:select path="difficultyLevel" id="difficultyLevel">
        <form:option value="Beginner">Beginner</form:option>
        <form:option value="Intermediate">Intermediate</form:option>
        <form:option value="Advanced">Advanced</form:option>
    </form:select>
    <br><br>

    <label for="courseDuration">Course Duration (hours):</label>
    <form:input path="courseDuration" id="courseDuration" type="number" min="1" required="true"/>
    <br><br>

    <div id="module-container">
        <h3>Modules</h3>
        <fieldset id="module-0">
            <legend>Module 1</legend>
            <label for="modules[0].moduleTitle">Module Title:</label>
            <input type="text" name="modules[0].moduleTitle">
            <br><br>
            <label for="modules[0].moduleDescription">Module Description:</label>
            <textarea name="modules[0].moduleDescription" rows="2"></textarea>
            <br><br>

            <div class="lesson-container" id="lesson-container-0">
                <h4>Lessons</h4>
                <div>
                    <label for="modules[0].lessons[0].lessonTitle">Lesson Title:</label>
                    <input type="text" name="modules[0].lessons[0].lessonTitle" required="true"/>
                    <br><br>
                    <label for="modules[0].lessons[0].lessonContent">Lesson Content:</label>
                    <textarea name="modules[0].lessons[0].lessonContent" rows="3" required="true"></textarea>
                    <br><br>
                </div>
            </div>
            <button type="button" onclick="addLesson(0)">Add Lesson</button>
            <br><br>
        </fieldset>
    </div>
    <button type="button" onclick="addModule()">Add Module</button>
    <br><br>

    <input type="submit" value="Add Course"/>
</form:form>

</body>
</html>
