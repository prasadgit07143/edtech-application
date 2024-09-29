package com.edtech.models;

import java.util.Set;

import com.fasterxml.jackson.annotation.JsonIgnore;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "quiz")
public class Quiz {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long quizId;

	@Column(nullable = false)
	private String quizTitle;
	private String quizDescription;

	@OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinColumn(name = "quizId", referencedColumnName = "quizId")
	private Set<Question> questions;

	@JsonIgnore
	@OneToOne(mappedBy = "quiz")
	private CourseModule module;
}
