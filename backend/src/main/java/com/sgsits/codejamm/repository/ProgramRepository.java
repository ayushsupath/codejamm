package com.sgsits.codejamm.repository;

import com.sgsits.codejamm.model.Program;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repository interface for Program entity
 */
@Repository
public interface ProgramRepository extends JpaRepository<Program, Long> {

    /**
     * Find programs by topic ID
     */
    List<Program> findByTopicIdAndIsActiveTrueOrderByDisplayOrderAsc(Long topicId);

    /**
     * Find programs by difficulty level
     */
    List<Program> findByDifficultyLevelAndIsActiveTrueOrderByDisplayOrderAsc(String difficultyLevel);

    /**
     * Find programs by topic and difficulty
     */
    List<Program> findByTopicIdAndDifficultyLevelAndIsActiveTrueOrderByDisplayOrderAsc(
            Long topicId, String difficultyLevel);

    /**
     * Search programs by title or description
     */
    @Query("SELECT p FROM Program p WHERE (LOWER(p.title) LIKE LOWER(CONCAT('%', :keyword, '%')) " +
           "OR LOWER(p.description) LIKE LOWER(CONCAT('%', :keyword, '%'))) " +
           "AND p.isActive = true ORDER BY p.displayOrder ASC")
    List<Program> searchPrograms(@Param("keyword") String keyword);

    /**
     * Get most viewed programs
     */
    List<Program> findTop10ByIsActiveTrueOrderByViewCountDesc();

    /**
     * Get most liked programs
     */
    List<Program> findTop10ByIsActiveTrueOrderByLikesCountDesc();

    /**
     * Increment view count
     */
    @Modifying
    @Query("UPDATE Program p SET p.viewCount = p.viewCount + 1 WHERE p.id = :programId")
    void incrementViewCount(@Param("programId") Long programId);

    /**
     * Increment likes count
     */
    @Modifying
    @Query("UPDATE Program p SET p.likesCount = p.likesCount + 1 WHERE p.id = :programId")
    void incrementLikesCount(@Param("programId") Long programId);
}
