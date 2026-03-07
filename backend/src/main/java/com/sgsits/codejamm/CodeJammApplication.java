package com.sgsits.codejamm;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

/**
 * CodeJamm - Java Learning Platform
 * Main Spring Boot Application
 * 
 * @author Ayush Supath, Deerendra Mishra, Adarsh Tivedi
 * @version 1.0.0
 */
@SpringBootApplication
public class CodeJammApplication {

    public static void main(String[] args) {
        SpringApplication.run(CodeJammApplication.class, args);
        System.out.println("╔═══════════════════════════════════════════════════════╗");
        System.out.println("║                                                       ║");
        System.out.println("║              CodeJamm Backend Started                 ║");
        System.out.println("║      Java Learning Platform with Live Compiler        ║");
        System.out.println("║                                                       ║");
        System.out.println("║      API running on: http://localhost:8080            ║");
        System.out.println("║      Swagger UI: http://localhost:8080/swagger-ui     ║");
        System.out.println("║                                                       ║");
        System.out.println("╚═══════════════════════════════════════════════════════╝");
    }

    @Bean
    public WebMvcConfigurer corsConfigurer() {
        return new WebMvcConfigurer() {
            @Override
            public void addCorsMappings(CorsRegistry registry) {
                registry.addMapping("/**")
                        .allowedOrigins("*")
                        .allowedMethods("GET", "POST", "PUT", "DELETE", "OPTIONS")
                        .allowedHeaders("*");
            }
        };
    }
}
