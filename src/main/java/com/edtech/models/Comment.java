package com.edtech.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "comment")
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long commentId;

    @Column(name = "discussionId")
    private Long discussionId;

    @Column(nullable = false)
    private String commentContent;

    @Column(name = "userId")
    private Long userId;

    @Column(name = "blogId")
    private Long blogId;

    @Transient
    @Column(nullable = false, updatable = false)
    private LocalDate commentDate = LocalDate.now();

    public Comment(String commentContent) {
        this.commentContent = commentContent;
    }
}
