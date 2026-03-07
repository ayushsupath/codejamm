package com.sgsits.codejamm.controller;

import com.sgsits.codejamm.model.Program;
import com.sgsits.codejamm.service.ProgramService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
 * REST Controller for Program operations
 */
@RestController
@RequestMapping("/api/programs")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class ProgramController {

    private final ProgramService programService;

    /**
     * Get programs by topic ID
     * GET /api/programs/topic/{topicId}
     */
    @GetMapping("/topic/{topicId}")
    public ResponseEntity<List<Program>> getProgramsByTopic(@PathVariable Long topicId) {
        List<Program> programs = programService.getProgramsByTopic(topicId);
        return ResponseEntity.ok(programs);
    }

    /**
     * Get programs by difficulty level
     * GET /api/programs/difficulty/{level}
     */
    @GetMapping("/difficulty/{level}")
    public ResponseEntity<List<Program>> getProgramsByDifficulty(@PathVariable String level) {
        List<Program> programs = programService.getProgramsByDifficulty(level);
        return ResponseEntity.ok(programs);
    }

    /**
     * Get programs by topic and difficulty
     * GET /api/programs/topic/{topicId}/difficulty/{level}
     */
    @GetMapping("/topic/{topicId}/difficulty/{level}")
    public ResponseEntity<List<Program>> getProgramsByTopicAndDifficulty(
            @PathVariable Long topicId, 
            @PathVariable String level) {
        List<Program> programs = programService.getProgramsByTopicAndDifficulty(topicId, level);
        return ResponseEntity.ok(programs);
    }

    /**
     * Get program by ID
     * GET /api/programs/{id}
     */
    @GetMapping("/{id}")
    public ResponseEntity<Program> getProgramById(@PathVariable Long id) {
        return programService.getProgramById(id)
            .map(ResponseEntity::ok)
            .orElse(ResponseEntity.notFound().build());
    }

    /**
     * Search programs by keyword
     * GET /api/programs/search?keyword=...
     */
    @GetMapping("/search")
    public ResponseEntity<List<Program>> searchPrograms(@RequestParam String keyword) {
        List<Program> programs = programService.searchPrograms(keyword);
        return ResponseEntity.ok(programs);
    }

    /**
     * Get most viewed programs
     * GET /api/programs/most-viewed
     */
    @GetMapping("/most-viewed")
    public ResponseEntity<List<Program>> getMostViewedPrograms() {
        List<Program> programs = programService.getMostViewedPrograms();
        return ResponseEntity.ok(programs);
    }

    /**
     * Get most liked programs
     * GET /api/programs/most-liked
     */
    @GetMapping("/most-liked")
    public ResponseEntity<List<Program>> getMostLikedPrograms() {
        List<Program> programs = programService.getMostLikedPrograms();
        return ResponseEntity.ok(programs);
    }

    /**
     * Create new program
     * POST /api/programs
     */
    @PostMapping
    public ResponseEntity<Program> createProgram(@RequestBody Program program) {
        Program created = programService.createProgram(program);
        return ResponseEntity.status(HttpStatus.CREATED).body(created);
    }

    /**
     * Update program
     * PUT /api/programs/{id}
     */
    @PutMapping("/{id}")
    public ResponseEntity<Program> updateProgram(
            @PathVariable Long id, 
            @RequestBody Program program) {
        try {
            Program updated = programService.updateProgram(id, program);
            return ResponseEntity.ok(updated);
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * Delete program (soft delete)
     * DELETE /api/programs/{id}
     */
    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteProgram(@PathVariable Long id) {
        try {
            programService.deleteProgram(id);
            return ResponseEntity.noContent().build();
        } catch (RuntimeException e) {
            return ResponseEntity.notFound().build();
        }
    }

    /**
     * Increment view count
     * POST /api/programs/{id}/view
     */
    @PostMapping("/{id}/view")
    public ResponseEntity<Void> incrementViewCount(@PathVariable Long id) {
        programService.incrementViewCount(id);
        return ResponseEntity.ok().build();
    }

    /**
     * Increment likes count
     * POST /api/programs/{id}/like
     */
    @PostMapping("/{id}/like")
    public ResponseEntity<Void> incrementLikesCount(@PathVariable Long id) {
        programService.incrementLikesCount(id);
        return ResponseEntity.ok().build();
    }

    /**
     * Get total programs count
     * GET /api/programs/count
     */
    @GetMapping("/count")
    public ResponseEntity<Long> getTotalCount() {
        return ResponseEntity.ok(programService.getTotalCount());
    }
}
