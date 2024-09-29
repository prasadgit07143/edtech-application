package com.edtech.controllers;

import com.edtech.models.Discussion;
import com.edtech.services.DiscussionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/discussions")
public class DiscussionController {

	@Autowired
	private DiscussionService discussionService;

	@PostMapping
	public ResponseEntity<Discussion> createDiscussion(@RequestBody Discussion discussion) {
		Discussion createdDiscussion = discussionService.createDiscussion(discussion);
		return ResponseEntity.ok(createdDiscussion);
	}

	@GetMapping
	public ResponseEntity<List<Discussion>> getAllDiscussions() {
		List<Discussion> discussions = discussionService.getAllDiscussions();
		return ResponseEntity.ok(discussions);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Discussion> getDiscussionById(@PathVariable Long id) {
		Optional<Discussion> discussion = discussionService.getDiscussionById(id);
		return discussion.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
	}

	@PutMapping("/{id}")
	public ResponseEntity<Discussion> updateDiscussion(@PathVariable Long id,
			@RequestBody Discussion updatedDiscussion) {
		try {
			Discussion discussion = discussionService.updateDiscussion(id, updatedDiscussion);
			return ResponseEntity.ok(discussion);
		} catch (RuntimeException e) {
			return ResponseEntity.notFound().build();
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteDiscussion(@PathVariable Long id) {
		discussionService.deleteDiscussion(id);
		return ResponseEntity.noContent().build();
	}
}
