package com.edtech.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
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
@Entity
@Table(name = "discussion")
public class Discussion {

    @Id
    @SequenceGenerator(name = "discussion_seq", sequenceName = "discussion_seq", allocationSize = 1)
    @GeneratedValue(generator = "discussion_seq", strategy = GenerationType.SEQUENCE)
    private Long discussionId;

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "discussionId", referencedColumnName = "discussionId")
    private List<Comment> comments;

    @JsonIgnore
    @OneToOne(mappedBy = "discussion")
    private Course course;
}
