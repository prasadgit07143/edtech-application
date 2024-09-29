package com.edtech.controllers;

import com.edtech.models.Blog;
import com.edtech.services.BlogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Optional;

@RestController
@RequestMapping("/api/blogs")
public class BlogController {

	@Autowired
	private BlogService blogService;

	@PostMapping
	public ResponseEntity<Blog> createBlog(@RequestBody Blog blog) {
		Blog createdBlog = blogService.createBlog(blog);
		return ResponseEntity.ok(createdBlog);
	}

	@GetMapping
	public ResponseEntity<List<Blog>> getAllBlogs() {
		List<Blog> blogs = blogService.getAllBlogs();
		return ResponseEntity.ok(blogs);
	}

	@GetMapping("/{id}")
	public ResponseEntity<Blog> getBlogById(@PathVariable Long id) {
		Optional<Blog> blog = blogService.getBlogById(id);
		return blog.map(ResponseEntity::ok).orElseGet(() -> ResponseEntity.notFound().build());
	}

	@PutMapping("/{id}")
	public ResponseEntity<Blog> updateBlog(@PathVariable Long id, @RequestBody Blog blogDetails) {
		Blog updatedBlog = blogService.updateBlog(id, blogDetails);
		return ResponseEntity.ok(updatedBlog);
	}

	@DeleteMapping("/{id}")
	public ResponseEntity<Void> deleteBlog(@PathVariable Long id) {
		blogService.deleteBlog(id);
		return ResponseEntity.noContent().build();
	}
}
