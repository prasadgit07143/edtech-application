package com.edtech.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "challenge")
public class Challenge {
    @ManyToMany(mappedBy = "challenges")
    @JsonIgnore
    List<User> users = new ArrayList<>();
    @Id
    @SequenceGenerator(name = "challenge_seq", sequenceName = "blog_seq", allocationSize = 1)
    @GeneratedValue(generator = "challenge_seq", strategy = GenerationType.SEQUENCE)
    private Long challengeId;
    private String tag;
    @Column(nullable = false)
    private String challengeTitle;
    private String challengeDescription;
    @Column(nullable = false)
    private String difficultyLevel;
    private int maxScore;
    private String codeSolution;
    private String inputFormat;
    private String sampleInput;
    private String sampleOutput;
    @ElementCollection
    private List<String> constraints;
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "challengeId", referencedColumnName = "challengeId")
    private List<TestCase> testCases;
}
