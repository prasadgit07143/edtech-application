package com.edtech.models;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "lesson")
public class Lesson {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long lessonId;

	@Column(name = "moduleId")
	private Long moduleId;

	@Column(nullable = false)
	private String lessonTitle;
	private String lessonContent;
}
