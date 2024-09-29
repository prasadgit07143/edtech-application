<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Submit Course</title>
	<script>
	    function addModule() {
	        const modulesContainer = document.getElementById('modules');
	        const moduleIndex = modulesContainer.children.length;

	        const moduleDiv = document.createElement('div');
	        moduleDiv.innerHTML = `
	            <h3>Module ${moduleIndex + 1}</h3>
	            <label for="moduleTitle">Module Title:</label><br>
	            <input type="text" name="modules[${moduleIndex}].moduleTitle" required /><br><br>

	            <label for="moduleDescription">Module Description:</label><br>
	            <textarea name="modules[${moduleIndex}].moduleDescription" required></textarea><br><br>

	            <label for="lessons">Lessons:</label><br>
	            <div id="lessons${moduleIndex}">
	                <input type="text" name="modules[${moduleIndex}].lessons[0].lessonTitle" placeholder="Lesson Title" required />
	                <input type="text" name="modules[${moduleIndex}].lessons[0].lessonUrl" placeholder="Lesson URL" required /><br><br>
	            </div>
	            <button type="button" onclick="addLesson(${moduleIndex})">Add Lesson</button>
	        `;
	        modulesContainer.appendChild(moduleDiv);
	    }

	    function addLesson(moduleIndex) {
	        const lessonsContainer = document.getElementById(`lessons${moduleIndex}`);
	        const lessonIndex = lessonsContainer.children.length / 2; // Each lesson has 2 inputs

	        const lessonDiv = document.createElement('div');
	        lessonDiv.innerHTML = `
	            <input type="text" name="modules[${moduleIndex}].lessons[${lessonIndex}].lessonTitle" placeholder="Lesson Title" required />
	            <input type="text" name="modules[${moduleIndex}].lessons[${lessonIndex}].lessonUrl" placeholder="Lesson URL" required /><br><br>
	        `;
	        lessonsContainer.appendChild(lessonDiv);
	    }
	</script>


</head>
<body>
    <h1>Submit Course</h1>
    <form method="post" action="/course/add">
        <label for="courseTitle">Course Title:</label><br>
        <input type="text" name="courseTitle" required /><br><br>

        <label for="courseDescription">Course Description:</label><br>
        <textarea name="courseDescription" required></textarea><br><br>

        <label for="category">Category:</label><br>
        <input type="text" name="category" required /><br><br>

        <label for="difficultyLevel">Difficulty Level:</label><br>
        <input type="text" name="difficultyLevel" required /><br><br>

        <label for="courseDuration">Course Duration (in hours):</label><br>
        <input type="number" name="courseDuration" required /><br><br>

        <label for="enrolledStudents">Number of Enrolled Students:</label><br>
        <input type="number" name="enrolledStudents" required /><br><br>

        <div id="modules">
            <h2>Modules</h2>
            <button type="button" onclick="addModule()">Add Module</button>
        </div>

        <input type="submit" value="Submit Course" />
    </form>
</body>
</html>
