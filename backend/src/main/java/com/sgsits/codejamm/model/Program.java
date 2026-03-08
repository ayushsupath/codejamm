package com.sgsits.codejamm.model;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * Program Entity - Represents individual Java programs with code, explanation,
 * and metadata
 */
@Entity
@Table(name = "programs")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class Program {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(length = 1000)
    private String description;

    @Column(columnDefinition = "TEXT", nullable = false)
    private String code; // The actual Java code

    @Column(columnDefinition = "TEXT")
    private String explanation; // Detailed explanation of the program

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "topic_id", nullable = false)
    @JsonIgnore
    private Topic topic;

    @Column(name = "sample_input", columnDefinition = "TEXT")
    private String sampleInput; // Example input for the program

    @Column(name = "sample_output", columnDefinition = "TEXT")
    private String sampleOutput; // Expected output



    @Column(name = "difficulty_level", length = 20)
    private String difficultyLevel; // EASY, MODERATE, ADVANCED

    @Column(name = "time_complexity", length = 50)
    private String timeComplexity; // e.g., O(n), O(n^2)

    @Column(name = "space_complexity", length = 50)
    private String spaceComplexity; // e.g., O(1), O(n)

    @Column(name = "view_count")
    private Long viewCount = 0L;

    @Column(name = "likes_count")
    private Long likesCount = 0L;

    @Column(name = "display_order")
    private Integer displayOrder;

    @Column(name = "is_active")
    private Boolean isActive = true;

    @Column(name = "created_at", updatable = false)
    private LocalDateTime createdAt;

    @Column(name = "updated_at")
    private LocalDateTime updatedAt;

    @PrePersist
    protected void onCreate() {
        createdAt = LocalDateTime.now();
        updatedAt = LocalDateTime.now();
    }

    @PreUpdate
    protected void onUpdate() {
        updatedAt = LocalDateTime.now();
    }
}
