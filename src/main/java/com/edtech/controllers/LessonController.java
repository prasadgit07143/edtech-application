package com.edtech.controllers;

import com.edtech.models.Lesson;
import com.edtech.services.LessonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/lessons")
public class LessonController {

	@Autowired
	private LessonService lessonService;

	@PostMapping
	public ResponseEntity<Lesson> createLesson(@RequestBody Lesson lesson) {
		Lesson createdLesson = lessonService.createLesson(lesson);
		return ResponseEntity.ok(createdLesson);
	}

	@GetMapping
	public ResponseEntity<List<Lesson>> getAllLessons() {
		List<Lesson> lessons = lessonService.getAllLessons();
		return ResponseEntity.ok(lessons);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Lesson> getLessonById(@PathVariable Long id) {
		Optional<Lesson> lesson = lessonService.getLessonById(id);
		return lesson.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
	}

	@PutMapping("/{id}")
	public ResponseEntity<Lesson> updateLesson(@PathVariable Long id, @RequestBody Lesson updatedLesson) {
		try {
			Lesson lesson = lessonService.updateLesson(id, updatedLesson);
			return ResponseEntity.ok(lesson);
		} catch (RuntimeException e) {
			return ResponseEntity.notFound().build();
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteLesson(@PathVariable Long id) {
		lessonService.deleteLesson(id);
		return ResponseEntity.noContent().build();
	}

	@GetMapping("/module/{moduleId}")
	public ResponseEntity<List<Lesson>> getLessonsByModuleId(@PathVariable Long moduleId) {
		List<Lesson> lessons = lessonService.getLessonsByModuleId(moduleId);
		return ResponseEntity.ok(lessons);
	}
}
