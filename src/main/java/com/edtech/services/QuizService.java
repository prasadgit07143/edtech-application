package com.edtech.services;

import com.edtech.models.Quiz;
import com.edtech.repositories.QuizRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuizService {

	@Autowired
	private QuizRepository quizRepository;

	public Quiz createQuiz(Quiz quiz) {
		return quizRepository.save(quiz);
	}

	public List<Quiz> getAllQuizzes() {
		return quizRepository.findAll();
	}

	public Optional<Quiz> getQuizById(Long quizId) {
		return quizRepository.findById(quizId);
	}

	public Quiz updateQuiz(Long quizId, Quiz updatedQuiz) {
		return quizRepository.findById(quizId).map(quiz -> {
			quiz.setQuizTitle(updatedQuiz.getQuizTitle());
			quiz.setQuizDescription(updatedQuiz.getQuizDescription());
			quiz.setQuestions(updatedQuiz.getQuestions());
			return quizRepository.save(quiz);
		}).orElseThrow(() -> new RuntimeException("Quiz not found with id: " + quizId));
	}

	public void deleteQuiz(Long quizId) {
		quizRepository.deleteById(quizId);
	}
}
