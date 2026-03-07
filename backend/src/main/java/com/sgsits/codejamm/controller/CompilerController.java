package com.sgsits.codejamm.controller;

import com.sgsits.codejamm.service.JavaCompilerService;
import com.sgsits.codejamm.service.JavaCompilerService.CompilationResult;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

/**
 * REST Controller for Java code compilation and execution
 * This is the core API endpoint for the in-browser compiler feature
 */
@RestController
@RequestMapping("/api/compiler")
@RequiredArgsConstructor
@CrossOrigin(origins = "*")
public class CompilerController {

    private final JavaCompilerService compilerService;

    /**
     * Compile and execute Java code
     * POST /api/compiler/execute
     * 
     * Request Body: {
     *   "code": "public class HelloWorld { ... }",
     *   "input": "optional input"
     * }
     * 
     * Response: {
     *   "success": true/false,
     *   "output": "program output",
     *   "error": "error message if any"
     * }
     */
    @PostMapping("/execute")
    public ResponseEntity<CompilationResult> compileAndExecute(@RequestBody Map<String, String> request) {
        String code = request.get("code");
        String input = request.getOrDefault("input", "");

        if (code == null || code.trim().isEmpty()) {
            CompilationResult errorResult = new CompilationResult();
            errorResult.setSuccess(false);
            errorResult.setError("Code cannot be empty");
            return ResponseEntity.badRequest().body(errorResult);
        }

        long startTime = System.currentTimeMillis();
        CompilationResult result = compilerService.compileAndExecute(code, input);
        long executionTime = System.currentTimeMillis() - startTime;
        result.setExecutionTime(executionTime);

        return ResponseEntity.ok(result);
    }

    /**
     * Health check endpoint
     */
    @GetMapping("/health")
    public ResponseEntity<Map<String, String>> health() {
        return ResponseEntity.ok(Map.of(
            "status", "UP",
            "service", "Java Compiler Service",
            "message", "CodeJamm Compiler is running"
        ));
    }
}
