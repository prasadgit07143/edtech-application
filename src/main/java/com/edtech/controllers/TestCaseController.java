package com.edtech.controllers;

import com.edtech.models.TestCase;
import com.edtech.services.TestCaseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/testcases")
public class TestCaseController {

	@Autowired
	private TestCaseService testCaseService;

	@PostMapping
	public ResponseEntity<TestCase> createTestCase(@RequestBody TestCase testCase) {
		TestCase createdTestCase = testCaseService.createTestCase(testCase);
		return ResponseEntity.ok(createdTestCase);
	}

	@GetMapping
	public ResponseEntity<List<TestCase>> getAllTestCases() {
		List<TestCase> testCases = testCaseService.getAllTestCases();
		return ResponseEntity.ok(testCases);
	}

	@GetMapping("/{id}")
	public ResponseEntity<TestCase> getTestCaseById(@PathVariable Long id) {
		Optional<TestCase> testCase = testCaseService.getTestCaseById(id);
		return testCase.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
	}

	@PutMapping("/{id}")
	public ResponseEntity<TestCase> updateTestCase(@PathVariable Long id, @RequestBody TestCase updatedTestCase) {
		try {
			TestCase testCase = testCaseService.updateTestCase(id, updatedTestCase);
			return ResponseEntity.ok(testCase);
		} catch (RuntimeException e) {
			return ResponseEntity.notFound().build();
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteTestCase(@PathVariable Long id) {
		testCaseService.deleteTestCase(id);
		return ResponseEntity.noContent().build();
	}

	@GetMapping("/challenge/{challengeId}")
	public ResponseEntity<List<TestCase>> getTestCasesByChallengeId(@PathVariable Long challengeId) {
		List<TestCase> testCases = testCaseService.getTestCasesByChallengeId(challengeId);
		return ResponseEntity.ok(testCases);
	}
}
