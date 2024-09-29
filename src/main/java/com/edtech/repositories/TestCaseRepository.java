package com.edtech.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edtech.models.TestCase;

@Repository
public interface TestCaseRepository extends JpaRepository<TestCase, Long> {

	List<TestCase> findByChallengeId(Long challengeId);
}
