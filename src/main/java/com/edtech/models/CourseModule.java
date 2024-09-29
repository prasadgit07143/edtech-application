package com.edtech.models;

import java.util.List;
import jakarta.persistence.*;
import lombok.*;

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
	private Quiz quiz;
}
