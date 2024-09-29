package com.edtech.services;

import com.edtech.models.TestCase;
import com.edtech.repositories.TestCaseRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TestCaseService {

	@Autowired
	private TestCaseRepository testCaseRepository;

	public TestCase createTestCase(TestCase testCase) {
		return testCaseRepository.save(testCase);
	}

	public List<TestCase> getAllTestCases() {
		return testCaseRepository.findAll();
	}

	public Optional<TestCase> getTestCaseById(Long testCaseId) {
		return testCaseRepository.findById(testCaseId);
	}

	public TestCase updateTestCase(Long testCaseId, TestCase updatedTestCase) {
		return testCaseRepository.findById(testCaseId).map(testCase -> {
			testCase.setTestCaseInput(updatedTestCase.getTestCaseInput());
			testCase.setTestCaseOutput(updatedTestCase.getTestCaseOutput());
			return testCaseRepository.save(testCase);
		}).orElseThrow(() -> new RuntimeException("Test case not found with id: " + testCaseId));
	}

	public void deleteTestCase(Long testCaseId) {
		testCaseRepository.deleteById(testCaseId);
	}

	public List<TestCase> getTestCasesByChallengeId(Long challengeId) {
		return testCaseRepository.findByChallengeId(challengeId);
	}
}
