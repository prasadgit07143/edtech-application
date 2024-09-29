package com.edtech.services;

import com.edtech.models.Blog;
import com.edtech.repositories.BlogRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;
import java.util.Optional;

@Service
public class BlogService {

    @Autowired
    private BlogRepository blogRepository;

    public Blog createBlog(Blog blog) {
        blog.setCreatedAt(LocalDate.now());
        return blogRepository.save(blog);
    }

    public List<Blog> getAllBlogs() {
        return blogRepository.findAll();
    }

    public Optional<Blog> getBlogById(Long id) {
        return blogRepository.findById(id);
    }

    public Blog updateBlog(Long id, Blog blogDetails) {
        Blog blog = blogRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Blog not found with id: " + id));
        if (blogDetails.getUserId() != null)
            blog.setUserId(blogDetails.getUserId());
        if (blogDetails.getBlogTitle() != null)
            blog.setBlogTitle(blogDetails.getBlogTitle());
        if (blogDetails.getBlogContent() != null)
            blog.setBlogContent(blogDetails.getBlogContent());
        if (blogDetails.getBlogTopic() != null)
            blog.setBlogTopic(blogDetails.getBlogTopic());
        return blogRepository.save(blog);
    }

    public void deleteBlog(Long id) {
        blogRepository.deleteById(id);
    }

    public List<Blog> getBlogsByTopic(String blogTopic) {
        return blogRepository.findBlogsByBlogTopic(blogTopic);
    }
}
