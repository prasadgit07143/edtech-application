package com.edtech.services;

import com.edtech.models.Lesson;
import com.edtech.repositories.LessonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class LessonService {

	@Autowired
	private LessonRepository lessonRepository;

	public Lesson createLesson(Lesson lesson) {
		return lessonRepository.save(lesson);
	}

	public List<Lesson> getAllLessons() {
		return lessonRepository.findAll();
	}

	public Optional<Lesson> getLessonById(Long lessonId) {
		return lessonRepository.findById(lessonId);
	}

	public Lesson updateLesson(Long lessonId, Lesson updatedLesson) {
		return lessonRepository.findById(lessonId).map(lesson -> {
			lesson.setLessonTitle(updatedLesson.getLessonTitle());
			lesson.setLessonContent(updatedLesson.getLessonContent());
			return lessonRepository.save(lesson);
		}).orElseThrow(() -> new RuntimeException("Lesson not found with id: " + lessonId));
	}

	public void deleteLesson(Long lessonId) {
		lessonRepository.deleteById(lessonId);
	}

	public List<Lesson> getLessonsByModuleId(Long moduleId) {
		return lessonRepository.findByModuleId(moduleId);
	}
}
