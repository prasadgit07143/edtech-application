package com.edtech.services;

import com.edtech.models.Course;
import com.edtech.repositories.CourseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CourseService {

    @Autowired
    private CourseRepository courseRepository;

    public Course createCourse(Course course) {
        return courseRepository.save(course);
    }

    public Course createCourse(String title, String description, String category, String difficulty, int duration) {
        Course course = new Course(title, description, category, difficulty, duration);
        return courseRepository.save(course);
    }

    public List<Course> getAllCourses() {
        return courseRepository.findAll();
    }

    public Optional<Course> getCourseById(Long courseId) {
        return courseRepository.findById(courseId);
    }

    public Course updateCourse(Long courseId, Course updatedCourse) {
        return courseRepository.findById(courseId).map(course -> {
            course.setCourseTitle(updatedCourse.getCourseTitle());
            course.setCourseDescription(updatedCourse.getCourseDescription());
            course.setCategory(updatedCourse.getCategory());
            course.setDifficultyLevel(updatedCourse.getDifficultyLevel());
            course.setCourseDuration(updatedCourse.getCourseDuration());
            course.setModules(updatedCourse.getModules());
            course.setDiscussion(updatedCourse.getDiscussion());
            return courseRepository.save(course);
        }).orElseThrow(() -> new RuntimeException("Course not found with id: " + courseId));
    }

    public void deleteCourse(Long courseId) {
        courseRepository.deleteById(courseId);
    }

    public List<Course> getCoursesByCategory(String category) {
        return courseRepository.getCourseByCategory(category);
    }
}
