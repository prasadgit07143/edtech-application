package com.edtech.models;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.time.LocalDate;
import java.util.HashSet;
import java.util.Set;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "blog")
public class Blog {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long blogId;

    @Column(name = "userId")
    private Long userId;

    @Column(nullable = false, unique = true)
    private String blogTitle;

    @Column(columnDefinition = "TEXT", unique = true)
    private String blogContent;
    private String blogTopic;

    @Transient
    @Column(nullable = false, updatable = false)
    private LocalDate createdAt = LocalDate.now();

    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
    @JoinColumn(name = "blogId", referencedColumnName = "blogId")
    private Set<Comment> comments = new HashSet<>();
}
