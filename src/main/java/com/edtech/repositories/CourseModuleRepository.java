package com.edtech.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edtech.models.CourseModule;

@Repository
public interface CourseModuleRepository extends JpaRepository<CourseModule, Long> {

	List<CourseModule> findByCourseId(Long courseId);

}
