package com.edtech.controllers;

import com.edtech.models.Blog;
import com.edtech.models.Challenge;
import com.edtech.models.Course;
import com.edtech.services.BlogService;
import com.edtech.services.ChallengeService;
import com.edtech.services.CourseService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class AdminController {

    @Autowired
    private ChallengeService challengeService;

    @Autowired
    private BlogService blogService;

    @Autowired
    private CourseService courseService;

    // Challenges

    @GetMapping("/admin/add/challenge")
    public String challenge() {
        return "admin-add-challenge";
    }

    @PostMapping("/admin/add/challenge")
    public String showAddChallengeForm(Challenge challenge) {
        challengeService.createChallenge(challenge);
        return "redirect:/admin-home";
    }

    @GetMapping("/admin/delete/challenge")
    public ModelAndView viewAllChallenges() {
        ModelAndView mv = new ModelAndView("admin-delete-challenge");
        mv.addObject("challenges", challengeService.getAllChallenges());
        return mv;
    }

    @DeleteMapping("/admin/delete/challenge/{challengeId}")
    public String deleteChallenge(@PathVariable Long challengeId) {
        challengeService.deleteChallenge(challengeId);
        return "redirect:/admin-home";
    }

    // Blogs

    @GetMapping("/admin/add/blog")
    public String blogs() {
        return "admin-add-blog";
    }

    @PostMapping("/admin/add/blog")
    public String showAddBlogForm(Blog blog) {
        blogService.createBlog(blog);
        return "redirect:/admin-home";
    }

    @GetMapping("/admin/delete/blog")
    public ModelAndView viewAllBlogs() {
        ModelAndView mv = new ModelAndView("admin-delete-blog");
        mv.addObject("blogs", blogService.getAllBlogs());
        return mv;
    }

    @DeleteMapping("/admin/delete/blog/{blogId}")
    public String deleteBlog(@PathVariable Long blogId) {
        blogService.deleteBlog(blogId);
        return "redirect:/admin-home";
    }

    // Courses

    @GetMapping("/admin/add/course")
    public String courses() {
        return "admin-add-course";
    }

    @PostMapping("/admin/add/course")
    public String showAddCourseForm(Course course) {
        courseService.createCourse(course);
        return "redirect:/admin-home";
    }

    @GetMapping("/admin/delete/course")
    public ModelAndView viewAllCourses() {
        ModelAndView mv = new ModelAndView("admin-delete-course");
        mv.addObject("courses", courseService.getAllCourses());
        return mv;
    }

    @DeleteMapping("/admin/delete/course/{courseId}")
    public String deleteCourse(@PathVariable Long courseId) {
        courseService.deleteCourse(courseId);
        return "redirect:/admin-home";
    }
}
