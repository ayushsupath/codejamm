# CodeJamm API Testing Guide

This guide shows you how to test the CodeJamm APIs using Postman or curl.

## 📝 API Base URL

```
http://localhost:8080/api
```

---

## 🧪 Testing Endpoints

### 1. Health Check - Compiler Service

**Request:**
```bash
curl http://localhost:8080/api/compiler/health
```

**Expected Response:**
```json
{
  "status": "UP",
  "service": "Java Compiler Service",
  "message": "CodeJamm Compiler is running"
}
```

---

### 2. Get All Categories

**Request:**
```bash
curl http://localhost:8080/api/categories
```

**Expected Response:**
```json
[
  {
    "id": 1,
    "name": "Easy Programs",
    "description": "Beginner-friendly Java programs to get started",
    "displayOrder": 1,
    "iconClass": "fa-smile",
    "isActive": true
  },
  ...
]
```

---

### 3. Get Programs by Difficulty

**Request:**
```bash
curl http://localhost:8080/api/programs/difficulty/EASY
```

**Expected Response:**
```json
[
  {
    "id": 1,
    "title": "Hello World",
    "description": "The classic first program in Java",
    "code": "public class HelloWorld { ... }",
    "difficultyLevel": "EASY",
    "viewCount": 0,
    "likesCount": 0
  },
  ...
]
```

---

### 4. Compile and Execute Java Code

**Request:**
```bash
curl -X POST http://localhost:8080/api/compiler/execute \
  -H "Content-Type: application/json" \
  -d '{
    "code": "public class Test { public static void main(String[] args) { System.out.println(\"Hello from API!\"); } }",
    "input": ""
  }'
```

**Expected Response (Success):**
```json
{
  "success": true,
  "output": "Hello from API!\n",
  "error": null,
  "executionTime": 1247
}
```

**Expected Response (Compilation Error):**
```json
{
  "success": false,
  "output": null,
  "error": "Compilation Errors:\nLine 1: ';' expected\n",
  "executionTime": 523
}
```

---

### 5. Search Programs

**Request:**
```bash
curl "http://localhost:8080/api/programs/search?keyword=fibonacci"
```

**Expected Response:**
```json
[
  {
    "id": 3,
    "title": "Fibonacci Series",
    "description": "Generate Fibonacci sequence",
    "code": "...",
    "difficultyLevel": "EASY"
  }
]
```

---

### 6. Get Most Viewed Programs

**Request:**
```bash
curl http://localhost:8080/api/programs/most-viewed
```

---

### 7. Create a New Program (POST)

**Request:**
```bash
curl -X POST http://localhost:8080/api/programs \
  -H "Content-Type: application/json" \
  -d '{
    "title": "Test Program",
    "description": "A test program",
    "code": "public class Test { ... }",
    "difficultyLevel": "EASY",
    "topic": {"id": 1}
  }'
```

---

## 📮 Postman Collection

Import this collection into Postman:

```json
{
  "info": {
    "name": "CodeJamm API",
    "schema": "https://schema.getpostman.com/json/collection/v2.1.0/collection.json"
  },
  "item": [
    {
      "name": "Categories",
      "item": [
        {
          "name": "Get All Categories",
          "request": {
            "method": "GET",
            "url": "http://localhost:8080/api/categories"
          }
        }
      ]
    },
    {
      "name": "Programs",
      "item": [
        {
          "name": "Get Programs by Difficulty",
          "request": {
            "method": "GET",
            "url": "http://localhost:8080/api/programs/difficulty/EASY"
          }
        },
        {
          "name": "Search Programs",
          "request": {
            "method": "GET",
            "url": "http://localhost:8080/api/programs/search?keyword=hello"
          }
        }
      ]
    },
    {
      "name": "Compiler",
      "item": [
        {
          "name": "Execute Code",
          "request": {
            "method": "POST",
            "header": [
              {
                "key": "Content-Type",
                "value": "application/json"
              }
            ],
            "body": {
              "mode": "raw",
              "raw": "{\n  \"code\": \"public class Test { public static void main(String[] args) { System.out.println(\\\"Hello!\\\"); } }\",\n  \"input\": \"\"\n}"
            },
            "url": "http://localhost:8080/api/compiler/execute"
          }
        },
        {
          "name": "Compiler Health Check",
          "request": {
            "method": "GET",
            "url": "http://localhost:8080/api/compiler/health"
          }
        }
      ]
    }
  ]
}
```

---

## 🧪 Testing Scenarios

### Test 1: Basic Compilation
```json
{
  "code": "public class HelloWorld { public static void main(String[] args) { System.out.println(\"Hello, World!\"); } }",
  "input": ""
}
```

### Test 2: Program with Input
```json
{
  "code": "import java.util.Scanner; public class Input { public static void main(String[] args) { Scanner sc = new Scanner(System.in); System.out.println(\"You entered: \" + sc.nextLine()); } }",
  "input": "Test Input"
}
```

### Test 3: Compilation Error
```json
{
  "code": "public class Error { public static void main(String[] args) { System.out.println(\"Missing semicolon\" ) }",
  "input": ""
}
```

### Test 4: Runtime Error
```json
{
  "code": "public class Runtime { public static void main(String[] args) { int x = 5 / 0; } }",
  "input": ""
}
```

### Test 5: Infinite Loop (Will timeout after 5 seconds)
```json
{
  "code": "public class Loop { public static void main(String[] args) { while(true) {} } }",
  "input": ""
}
```

---

## ✅ Expected Results Summary

| Test Case | Expected Result |
|-----------|----------------|
| Valid Code | `success: true`, output shown |
| Compilation Error | `success: false`, error message with line number |
| Runtime Error | `success: false`, error message |
| Timeout | Output: "Execution timeout..." |
| No Code | `success: false`, "Code cannot be empty" |

---

## 🔧 Common Issues

**CORS Error:**
- Make sure CORS is enabled in the backend
- Check if frontend origin is allowed

**404 Not Found:**
- Verify backend is running on port 8080
- Check endpoint spelling

**500 Internal Server Error:**
- Check backend logs
- Verify database connection
- Ensure JDK is installed (not just JRE)

---

## 📊 Performance Testing

Test the compiler with various code sizes:

1. **Small (< 50 lines)**: Should execute in < 1 second
2. **Medium (50-200 lines)**: Should execute in 1-2 seconds
3. **Large (200+ lines)**: Should execute in 2-5 seconds

---

Need more help? Check the [README](../README.md) or [Quick Start Guide](QUICK_START.md)!
