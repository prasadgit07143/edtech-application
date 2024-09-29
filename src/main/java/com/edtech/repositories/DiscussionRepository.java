package com.edtech.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.edtech.models.Discussion;

@Repository
public interface DiscussionRepository extends JpaRepository<Discussion, Long> {

}
