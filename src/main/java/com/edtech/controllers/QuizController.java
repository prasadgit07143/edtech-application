package com.edtech.controllers;

import com.edtech.models.Quiz;
import com.edtech.services.QuizService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/quizzes")
public class QuizController {

	@Autowired
	private QuizService quizService;

	@PostMapping
	public ResponseEntity<Quiz> createQuiz(@RequestBody Quiz quiz) {
		Quiz createdQuiz = quizService.createQuiz(quiz);
		return ResponseEntity.ok(createdQuiz);
	}

	@GetMapping
	public ResponseEntity<List<Quiz>> getAllQuizzes() {
		List<Quiz> quizzes = quizService.getAllQuizzes();
		return ResponseEntity.ok(quizzes);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Quiz> getQuizById(@PathVariable Long id) {
		Optional<Quiz> quiz = quizService.getQuizById(id);
		return quiz.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
	}

	@PutMapping("/{id}")
	public ResponseEntity<Quiz> updateQuiz(@PathVariable Long id, @RequestBody Quiz updatedQuiz) {
		try {
			Quiz quiz = quizService.updateQuiz(id, updatedQuiz);
			return ResponseEntity.ok(quiz);
		} catch (RuntimeException e) {
			return ResponseEntity.notFound().build();
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteQuiz(@PathVariable Long id) {
		quizService.deleteQuiz(id);
		return ResponseEntity.noContent().build();
	}
}
