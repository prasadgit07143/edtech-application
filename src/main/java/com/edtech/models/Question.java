package com.edtech.models;

import java.util.Set;
import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "question")
public class Question {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long questionId;

	@Column(name = "quizId")
	private Long quizId;

	@Column(nullable = false)
	private String questionText;
	private Set<String> options;
	private String correctOption;
}
