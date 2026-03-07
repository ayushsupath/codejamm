-- CodeJamm Database Schema
-- MySQL Database for Java Learning Platform

-- Create database
CREATE DATABASE IF NOT EXISTS codejamm_db;
USE codejamm_db;

-- Categories Table
CREATE TABLE IF NOT EXISTS categories (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL UNIQUE,
    description VARCHAR(500),
    display_order INT,
    icon_class VARCHAR(50),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

-- Topics Table
CREATE TABLE IF NOT EXISTS topics (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    description VARCHAR(1000),
    category_id BIGINT NOT NULL,
    difficulty_level VARCHAR(20),
    display_order INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE CASCADE
);

-- Programs Table
CREATE TABLE IF NOT EXISTS programs (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(1000),
    code TEXT NOT NULL,
    explanation TEXT,
    sample_input TEXT,
    sample_output TEXT,
    topic_id BIGINT NOT NULL,
    difficulty_level VARCHAR(20),
    time_complexity VARCHAR(50),
    space_complexity VARCHAR(50),
    view_count BIGINT DEFAULT 0,
    likes_count BIGINT DEFAULT 0,
    display_order INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (topic_id) REFERENCES topics(id) ON DELETE CASCADE
);

-- Reference Materials Table
CREATE TABLE IF NOT EXISTS reference_materials (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(500),
    content TEXT,
    category_id BIGINT,
    material_type VARCHAR(50),
    file_url VARCHAR(500),
    display_order INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (category_id) REFERENCES categories(id) ON DELETE SET NULL
);

-- Tutorial Videos Table
CREATE TABLE IF NOT EXISTS tutorial_videos (
    id BIGINT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description VARCHAR(500),
    video_url VARCHAR(500) NOT NULL,
    thumbnail_url VARCHAR(500),
    topic_id BIGINT,
    duration_minutes INT,
    view_count BIGINT DEFAULT 0,
    display_order INT,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (topic_id) REFERENCES topics(id) ON DELETE SET NULL
);

-- Insert Sample Categories
INSERT INTO categories (name, description, display_order, icon_class) VALUES
('Easy Programs', 'Beginner-friendly Java programs to get started', 1, 'fa-smile'),
('Moderate Programs', 'Intermediate level programs for practice', 2, 'fa-brain'),
('Advanced Programs', 'Complex programs for advanced learners', 3, 'fa-fire'),
('Data Structures', 'Arrays, Linked Lists, Stacks, Queues, Trees, Heaps', 4, 'fa-database'),
('OOPs Concepts', 'Object-Oriented Programming in Java', 5, 'fa-cube'),
('Pattern Printing', 'Star patterns, number patterns, and more', 6, 'fa-border-all'),
('Matrix Problems', 'Multi-dimensional array operations', 7, 'fa-th'),
('String Operations', 'String manipulation and algorithms', 8, 'fa-font'),
('Collections Framework', 'List, Set, Map, Queue implementations', 9, 'fa-layer-group'),
('JDBC', 'Database connectivity with Java', 10, 'fa-plug');

-- Insert Sample Topics
INSERT INTO topics (name, description, category_id, difficulty_level, display_order) VALUES
-- Easy Programs Topics
('Basic Syntax', 'Hello World, Variables, Data Types', 1, 'EASY', 1),
('Control Flow', 'If-else, Switch, Loops', 1, 'EASY', 2),
('Basic Math', 'Simple arithmetic operations', 1, 'EASY', 3),

-- Data Structures Topics
('Arrays', 'Array operations and algorithms', 4, 'MODERATE', 1),
('Linked Lists', 'Singly, Doubly, Circular Linked Lists', 4, 'MODERATE', 2),
('Stacks', 'Stack implementation and applications', 4, 'MODERATE', 3),
('Queues', 'Queue, Deque, Priority Queue', 4, 'MODERATE', 4),
('Trees', 'Binary Trees, BST, AVL, Heap', 4, 'ADVANCED', 5),

-- OOPs Topics
('Classes and Objects', 'Basics of OOP', 5, 'MODERATE', 1),
('Inheritance', 'Extending classes', 5, 'MODERATE', 2),
('Polymorphism', 'Method overloading and overriding', 5, 'MODERATE', 3),
('Abstraction', 'Abstract classes and interfaces', 5, 'ADVANCED', 4),
('Encapsulation', 'Access modifiers and getters/setters', 5, 'MODERATE', 5);

-- Insert Sample Programs
INSERT INTO programs (title, description, code, explanation, sample_output, topic_id, difficulty_level, time_complexity, space_complexity, display_order) VALUES
-- Hello World Program
('Hello World', 
 'The classic first program in Java', 
 'public class HelloWorld {
    public static void main(String[] args) {
        System.out.println("Hello, World!");
    }
}',
 'This is the simplest Java program. It prints "Hello, World!" to the console. Every Java program starts with a class definition and a main method.',
 'Hello, World!',
 1, 'EASY', 'O(1)', 'O(1)', 1),

-- Sum of Two Numbers
('Sum of Two Numbers',
 'Calculate the sum of two integers',
 'public class Sum {
    public static void main(String[] args) {
        int a = 10;
        int b = 20;
        int sum = a + b;
        System.out.println("Sum: " + sum);
    }
}',
 'This program demonstrates basic arithmetic operations in Java. It declares two integer variables, adds them, and prints the result.',
 'Sum: 30',
 3, 'EASY', 'O(1)', 'O(1)', 1),

-- Factorial
('Factorial of a Number',
 'Calculate factorial using recursion',
 'public class Factorial {
    public static int factorial(int n) {
        if (n == 0 || n == 1) {
            return 1;
        }
        return n * factorial(n - 1);
    }
    
    public static void main(String[] args) {
        int number = 5;
        System.out.println("Factorial of " + number + " = " + factorial(number));
    }
}',
 'This program calculates factorial using recursion. Factorial of n (n!) is the product of all positive integers less than or equal to n.',
 'Factorial of 5 = 120',
 2, 'EASY', 'O(n)', 'O(n)', 1),

-- Array Sum
('Sum of Array Elements',
 'Calculate sum of all elements in an array',
 'public class ArraySum {
    public static void main(String[] args) {
        int[] arr = {1, 2, 3, 4, 5};
        int sum = 0;
        
        for (int num : arr) {
            sum += num;
        }
        
        System.out.println("Sum of array elements: " + sum);
    }
}',
 'This program demonstrates array traversal and accumulation. It uses an enhanced for loop to iterate through all elements and calculate their sum.',
 'Sum of array elements: 15',
 4, 'EASY', 'O(n)', 'O(1)', 1),

-- Fibonacci Series
('Fibonacci Series',
 'Generate Fibonacci sequence',
 'public class Fibonacci {
    public static void main(String[] args) {
        int n = 10;
        int a = 0, b = 1;
        
        System.out.print("Fibonacci Series: " + a + " " + b);
        
        for (int i = 2; i < n; i++) {
            int next = a + b;
            System.out.print(" " + next);
            a = b;
            b = next;
        }
    }
}',
 'The Fibonacci sequence is a series where each number is the sum of the two preceding ones. This program generates the first n Fibonacci numbers.',
 'Fibonacci Series: 0 1 1 2 3 5 8 13 21 34',
 2, 'EASY', 'O(n)', 'O(1)', 2);

-- Insert Sample Reference Materials
INSERT INTO reference_materials (title, description, content, category_id, material_type, display_order) VALUES
('Java Basics Cheat Sheet', 
 'Quick reference for Java syntax and basics',
 '# Java Basics\n\n## Data Types\n- int, long, float, double\n- boolean, char\n- String\n\n## Control Flow\n- if-else\n- switch\n- for, while, do-while',
 1, 'CHEAT_SHEET', 1),

('OOPs Principles', 
 'Core concepts of Object-Oriented Programming',
 '# OOP Principles\n\n1. Encapsulation\n2. Inheritance\n3. Polymorphism\n4. Abstraction',
 5, 'DOCUMENTATION', 1);

-- Create indexes for better performance
CREATE INDEX idx_programs_topic ON programs(topic_id);
CREATE INDEX idx_programs_difficulty ON programs(difficulty_level);
CREATE INDEX idx_topics_category ON topics(category_id);
CREATE INDEX idx_programs_active ON programs(is_active);
CREATE INDEX idx_categories_active ON categories(is_active);

-- Show table structure
SHOW TABLES;
SELECT 'Database schema created successfully!' AS Status;
