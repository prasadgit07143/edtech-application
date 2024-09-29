package com.edtech.services;

import com.edtech.models.Challenge;
import com.edtech.repositories.ChallengeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class ChallengeService {

	@Autowired
	private ChallengeRepository challengeRepository;

	public Challenge createChallenge(Challenge challenge) {
		return challengeRepository.save(challenge);
	}

	public List<Challenge> getAllChallenges() {
		return challengeRepository.findAll();
	}

	public Optional<Challenge> getChallengeById(Long challengeId) {
		return challengeRepository.findById(challengeId);
	}

	public Challenge updateChallenge(Long challengeId, Challenge updatedChallenge) {
		return challengeRepository.findById(challengeId).map(challenge -> {
			challenge.setChallengeTitle(updatedChallenge.getChallengeTitle());
			challenge.setChallengeDescription(updatedChallenge.getChallengeDescription());
			challenge.setDifficultyLevel(updatedChallenge.getDifficultyLevel());
			challenge.setMaxScore(updatedChallenge.getMaxScore());
			challenge.setCodeSolution(updatedChallenge.getCodeSolution());
			challenge.setInputFormat(updatedChallenge.getInputFormat());
			challenge.setSampleInput(updatedChallenge.getSampleInput());
			challenge.setSampleOutput(updatedChallenge.getSampleOutput());
			challenge.setConstraints(updatedChallenge.getConstraints());
			challenge.setTestCases(updatedChallenge.getTestCases());
			return challengeRepository.save(challenge);
		}).orElseThrow(() -> new RuntimeException("Challenge not found with id: " + challengeId));
	}

	public void deleteChallenge(Long challengeId) {
		challengeRepository.deleteById(challengeId);
	}
}
