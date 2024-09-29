package com.edtech.services;

import com.edtech.models.Comment;
import com.edtech.repositories.CommentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class CommentService {

	@Autowired
	private CommentRepository commentRepository;

	public Comment createComment(Comment comment) {
		return commentRepository.save(comment);
	}

	public List<Comment> getAllComments() {
		return commentRepository.findAll();
	}

	public Optional<Comment> getCommentById(Long commentId) {
		return commentRepository.findById(commentId);
	}

	public Comment updateComment(Long commentId, Comment updatedComment) {
		return commentRepository.findById(commentId).map(comment -> {
			comment.setCommentContent(updatedComment.getCommentContent());
			return commentRepository.save(comment);
		}).orElseThrow(() -> new RuntimeException("Comment not found with id: " + commentId));
	}

	public void deleteComment(Long commentId) {
		commentRepository.deleteById(commentId);
	}

	public List<Comment> getCommentsByDiscussionId(Long discussionId) {
		return commentRepository.findByDiscussionId(discussionId);
	}
}
