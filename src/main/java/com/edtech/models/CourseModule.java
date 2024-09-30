package com.edtech.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity(name = "module")
@Table(name = "module")
public class CourseModule {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long moduleId;

    @Column(name = "courseId")
    private Long courseId;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "moduleId", referencedColumnName = "moduleId")
    private List<Lesson> lessons;

    private String moduleTitle;
    private String moduleDescription;

    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "quizId", referencedColumnName = "quizId")
    private Quiz quiz = new Quiz();

    public CourseModule(Long courseId, List<Lesson> lessons, String moduleTitle, String moduleDescription) {
        this.courseId = courseId;
        this.lessons = lessons;
        this.moduleTitle = moduleTitle;
        this.moduleDescription = moduleDescription;
        this.quiz = new Quiz();
    }

    public CourseModule(String moduleTitle, String moduleDescription) {
        this.moduleTitle = moduleTitle;
        this.moduleDescription = moduleDescription;
        this.quiz = new Quiz();
    }
}
