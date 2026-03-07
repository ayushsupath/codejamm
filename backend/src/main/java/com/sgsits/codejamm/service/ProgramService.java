package com.sgsits.codejamm.service;

import com.sgsits.codejamm.model.Program;
import com.sgsits.codejamm.repository.ProgramRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;
import java.util.Optional;

/**
 * Service for Program-related business logic
 */
@Service
@RequiredArgsConstructor
@Transactional
public class ProgramService {

    private final ProgramRepository programRepository;

    /**
     * Get all programs by topic
     */
    public List<Program> getProgramsByTopic(Long topicId) {
        return programRepository.findByTopicIdAndIsActiveTrueOrderByDisplayOrderAsc(topicId);
    }

    /**
     * Get programs by difficulty level
     */
    public List<Program> getProgramsByDifficulty(String difficultyLevel) {
        return programRepository.findByDifficultyLevelAndIsActiveTrueOrderByDisplayOrderAsc(difficultyLevel);
    }

    /**
     * Get programs by topic and difficulty
     */
    public List<Program> getProgramsByTopicAndDifficulty(Long topicId, String difficultyLevel) {
        return programRepository.findByTopicIdAndDifficultyLevelAndIsActiveTrueOrderByDisplayOrderAsc(
            topicId, difficultyLevel);
    }

    /**
     * Get program by ID
     */
    public Optional<Program> getProgramById(Long id) {
        return programRepository.findById(id);
    }

    /**
     * Search programs by keyword
     */
    public List<Program> searchPrograms(String keyword) {
        return programRepository.searchPrograms(keyword);
    }

    /**
     * Get most viewed programs
     */
    public List<Program> getMostViewedPrograms() {
        return programRepository.findTop10ByIsActiveTrueOrderByViewCountDesc();
    }

    /**
     * Get most liked programs
     */
    public List<Program> getMostLikedPrograms() {
        return programRepository.findTop10ByIsActiveTrueOrderByLikesCountDesc();
    }

    /**
     * Create new program
     */
    public Program createProgram(Program program) {
        return programRepository.save(program);
    }

    /**
     * Update program
     */
    public Program updateProgram(Long id, Program programDetails) {
        Program program = programRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Program not found with id: " + id));

        program.setTitle(programDetails.getTitle());
        program.setDescription(programDetails.getDescription());
        program.setCode(programDetails.getCode());
        program.setExplanation(programDetails.getExplanation());
        program.setSampleInput(programDetails.getSampleInput());
        program.setSampleOutput(programDetails.getSampleOutput());
        program.setDifficultyLevel(programDetails.getDifficultyLevel());
        program.setTimeComplexity(programDetails.getTimeComplexity());
        program.setSpaceComplexity(programDetails.getSpaceComplexity());
        program.setDisplayOrder(programDetails.getDisplayOrder());
        program.setIsActive(programDetails.getIsActive());

        return programRepository.save(program);
    }

    /**
     * Delete program (soft delete)
     */
    public void deleteProgram(Long id) {
        Program program = programRepository.findById(id)
            .orElseThrow(() -> new RuntimeException("Program not found with id: " + id));
        program.setIsActive(false);
        programRepository.save(program);
    }

    /**
     * Increment view count
     */
    public void incrementViewCount(Long id) {
        programRepository.incrementViewCount(id);
    }

    /**
     * Increment likes count
     */
    public void incrementLikesCount(Long id) {
        programRepository.incrementLikesCount(id);
    }

    /**
     * Get total programs count
     */
    public long getTotalCount() {
        return programRepository.count();
    }
}
