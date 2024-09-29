package com.edtech.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edtech.models.Challenge;

@Repository
public interface ChallengeRepository extends JpaRepository<Challenge, Long> {

}
