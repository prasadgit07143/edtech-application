package com.edtech.controllers;

import com.edtech.models.*;
import com.edtech.services.*;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.*;
import java.util.stream.Collectors;

@Controller
public class PageController {

    @Autowired
    private UserService userService;

    @Autowired
    private CourseService courseService;

    @Autowired
    private ChallengeService challengeService;

    @Autowired
    private BlogService blogService;

    @Autowired
    private QuizService quizService;

    private Map<String, String> cookieMap = new HashMap<>();

    @Autowired
    private CommentService commentService;

    @Autowired
    private DiscussionService dicussionService;

    // Login, Logout, Register & Home

    @GetMapping({"/", "/home"})
    public String homePage() {
        return "home";
    }

    @GetMapping("/main")
    public ModelAndView mainPage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("learner-home");
        if (request.getCookies() != null) {
            for (Cookie c : request.getCookies())
                if (c.getName().equals("username")) mv.addObject("username", c.getValue());
        }
        return mv;
    }

    @GetMapping("/admin-home")
    public String adminHomePage() {
        return "admin-home";
    }

    @GetMapping("/register")
    public String registerPage() {
        return "learner-register";
    }

    @GetMapping("/login")
    public String loginPage() {
        return "learner-login";
    }

    @GetMapping("/admin-login")
    public String adminLoginPage() {
        return "admin-login";
    }

    @PostMapping("/admin-login")
    public String adminLoginPage(User user) {
        if (userService.findByUsername(user.getUsername()) == null || userService.findByUsername(user.getUsername()).getRole().equals("LEARNER"))
            return "redirect:/admin-login";
        return "redirect:/admin-home";
    }

    @PostMapping("/login")
    public String loginPage(User user, HttpServletResponse response) {
        User loggedInUser = userService.findByUsername(user.getUsername());
        if (loggedInUser == null) return "redirect:/register";
        else if (loggedInUser.getRole().equals("ADMIN") || !loggedInUser.getPassword().equals(user.getPassword()))
            return "redirect:/login";

        Cookie userIdCookie = new Cookie("userId", loggedInUser.getUserId().toString());
        Cookie usernameCookie = new Cookie("username", loggedInUser.getUsername());
        Cookie emailCookie = new Cookie("email", loggedInUser.getEmail());
        Cookie roleCookie = new Cookie("role", loggedInUser.getRole());
        Cookie badgeCookie = new Cookie("badge", loggedInUser.getBadge());

        Cookie[] userCookies = {userIdCookie, usernameCookie, emailCookie, roleCookie, badgeCookie};
        for (Cookie c : userCookies) {
            cookieMap.put(c.getName(), c.getValue());
            c.setPath("/");
            c.setMaxAge(7 * 24 * 60 * 60);
            response.addCookie(c);
        }
        return "redirect:/main";
    }

    @PostMapping("/register")
    public String registerPage(User user) {
        if (userService.findByUsername(user.getUsername()) == null) userService.createUser(user);
        return "redirect:/login";
    }

    @GetMapping("/log-out")
    public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
        cookieMap.clear();
        for (Cookie c : request.getCookies()) {
            c.setValue("");
            c.setMaxAge(0);
            c.setPath("/");
            response.addCookie(c);
        }
        return "redirect:/home";
    }

    // Courses

    @GetMapping("/courses")
    public ModelAndView getCourses() {
        ModelAndView mv = new ModelAndView();
        Map<Long, Integer> enrolledUsersMapper = new HashMap<>();
        mv.setViewName("course-catalog");
        mv.addObject("courses", courseService.getAllCourses());
        List<Course> courseList = courseService.getAllCourses();
        List<String> categories = new ArrayList<>();
        Map<String, Integer> categoryCount = new HashMap<>();
        for (Course course : courseList) {
            categories.add(course.getCategory());
            enrolledUsersMapper.put(course.getCourseId(), course.getUsers().size());
        }
        for (String category : categories)
            categoryCount.merge(category, 1, Integer::sum);
        mv.addObject("categoryCount", categoryCount);
        mv.addObject("enrolledUsersMapper", enrolledUsersMapper);
        return mv;
    }

    @GetMapping("/courses/{courseId}")
    public ModelAndView getCourse(@PathVariable Long courseId, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("course");
        Map<Long, String> userMapper = new HashMap<>();
        userService.getAllUsers().forEach(user -> userMapper.put(user.getUserId(), user.getUsername()));
        mv.addObject("course", courseService.getCourseById(courseId).get());
        for (Cookie c : request.getCookies()) {
            if (c.getName().equals("username")) {
                Course currentCourse = courseService.getCourseById(courseId).get();
                User currentUser = userService.findByUsername(c.getValue());

                Set<User> updatedUsers = currentCourse.getUsers();
                Set<Course> updatedCourses = currentUser.getCourses();
                updatedUsers.add(currentUser);
                updatedCourses.add(currentCourse);
                currentCourse.setUsers(updatedUsers);
                currentUser.setCourses(updatedCourses);

                courseService.createCourse(currentCourse);
                userService.createUser(currentUser);
                break;
            }
        }
        mv.addObject("enrolledUsers", courseService.getCourseById(courseId).get().getUsers().size());
        mv.addObject("userMapper", userMapper);
        return mv;
    }

    @GetMapping("/courses/category/{category}")
    public ModelAndView getCourse(@PathVariable String category) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("course-category-view");
        Map<Long, Integer> enrolledUsersMapper = new HashMap<>();
        List<Course> courseListByCategory = courseService.getCoursesByCategory(category);
        for (Course course : courseListByCategory)
            enrolledUsersMapper.put(course.getCourseId(), course.getUsers().size());
        mv.addObject("courses", courseListByCategory);
        mv.addObject("category", category);
        mv.addObject("n-courses", courseListByCategory.size());
        mv.addObject("enrolledUsersMapper", enrolledUsersMapper);
        return mv;
    }

    @GetMapping("/courses/view/{courseId}")
    public ModelAndView getCourseContent(@PathVariable Long courseId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("course-view");
        mv.addObject("course", courseService.getCourseById(courseId).get());
        return mv;
    }

    @PostMapping("/course/add")
    public ModelAndView setCourseContent(Course course) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("learner-home");
        return mv;
    }

    // Profile

    @GetMapping("/profile")
    public ModelAndView profilePage(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        if (request.getCookies() == null) return new ModelAndView("redirect:/login");
        Map<String, String> mp = new HashMap<>();
        for (Cookie c : request.getCookies())
            mp.put(c.getName(), c.getValue());
        mv.addObject("username", mp.get("username"));
        mv.addObject("email", mp.get("email"));
        mv.addObject("role", mp.get("role"));
        mv.addObject("badge", mp.get("badge"));

        int numBlogs, numChallenges, numCourses;
        numBlogs = userService.findByUsername(mp.get("username")).getBlogs().size();
        numChallenges = userService.findByUsername(mp.get("username")).getChallenges().size();
        numCourses = userService.findByUsername(mp.get("username")).getCourses().size();
        mv.addObject("numBlogs", numBlogs);
        mv.addObject("numChallenges", numChallenges);
        mv.addObject("numCourses", numCourses);
        mv.setViewName("learner-profile");
        return mv;
    }

    // Challenges

    @GetMapping("/challenges")
    public ModelAndView getCodingChallenges_() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("coding-challenges");
        mv.addObject("challenges", challengeService.getAllChallenges());
        return mv;
    }

    @GetMapping("/challenges/{challengeId}")
    public ModelAndView getCodingChallenge_(@PathVariable Long challengeId, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("coding-interface");
        Challenge currentChallenge = challengeService.getChallengeById(challengeId).get();
        mv.addObject("challenge", currentChallenge);
        for (Cookie c : request.getCookies()) {
            currentChallenge.getUsers().forEach(user_ -> {
                if (user_.getUsername().equals(c.getValue())) mv.addObject("status", "Solved");
            });
        }
        return mv;
    }

    @GetMapping("/submitCodeChecker/{challengeId}")
    public String submitCodeChecker(@PathVariable Long challengeId, HttpServletRequest request) {
        try {
            Thread.sleep(5000);
        } catch (Exception e) {

        }
        User currentUser = null;
        Challenge currentChallenge = challengeService.getChallengeById(challengeId).get();
        for (Cookie c : request.getCookies()) {
            if (c.getName().equals("username")) {
                currentUser = userService.findByUsername(c.getValue());
                break;
            }
        }
        currentChallenge.getUsers().add(currentUser);
        currentUser.getChallenges().add(currentChallenge);

        userService.createUser(currentUser);
        challengeService.createChallenge(currentChallenge);
        return "redirect:/challenges/" + challengeId;
    }

    // Blogs

    @GetMapping("/blogs")
    public ModelAndView getBlogs_(HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Map<Long, String> mp = new HashMap<>();
        for (Blog blog : blogService.getAllBlogs())
            mp.put(blog.getBlogId(), userService.getUserById(blog.getUserId()).get().getUsername());
        mv.setViewName("blog-home");
        mv.addObject("blogs", blogService.getAllBlogs());
        mv.addObject("blogAuthors", mp);
        for (Cookie c : request.getCookies()) {
            if (c.getName().equals("userId")) {
                mv.addObject("userId", c.getValue());
                break;
            }
        }
        return mv;
    }

    @GetMapping("/blogs/create")
    public String createBlogPage() {
        return "create-blog";
    }

    @GetMapping("/blogs/topic/{blogTopic}")
    public ModelAndView getBlogsByTopic_(@PathVariable String blogTopic) {
        ModelAndView mv = new ModelAndView();
        Map<Long, String> mp = new HashMap<>();
        for (Blog blog : blogService.getAllBlogs())
            mp.put(blog.getBlogId(), userService.getUserById(blog.getUserId()).get().getUsername());
        mv.addObject("blogAuthors", mp);
        mv.addObject("blogs", blogService.getBlogsByTopic(blogTopic));
        mv.setViewName("blog-home");
        return mv;
    }

    @GetMapping("/blogs/author/{userId}")
    public ModelAndView getBlogsByAuthor_(@PathVariable Long userId, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        Map<Long, String> mp = new HashMap<>();
        for (Blog blog : blogService.getAllBlogs())
            mp.put(blog.getBlogId(), userService.getUserById(blog.getUserId()).get().getUsername());
        Set<Blog> blogs = blogService.getAllBlogs().stream().filter(blog -> blog.getUserId().equals(userId)).collect(Collectors.toSet());
        mv.setViewName("blog-home");
        mv.addObject("blogAuthors", mp);
        mv.addObject("blogs", blogs);
        for (Cookie c : request.getCookies()) {
            if (c.getName().equals("userId")) {
                mv.addObject("userId", c.getValue());
                break;
            }
        }
        return mv;
    }

    @GetMapping("/blogs/{blogId}")
    public ModelAndView getBlog_(@PathVariable Long blogId, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("blog-post");
        mv.addObject("comments", blogService.getBlogById(blogId).get().getComments());
        mv.addObject("blog", blogService.getBlogById(blogId).get());
        mv.addObject("blogs", blogService.getAllBlogs());
        for (Cookie c : request.getCookies()) {
            if (c.getName().equals("username")) {
                mv.addObject("username", c.getValue());
                break;
            }
        }
        Map<Long, String> userMapper = new HashMap<>();
        userService.getAllUsers().forEach(user -> userMapper.put(user.getUserId(), user.getUsername()));
        mv.addObject("userMapper", userMapper);
        return mv;
    }

    @PostMapping("/blog/create")
    public String createBlog_(Blog blog, HttpServletRequest request) {
        blogService.createBlog(blog);
        for (Cookie c : request.getCookies()) {
            if (c.getName().equals("username")) {
                User currentUser = userService.findByUsername(c.getValue());
                currentUser.getBlogs().add(blog);
                userService.createUser(currentUser);
                break;
            }
        }
        return "redirect:/blogs";
    }

    // Discussion and Comments

    @PostMapping("/comment/{courseId}/{discussionId}")
    public String postComment(@PathVariable Long courseId,
                              @PathVariable Long discussionId,
                              Comment comment,
                              HttpServletRequest request) {
        Long userId = null;
        for (Cookie c : request.getCookies()) {
            if (c.getName().equals("userId")) {
                userId = Long.valueOf(c.getValue());
                break;
            }
        }
        if (userId != null) {
            Optional<User> userOptional = userService.getUserById(userId);
            if (userOptional.isPresent()) {
                comment.setUserId(userId);
                comment.setDiscussionId(discussionId);
                commentService.createComment(comment);
            }
        }
        return "redirect:/courses/" + courseId;
    }

    @PostMapping("/comment/{blogId}")
    public String postComment(@PathVariable Long blogId,
                              Comment comment,
                              HttpServletRequest request) {
        Long userId = null;
        for (Cookie c : request.getCookies()) {
            if (c.getName().equals("userId")) {
                userId = Long.valueOf(c.getValue());
                break;
            }
        }
        if (userId != null) {
            Optional<User> userOptional = userService.getUserById(userId);
            if (userOptional.isPresent()) {
                comment.setUserId(userId);
                comment.setBlogId(blogId);
                commentService.createComment(comment);
            }
        }
        return "redirect:/blogs/" + blogId;
    }

    // Quiz

    @GetMapping("/quiz/{quizId}")
    public ModelAndView getQuiz(@PathVariable Long quizId) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("quiz");
        mv.addObject("quiz", quizService.getQuizById(quizId));
        return mv;
    }
}
