package com.sgsits.codejamm.repository;

import com.sgsits.codejamm.model.Topic;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Topic entity
 */
@Repository
public interface TopicRepository extends JpaRepository<Topic, Long> {

    /**
     * Find topics by category ID
     */
    List<Topic> findByCategoryIdAndIsActiveTrueOrderByDisplayOrderAsc(Long categoryId);

    /**
     * Find topic by name and category ID
     */
    Optional<Topic> findByNameAndCategoryId(String name, Long categoryId);

    /**
     * Find topics by difficulty level
     */
    List<Topic> findByDifficultyLevelAndIsActiveTrueOrderByDisplayOrderAsc(String difficultyLevel);

    /**
     * Find all active topics
     */
    List<Topic> findByIsActiveTrueOrderByDisplayOrderAsc();
}
