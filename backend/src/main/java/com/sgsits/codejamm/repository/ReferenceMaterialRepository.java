package com.sgsits.codejamm.repository;

import com.sgsits.codejamm.model.ReferenceMaterial;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Repository interface for ReferenceMaterial entity
 */
@Repository
public interface ReferenceMaterialRepository extends JpaRepository<ReferenceMaterial, Long> {

    /**
     * Find reference materials by category ID
     */
    List<ReferenceMaterial> findByCategoryIdAndIsActiveTrueOrderByDisplayOrderAsc(Long categoryId);

    /**
     * Find reference materials by type
     */
    List<ReferenceMaterial> findByMaterialTypeAndIsActiveTrueOrderByDisplayOrderAsc(String materialType);

    /**
     * Find all active reference materials
     */
    List<ReferenceMaterial> findByIsActiveTrueOrderByDisplayOrderAsc();
}
