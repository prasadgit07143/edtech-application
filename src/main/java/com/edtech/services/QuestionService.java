package com.edtech.services;

import com.edtech.models.Question;
import com.edtech.repositories.QuestionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class QuestionService {

	@Autowired
	private QuestionRepository questionRepository;

	public Question createQuestion(Question question) {
		return questionRepository.save(question);
	}

	public List<Question> getAllQuestions() {
		return questionRepository.findAll();
	}

	public Optional<Question> getQuestionById(Long questionId) {
		return questionRepository.findById(questionId);
	}

	public Question updateQuestion(Long questionId, Question updatedQuestion) {
		return questionRepository.findById(questionId).map(question -> {
			question.setQuestionText(updatedQuestion.getQuestionText());
			question.setOptions(updatedQuestion.getOptions());
			question.setCorrectOption(updatedQuestion.getCorrectOption());
			return questionRepository.save(question);
		}).orElseThrow(() -> new RuntimeException("Question not found with id: " + questionId));
	}

	public void deleteQuestion(Long questionId) {
		questionRepository.deleteById(questionId);
	}
}
