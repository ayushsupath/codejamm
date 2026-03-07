package com.sgsits.codejamm.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.time.LocalDateTime;

/**
 * TutorialVideo Entity - Stores tutorial video links (YouTube, Vimeo, etc.)
 */
@Entity
@Table(name = "tutorial_videos")
@Data
@NoArgsConstructor
@AllArgsConstructor
public class TutorialVideo {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(nullable = false, length = 200)
    private String title;

    @Column(length = 500)
    private String description;

    @Column(name = "video_url", nullable = false, length = 500)
    private String videoUrl;  // YouTube embed URL or similar

    @Column(name = "thumbnail_url", length = 500)
    private String thumbnailUrl;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "topic_id")
    private Topic topic;

    @Column(name = "duration_minutes")
    private Integer durationMinutes;

    @Column(name = "view_count")
    private Long viewCount = 0L;

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
