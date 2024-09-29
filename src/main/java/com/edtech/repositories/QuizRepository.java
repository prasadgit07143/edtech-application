package com.edtech.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edtech.models.Quiz;

@Repository
public interface QuizRepository extends JpaRepository<Quiz, Long> {

}
