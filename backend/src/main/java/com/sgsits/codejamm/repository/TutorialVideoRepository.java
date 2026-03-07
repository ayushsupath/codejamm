package com.sgsits.codejamm.repository;

import com.sgsits.codejamm.model.TutorialVideo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repository interface for TutorialVideo entity
 */
@Repository
public interface TutorialVideoRepository extends JpaRepository<TutorialVideo, Long> {

    /**
     * Find tutorial videos by topic ID
     */
    List<TutorialVideo> findByTopicIdAndIsActiveTrueOrderByDisplayOrderAsc(Long topicId);

    /**
     * Find all active tutorial videos
     */
    List<TutorialVideo> findByIsActiveTrueOrderByDisplayOrderAsc();

    /**
     * Find most viewed videos
     */
    List<TutorialVideo> findTop10ByIsActiveTrueOrderByViewCountDesc();
}
