package com.edtech.services;

import com.edtech.models.Discussion;
import com.edtech.repositories.DiscussionRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class DiscussionService {

	@Autowired
	private DiscussionRepository discussionRepository;

	public Discussion createDiscussion(Discussion discussion) {
		return discussionRepository.save(discussion);
	}

	public List<Discussion> getAllDiscussions() {
		return discussionRepository.findAll();
	}

	public Optional<Discussion> getDiscussionById(Long discussionId) {
		return discussionRepository.findById(discussionId);
	}

	public Discussion updateDiscussion(Long discussionId, Discussion updatedDiscussion) {
		return discussionRepository.findById(discussionId).map(discussion -> {
			discussion.setComments(updatedDiscussion.getComments());
			return discussionRepository.save(discussion);
		}).orElseThrow(() -> new RuntimeException("Discussion not found with id: " + discussionId));
	}

	public void deleteDiscussion(Long discussionId) {
		discussionRepository.deleteById(discussionId);
	}
}
