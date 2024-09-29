package com.edtech.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "course")
public class Course {

    @ManyToMany(mappedBy = "courses")
    @JsonIgnore
    Set<User> users = new HashSet<>();
    @Id
    @SequenceGenerator(name = "course_seq", sequenceName = "course_seq", allocationSize = 1)
    @GeneratedValue(generator = "course_seq", strategy = GenerationType.SEQUENCE)
    private Long courseId;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "courseId", referencedColumnName = "courseId")
    private Set<CourseModule> modules = new HashSet<>();
    @Column(unique = true, nullable = false)
    private String courseTitle;
    private String courseDescription;
    private String category;
    private String difficultyLevel;
    private int courseDuration;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "discussionId", referencedColumnName = "discussionId")
    private Discussion discussion = new Discussion();

    public Course(String courseTitle, String courseDescription, String category, String difficultyLevel, int courseDuration) {
        this.courseTitle = courseTitle;
        this.courseDescription = courseDescription;
        this.category = category;
        this.difficultyLevel = difficultyLevel;
        this.courseDuration = courseDuration;
        this.discussion = new Discussion();
    }
}
