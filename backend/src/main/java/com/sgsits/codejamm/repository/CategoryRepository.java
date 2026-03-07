package com.sgsits.codejamm.repository;

import com.sgsits.codejamm.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

/**
 * Repository interface for Category entity
 */
@Repository
public interface CategoryRepository extends JpaRepository<Category, Long> {

    /**
     * Find category by name
     */
    Optional<Category> findByName(String name);

    /**
     * Find all active categories ordered by display order
     */
    List<Category> findByIsActiveTrueOrderByDisplayOrderAsc();

    /**
     * Check if category exists by name
     */
    boolean existsByName(String name);
}
