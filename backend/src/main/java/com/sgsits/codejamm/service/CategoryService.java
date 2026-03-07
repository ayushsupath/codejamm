package com.sgsits.codejamm.service;

import com.sgsits.codejamm.model.Category;
import com.sgsits.codejamm.repository.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * Service for Category-related business logic
 */
@Service
@RequiredArgsConstructor
@Transactional
public class CategoryService {

    private final CategoryRepository categoryRepository;

    /**
     * Get all active categories
     */
    public List<Category> getAllActiveCategories() {
        return categoryRepository.findByIsActiveTrueOrderByDisplayOrderAsc();
    }

    /**
     * Get category by ID
     */
    public Optional<Category> getCategoryById(Long id) {
        return categoryRepository.findById(id);
    }

    /**
     * Get category by name
     */
    public Optional<Category> getCategoryByName(String name) {
        return categoryRepository.findByName(name);
    }

    /**
     * Create new category
     */
    public Category createCategory(Category category) {
        if (categoryRepository.existsByName(category.getName())) {
            throw new IllegalArgumentException("Category with name '" + category.getName() + "' already exists");
        }
        return categoryRepository.save(category);
    }

    /**
     * Update category
     */
    public Category updateCategory(Long id, Category categoryDetails) {
        Category category = categoryRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Category not found with id: " + id));

        category.setName(categoryDetails.getName());
        category.setDescription(categoryDetails.getDescription());
        category.setDisplayOrder(categoryDetails.getDisplayOrder());
        category.setIconClass(categoryDetails.getIconClass());
        category.setIsActive(categoryDetails.getIsActive());

        return categoryRepository.save(category);
    }

    /**
     * Delete category (soft delete)
     */
    public void deleteCategory(Long id) {
        Category category = categoryRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Category not found with id: " + id));
        category.setIsActive(false);
        categoryRepository.save(category);
    }

    /**
     * Get total count
     */
    public long getTotalCount() {
        return categoryRepository.count();
    }
}
