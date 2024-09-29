package com.edtech.models;

import jakarta.persistence.*;
import lombok.*;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "testcase")
public class TestCase {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long testCaseId;

	@Column(name = "challengeId")
	private Long challengeId;
	private String testCaseInput;
	private String testCaseOutput;
}
