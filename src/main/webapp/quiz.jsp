<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <title>Quiz</title>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Poppins:wght@400;500;700&display=swap");

      body {
        font-family: "Poppins", sans-serif;
        background: #b9b3a9;
        display: flex;
        justify-content: center;
      }

      .container {
        width: 500px;
        padding: 30px;
        margin: 80px 0;
        background-color: #fff;
        box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        border-radius: 20px;
      }

      h1 {
        text-align: center;
      }

      .question {
        font-weight: bold;
        margin-bottom: 10px;
		font-size: 20px;
      }

      .options {
        margin-bottom: 20px;
      }

      .option {
		cursor: pointer;
        display: block;
		border: 2px solid #06BBCC;
		border-radius: 6px;
		padding: 12px 0;
        margin-bottom: 16px;
		padding-left: 12px;
		font-size: 16px;
		transition: 0.2s linear all;
      }
	  
	  .option:hover {
			background: #06BBCC;
			color: #ffffff;
	  }

      .button {
        display: inline-block;
        padding: 12px 24px;
        background-color: #06BBCC;
        color: #fff;
        border: none;
        cursor: pointer;
        font-size: 16px;
        border-radius: 4px;
        transition: background-color 0.3s;
        margin-right: 10px;
      }

      .button:hover {
        background-color: #3071a9;
      }

      .result {
        text-align: center;
        margin-top: 20px;
        font-weight: bold;
      }

      .hide {
        display: none;
      }
    </style>
  </head>
  <body>
    <div class="container">
      <h1>${quiz.quizTitle}</h1>
      <div id="quiz"></div>
      <div id="result" class="result"></div>
      <button id="submit" class="button">Submit</button>
      <button id="retry" class="button hide">Retry</button>
      <button id="showAnswer" class="button hide">Show Answers</button>
    </div>
	<script>
	  let quizData = {};

	  fetch('/api/quizzes/${quiz.quizId}')
	    .then(response => response.json())
	    .then(data => {
	      quizData = data;
	      displayQuestion();
	    })
	    .catch(error => console.error('Error fetching quiz data:', error));

	  const quizContainer = document.getElementById("quiz");
	  const resultContainer = document.getElementById("result");
	  const submitButton = document.getElementById("submit");
	  const retryButton = document.getElementById("retry");
	  const showAnswerButton = document.getElementById("showAnswer");

	  let currentQuestion = 0;
	  let score = 0;
	  let incorrectAnswers = [];

	  function displayQuestion() {
	    if (quizData && quizData.questions && quizData.questions.length > 0) {
	      const questionData = quizData.questions[currentQuestion];

	      const questionElement = document.createElement("div");
	      questionElement.className = "question";
	      questionElement.innerHTML = questionData.questionText;

	      const optionsElement = document.createElement("div");
	      optionsElement.className = "options";

	      questionData.options.forEach((option, index) => {
	        const optionLabel = document.createElement("label");
	        optionLabel.className = "option";

	        const radio = document.createElement("input");
	        radio.type = "radio";
	        radio.name = "quiz";
	        radio.value = option;

	        const optionText = document.createTextNode(option);

	        optionLabel.appendChild(radio);
	        optionLabel.appendChild(optionText);
	        optionsElement.appendChild(optionLabel);
	      });

	      quizContainer.innerHTML = "";
	      quizContainer.appendChild(questionElement);
	      quizContainer.appendChild(optionsElement);
	    } else {
	      quizContainer.innerHTML = "<p>No questions available.</p>";
	    }
	  }

	  function checkAnswer() {
	    const selectedOption = document.querySelector(
	      'input[name="quiz"]:checked'
	    );
	    
	    if (selectedOption) {
	      const selectedAnswer = selectedOption.value;
	      const correctOption = quizData.questions[currentQuestion].correctOption;
		  console.log(selectedAnswer === correctOption);

	      if (selectedAnswer === correctOption) {
	        score++;
	      } else {
	        incorrectAnswers.push({
	          question: quizData.questions[currentQuestion].questionText,
	          incorrectAnswer: selectedAnswer,
	          correctAnswer: correctOption,
	        });
	      }
	      currentQuestion++;

	      if (currentQuestion < quizData.questions.length) {
	        displayQuestion();
	      } else {
	        displayResult();
	      }
	    } else {
	      alert("Please select an answer before proceeding!");
	    }
	  }

	  function displayResult() {
	    quizContainer.style.display = "none";
	    submitButton.style.display = "none";
	    retryButton.style.display = "inline-block";
	    showAnswerButton.style.display = "inline-block";

		console.log(score + " " + quizData.questions.length);
	    resultContainer.innerHTML = "<p>You scored " + score + " out of " + quizData.questions.length + " !</p>";
		console.log(score + " " + quizData.questions.length);

	    if (incorrectAnswers.length > 0) {
	      let incorrectAnswersHtml = "<h2>Incorrect Answers:</h2>";
	      incorrectAnswers.forEach(item => {
	        incorrectAnswersHtml += "<p><strong>Question:</strong>" + item.question + "<br><strong>Your Answer:</strong>" + item.incorrectAnswer + "<br><strong>Correct Answer:</strong>" + item.correctAnswer + "</p>";
	      });
	      resultContainer.innerHTML += incorrectAnswersHtml;
	    }
	  }

	  function retryQuiz() {
	    currentQuestion = 0;
	    score = 0;
	    incorrectAnswers = [];
	    quizContainer.style.display = "block";
	    submitButton.style.display = "inline-block";
	    retryButton.style.display = "none";
	    showAnswerButton.style.display = "none";
	    resultContainer.innerHTML = "";
	    displayQuestion();
	  }

	  function showAnswer() {
	    quizContainer.style.display = "none";
	    submitButton.style.display = "none";
	    retryButton.style.display = "inline-block";
	    showAnswerButton.style.display = "none";

	    let correctAnswersHtml = "<h2>Correct Answers:</h2>";
	    quizData.questions.forEach((question) => {
	      correctAnswersHtml += "<p><strong>Question:</strong>" + question.questionText + "<br><strong>Correct Answer:</strong>" + question.correctOption + "</p>";
	    });

	    resultContainer.innerHTML = correctAnswersHtml;
	  }

	  submitButton.addEventListener("click", checkAnswer);
	  retryButton.addEventListener("click", retryQuiz);
	  showAnswerButton.addEventListener("click", showAnswer);
	</script>
  </body>
</html>
