package com.edtech.controllers;

import com.edtech.models.Comment;
import com.edtech.services.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/comments")
public class CommentController {

	@Autowired
	private CommentService commentService;

	@PostMapping
	public ResponseEntity<Comment> createComment(@RequestBody Comment comment) {
		Comment createdComment = commentService.createComment(comment);
		return ResponseEntity.ok(createdComment);
	}

	@GetMapping
	public ResponseEntity<List<Comment>> getAllComments() {
		List<Comment> comments = commentService.getAllComments();
		return ResponseEntity.ok(comments);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Comment> getCommentById(@PathVariable Long id) {
		Optional<Comment> comment = commentService.getCommentById(id);
		return comment.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
	}

	@PutMapping("/{id}")
	public ResponseEntity<Comment> updateComment(@PathVariable Long id, @RequestBody Comment updatedComment) {
		try {
			Comment comment = commentService.updateComment(id, updatedComment);
			return ResponseEntity.ok(comment);
		} catch (RuntimeException e) {
			return ResponseEntity.notFound().build();
		}
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteComment(@PathVariable Long id) {
		commentService.deleteComment(id);
		return ResponseEntity.noContent().build();
	}

	@GetMapping("/discussion/{discussionId}")
	public ResponseEntity<List<Comment>> getCommentsByDiscussionId(@PathVariable Long discussionId) {
		List<Comment> comments = commentService.getCommentsByDiscussionId(discussionId);
		return ResponseEntity.ok(comments);
	}
}
