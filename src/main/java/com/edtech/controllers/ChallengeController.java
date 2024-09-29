package com.edtech.controllers;

import com.edtech.models.Challenge;
import com.edtech.services.ChallengeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/challenges")
public class ChallengeController {

	@Autowired
	private ChallengeService challengeService;

	@PostMapping
	public ResponseEntity<Challenge> createChallenge(@RequestBody Challenge challenge) {
		Challenge createdChallenge = challengeService.createChallenge(challenge);
		return ResponseEntity.ok(createdChallenge);
	}

	@GetMapping
	public ResponseEntity<List<Challenge>> getAllChallenges() {
		List<Challenge> challenges = challengeService.getAllChallenges();
		return ResponseEntity.ok(challenges);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Challenge> getChallengeById(@PathVariable Long id) {
		Optional<Challenge> challenge = challengeService.getChallengeById(id);
		return challenge.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
	}

	@PutMapping("/{id}")
	public ResponseEntity<Challenge> updateChallenge(@PathVariable Long id, @RequestBody Challenge updatedChallenge) {
		try {
			Challenge challenge = challengeService.updateChallenge(id, updatedChallenge);
			return ResponseEntity.ok(challenge);
		} catch (RuntimeException e) {
			return ResponseEntity.notFound().build();
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteChallenge(@PathVariable Long id) {
		challengeService.deleteChallenge(id);
		return ResponseEntity.noContent().build();
	}
}
