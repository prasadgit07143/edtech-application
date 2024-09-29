package com.edtech.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edtech.models.Question;

@Repository
public interface QuestionRepository extends JpaRepository<Question, Long> {

}
