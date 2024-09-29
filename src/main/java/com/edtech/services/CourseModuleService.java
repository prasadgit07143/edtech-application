package com.edtech.services;

import com.edtech.models.CourseModule;
import com.edtech.repositories.CourseModuleRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CourseModuleService {

	@Autowired
	private CourseModuleRepository courseModuleRepository;

	public CourseModule createModule(CourseModule module) {
		return courseModuleRepository.save(module);
	}

	public List<CourseModule> getAllModules() {
		return courseModuleRepository.findAll();
	}

	public Optional<CourseModule> getModuleById(Long moduleId) {
		return courseModuleRepository.findById(moduleId);
	}

	public CourseModule updateModule(Long moduleId, CourseModule updatedModule) {
		return courseModuleRepository.findById(moduleId).map(module -> {
			module.setModuleTitle(updatedModule.getModuleTitle());
			module.setModuleDescription(updatedModule.getModuleDescription());
			module.setLessons(updatedModule.getLessons());
			module.setQuiz(updatedModule.getQuiz());
			return courseModuleRepository.save(module);
		}).orElseThrow(() -> new RuntimeException("Module not found with id: " + moduleId));
	}

	public void deleteModule(Long moduleId) {
		courseModuleRepository.deleteById(moduleId);
	}

	public List<CourseModule> getModulesByCourseId(Long courseId) {
		return courseModuleRepository.findByCourseId(courseId);
	}
}
