package com.edtech.controllers;

import com.edtech.models.CourseModule;
import com.edtech.services.CourseModuleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/modules")
public class CourseModuleController {

	@Autowired
	private CourseModuleService courseModuleService;

	@PostMapping
	public ResponseEntity<CourseModule> createModule(@RequestBody CourseModule module) {
		CourseModule createdModule = courseModuleService.createModule(module);
		return ResponseEntity.ok(createdModule);
	}

	@GetMapping
	public ResponseEntity<List<CourseModule>> getAllModules() {
		List<CourseModule> modules = courseModuleService.getAllModules();
		return ResponseEntity.ok(modules);
	}

	@GetMapping("/{id}")
	public ResponseEntity<CourseModule> getModuleById(@PathVariable Long id) {
		Optional<CourseModule> module = courseModuleService.getModuleById(id);
		return module.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
	}

	@PutMapping("/{id}")
	public ResponseEntity<CourseModule> updateModule(@PathVariable Long id, @RequestBody CourseModule updatedModule) {
		try {
			CourseModule module = courseModuleService.updateModule(id, updatedModule);
			return ResponseEntity.ok(module);
		} catch (RuntimeException e) {
			return ResponseEntity.notFound().build();
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteModule(@PathVariable Long id) {
		courseModuleService.deleteModule(id);
		return ResponseEntity.noContent().build();
	}

	@GetMapping("/course/{courseId}")
	public ResponseEntity<List<CourseModule>> getModulesByCourseId(@PathVariable Long courseId) {
		List<CourseModule> modules = courseModuleService.getModulesByCourseId(courseId);
		return ResponseEntity.ok(modules);
	}
}
