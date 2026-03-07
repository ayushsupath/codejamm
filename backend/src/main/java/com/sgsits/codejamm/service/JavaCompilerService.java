package com.sgsits.codejamm.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import javax.tools.*;
import java.io.*;
import java.lang.reflect.Method;
import java.net.URL;
import java.net.URLClassLoader;
import java.nio.file.*;
import java.util.*;
import java.util.concurrent.*;

/**
 * Java Compiler Service - Compiles and executes Java code submitted by users
 * This is the core feature of CodeJamm platform
 */
@Service
public class JavaCompilerService {

    @Value("${compiler.temp.directory:/tmp/codejamm}")
    private String tempDirectory;

    @Value("${compiler.execution.timeout:5000}")
    private long executionTimeout;

    /**
     * Compile and execute Java code
     * 
     * @param code The Java source code
     * @param input Optional input for the program
     * @return CompilationResult containing output, errors, or compilation errors
     */
    public CompilationResult compileAndExecute(String code, String input) {
        CompilationResult result = new CompilationResult();
        String className = extractClassName(code);
        
        if (className == null) {
            result.setSuccess(false);
            result.setError("Could not find a valid public class in the code");
            return result;
        }

        // Create unique directory for this execution
        Path workingDir = createWorkingDirectory();
        if (workingDir == null) {
            result.setSuccess(false);
            result.setError("Failed to create working directory");
            return result;
        }

        try {
            // Write source code to file
            Path sourceFile = workingDir.resolve(className + ".java");
            Files.writeString(sourceFile, code);

            // Compile the code
            JavaCompiler compiler = ToolProvider.getSystemJavaCompiler();
            if (compiler == null) {
                result.setSuccess(false);
                result.setError("Java compiler not available. Please ensure JDK is installed.");
                return result;
            }

            DiagnosticCollector<JavaFileObject> diagnostics = new DiagnosticCollector<>();
            StandardJavaFileManager fileManager = compiler.getStandardFileManager(diagnostics, null, null);
            
            Iterable<? extends JavaFileObject> compilationUnits = 
                fileManager.getJavaFileObjectsFromFiles(Arrays.asList(sourceFile.toFile()));
            
            JavaCompiler.CompilationTask task = compiler.getTask(
                null, fileManager, diagnostics, null, null, compilationUnits);

            boolean compilationSuccess = task.call();
            fileManager.close();

            if (!compilationSuccess) {
                // Compilation failed - collect error messages
                StringBuilder errors = new StringBuilder("Compilation Errors:\n");
                for (Diagnostic<? extends JavaFileObject> diagnostic : diagnostics.getDiagnostics()) {
                    errors.append("Line ").append(diagnostic.getLineNumber())
                          .append(": ").append(diagnostic.getMessage(null))
                          .append("\n");
                }
                result.setSuccess(false);
                result.setError(errors.toString());
                return result;
            }

            // Execute the compiled class
            String output = executeClass(workingDir, className, input);
            result.setSuccess(true);
            result.setOutput(output);

        } catch (Exception e) {
            result.setSuccess(false);
            result.setError("Execution Error: " + e.getMessage());
        } finally {
            // Clean up - delete working directory
            cleanupDirectory(workingDir);
        }

        return result;
    }

    /**
     * Extract class name from Java code
     */
    private String extractClassName(String code) {
        String[] lines = code.split("\n");
        for (String line : lines) {
            line = line.trim();
            if (line.startsWith("public class ")) {
                String[] parts = line.split("\\s+");
                for (int i = 0; i < parts.length - 1; i++) {
                    if (parts[i].equals("class")) {
                        String className = parts[i + 1];
                        // Remove anything after { or implements or extends
                        className = className.split("[{]")[0].trim();
                        className = className.split("implements")[0].trim();
                        className = className.split("extends")[0].trim();
                        return className;
                    }
                }
            }
        }
        return null;
    }

    /**
     * Create a unique working directory for compilation
     */
    private Path createWorkingDirectory() {
        try {
            Path baseDir = Paths.get(tempDirectory);
            if (!Files.exists(baseDir)) {
                Files.createDirectories(baseDir);
            }
            return Files.createTempDirectory(baseDir, "compile_");
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Execute the compiled Java class
     */
    private String executeClass(Path workingDir, String className, String input) throws Exception {
        // Create a custom class loader
        URLClassLoader classLoader = URLClassLoader.newInstance(
            new URL[] { workingDir.toUri().toURL() });

        // Load the class
        Class<?> cls = Class.forName(className, true, classLoader);
        
        // Find main method
        Method mainMethod = cls.getDeclaredMethod("main", String[].class);
        
        // Capture System.out
        ByteArrayOutputStream baos = new ByteArrayOutputStream();
        PrintStream ps = new PrintStream(baos);
        PrintStream oldOut = System.out;
        
        // Set input if provided
        InputStream oldIn = System.in;
        if (input != null && !input.isEmpty()) {
            System.setIn(new ByteArrayInputStream(input.getBytes()));
        }

        ExecutorService executor = Executors.newSingleThreadExecutor();
        Future<String> future = executor.submit(() -> {
            try {
                System.setOut(ps);
                mainMethod.invoke(null, (Object) new String[0]);
                System.out.flush();
                return baos.toString();
            } finally {
                System.setOut(oldOut);
                System.setIn(oldIn);
            }
        });

        try {
            // Wait for execution with timeout
            String output = future.get(executionTimeout, TimeUnit.MILLISECONDS);
            return output;
        } catch (TimeoutException e) {
            future.cancel(true);
            return "Execution timeout - program took longer than " + executionTimeout + "ms";
        } finally {
            executor.shutdownNow();
            classLoader.close();
        }
    }

    /**
     * Clean up the working directory
     */
    private void cleanupDirectory(Path dir) {
        try {
            if (dir != null && Files.exists(dir)) {
                Files.walk(dir)
                     .sorted(Comparator.reverseOrder())
                     .forEach(path -> {
                         try {
                             Files.delete(path);
                         } catch (IOException e) {
                             // Ignore cleanup errors
                         }
                     });
            }
        } catch (IOException e) {
            // Ignore cleanup errors
        }
    }

    /**
     * Inner class to hold compilation and execution results
     */
    public static class CompilationResult {
        private boolean success;
        private String output;
        private String error;
        private long executionTime;

        public boolean isSuccess() { return success; }
        public void setSuccess(boolean success) { this.success = success; }
        
        public String getOutput() { return output; }
        public void setOutput(String output) { this.output = output; }
        
        public String getError() { return error; }
        public void setError(String error) { this.error = error; }
        
        public long getExecutionTime() { return executionTime; }
        public void setExecutionTime(long executionTime) { this.executionTime = executionTime; }
    }
}
