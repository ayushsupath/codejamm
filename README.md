# CodeJamm - Java Learning Platform

<div align="center">

**Your Java Journey Starts Here — Learn, Practice, and Code Everything**

A complete, free web-based platform for learning Java programming with an in-browser compiler.

[![Java](https://img.shields.io/badge/Java-17+-orange.svg)](https://www.oracle.com/java/)
[![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.0-brightgreen.svg)](https://spring.io/projects/spring-boot)
[![MySQL](https://img.shields.io/badge/MySQL-8.0+-blue.svg)](https://www.mysql.com/)
[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)

</div>

---

## 📋 Table of Contents

- [About](#about)
- [Features](#features)
- [Technology Stack](#technology-stack)
- [Project Structure](#project-structure)
- [Prerequisites](#prerequisites)
- [Installation](#installation)
- [Running the Application](#running-the-application)
- [API Documentation](#api-documentation)
- [Deployment](#deployment)
- [Contributing](#contributing)
- [Team](#team)

---

## 🎯 About

**CodeJamm** is a comprehensive Java learning platform designed specifically for students. It provides:

- **Structured Learning Path**: From basic syntax to advanced topics like Data Structures, OOPs, Collections, and JDBC
- **In-Browser Compiler**: Write and execute Java code without any local setup
- **Categorized Programs**: 500+ programs organized by difficulty and topics
- **Reference Materials**: Documentation and cheat sheets for quick reference
- **Tutorial Videos**: Curated learning resources embedded on the platform
- **100% Free**: No paywalls, subscriptions, or hidden costs

---

## ✨ Features

### Core Features
- ✅ **Live Java Compiler** - Compile and execute code directly in the browser
- ✅ **Monaco Editor** - VS Code-like editing experience with syntax highlighting
- ✅ **Program Library** - 500+ categorized Java programs
- ✅ **Multiple Categories** - Easy, Moderate, Advanced, Data Structures, OOPs, and more
- ✅ **Search & Filter** - Find programs by keyword, difficulty, or topic
- ✅ **Reference Materials** - Quick-reference documentation and guides
- ✅ **Responsive Design** - Works on desktop, tablet, and mobile

### Technical Features
- ✅ RESTful API architecture
- ✅ Spring Boot backend with JPA/Hibernate
- ✅ MySQL database with optimized queries
- ✅ Modern responsive frontend (HTML5, CSS3, JavaScript)
- ✅ Secure code execution with timeout protection
- ✅ CORS enabled for cross-origin requests

---

## 🛠 Technology Stack

### Backend
- **Java 17**
- **Spring Boot 3.2.0**
- **Spring Data JPA**
- **MySQL 8.0+**
- **Maven** for dependency management
- **Lombok** for reducing boilerplate code

### Frontend
- **HTML5 & CSS3**
- **JavaScript (ES6+)**
- **Monaco Editor** (VS Code editor)
- **Font Awesome** icons
- **Responsive CSS Grid & Flexbox**

### Development Tools
- **IntelliJ IDEA / Eclipse** - IDE
- **Postman** - API testing
- **Git & GitHub** - Version control
- **Maven** - Build tool

---

## 📁 Project Structure

```
codejamm/
├── backend/
│   ├── src/
│   │   ├── main/
│   │   │   ├── java/com/sgsits/codejamm/
│   │   │   │   ├── CodeJammApplication.java
│   │   │   │   ├── model/
│   │   │   │   │   ├── Category.java
│   │   │   │   │   ├── Topic.java
│   │   │   │   │   ├── Program.java
│   │   │   │   │   ├── ReferenceMaterial.java
│   │   │   │   │   └── TutorialVideo.java
│   │   │   │   ├── repository/
│   │   │   │   │   ├── CategoryRepository.java
│   │   │   │   │   ├── TopicRepository.java
│   │   │   │   │   ├── ProgramRepository.java
│   │   │   │   │   ├── ReferenceMaterialRepository.java
│   │   │   │   │   └── TutorialVideoRepository.java
│   │   │   │   ├── service/
│   │   │   │   │   ├── CategoryService.java
│   │   │   │   │   ├── ProgramService.java
│   │   │   │   │   └── JavaCompilerService.java
│   │   │   │   └── controller/
│   │   │   │       ├── CategoryController.java
│   │   │   │       ├── ProgramController.java
│   │   │   │       └── CompilerController.java
│   │   │   └── resources/
│   │   │       └── application.properties
│   │   └── test/
│   └── pom.xml
├── frontend/
│   ├── index.html
│   ├── compiler.html
│   ├── programs.html
│   ├── css/
│   │   ├── style.css
│   │   └── compiler.css
│   └── js/
│       ├── config.js
│       ├── api.js
│       ├── home.js
│       ├── compiler.js
│       └── samples.js
├── database/
│   └── schema.sql
├── docs/
└── README.md
```

---

## 📦 Prerequisites

Before you begin, ensure you have the following installed:

- **JDK 17 or higher**
  ```bash
  java -version
  ```

- **Maven 3.6 or higher**
  ```bash
  mvn -version
  ```

- **MySQL 8.0 or higher**
  ```bash
  mysql --version
  ```

- **Git**
  ```bash
  git --version
  ```

---

## 🚀 Installation

### 1. Clone the Repository

```bash
git clone https://github.com/yourusername/codejamm.git
cd codejamm
```

### 2. Setup MySQL Database

```bash
# Login to MySQL
mysql -u root -p

# Create database and user
CREATE DATABASE codejamm_db;
CREATE USER 'codejamm_user'@'localhost' IDENTIFIED BY 'your_password';
GRANT ALL PRIVILEGES ON codejamm_db.* TO 'codejamm_user'@'localhost';
FLUSH PRIVILEGES;
EXIT;

# Import schema
mysql -u root -p codejamm_db < database/schema.sql
```

### 3. Configure Application Properties

Edit `backend/src/main/resources/application.properties`:

```properties
spring.datasource.url=jdbc:mysql://localhost:3306/codejamm_db
spring.datasource.username=codejamm_user
spring.datasource.password=your_password
```

### 4. Build the Backend

```bash
cd backend
mvn clean install
```

---

## 🎮 Running the Application

### Option 1: Run from IDE (Recommended for Development)

1. Open `backend` folder in IntelliJ IDEA or Eclipse
2. Wait for Maven to download dependencies
3. Run `CodeJammApplication.java`
4. Backend will start on `http://localhost:8080`

### Option 2: Run using Maven

```bash
cd backend
mvn spring-boot:run
```

### Option 3: Run JAR file

```bash
cd backend
mvn clean package
java -jar target/codejamm-1.0.0.jar
```

### Frontend Setup

1. Open `frontend/index.html` in a web browser, OR
2. Use a local server (recommended):

```bash
cd frontend
# Using Python
python -m http.server 8000

# OR using Node.js http-server
npx http-server -p 8000
```

Then open `http://localhost:8000` in your browser.

---

## 📚 API Documentation

### Base URL
```
http://localhost:8080/api
```

### Endpoints

#### Categories
```
GET    /categories           - Get all categories
GET    /categories/{id}      - Get category by ID
POST   /categories           - Create new category
PUT    /categories/{id}      - Update category
DELETE /categories/{id}      - Delete category
```

#### Programs
```
GET    /programs/topic/{topicId}              - Get programs by topic
GET    /programs/difficulty/{level}           - Get programs by difficulty
GET    /programs/{id}                         - Get program by ID
GET    /programs/search?keyword=...           - Search programs
GET    /programs/most-viewed                  - Get most viewed programs
GET    /programs/most-liked                   - Get most liked programs
POST   /programs                              - Create new program
PUT    /programs/{id}                         - Update program
DELETE /programs/{id}                         - Delete program
POST   /programs/{id}/view                    - Increment view count
POST   /programs/{id}/like                    - Increment likes count
```

#### Compiler
```
POST   /compiler/execute                      - Compile and execute Java code
GET    /compiler/health                       - Check compiler service health
```

**Example Request:**
```json
POST /api/compiler/execute
{
  "code": "public class Test { public static void main(String[] args) { System.out.println(\"Hello\"); } }",
  "input": ""
}
```

**Example Response:**
```json
{
  "success": true,
  "output": "Hello\n",
  "error": null,
  "executionTime": 1250
}
```

---

## 🌐 Deployment

### Backend Deployment (Render/Railway)

1. **Render.com:**
   - Create new Web Service
   - Connect GitHub repository
   - Build Command: `cd backend && mvn clean install`
   - Start Command: `java -jar backend/target/codejamm-1.0.0.jar`
   - Add environment variables for database

2. **Railway.app:**
   - Import GitHub repository
   - Railway auto-detects Spring Boot
   - Add MySQL database service
   - Set environment variables

### Database Deployment (PlanetScale/Neon)

1. **PlanetScale:**
   ```bash
   # Install PlanetScale CLI
   brew install planetscale/tap/pscale
   
   # Create database
   pscale database create codejamm
   
   # Import schema
   pscale shell codejamm main < database/schema.sql
   ```

2. **Neon.tech:**
   - Create new project
   - Copy connection string
   - Update `application.properties`

### Frontend Deployment

- **GitHub Pages** - For static hosting
- **Netlify** - Drag and drop deployment
- **Vercel** - Git-based deployment

---

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

---

## 👥 Team

**SGSITS, Indore - MCA Minor Project 2026**

- **Ayush Supath** - Developer
- **Deerendra Mishra** - Developer
- **Adarsh Tivedi** - Developer

**Mentor:** Ms. Sonika Soni

---

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

## 🙏 Acknowledgments

- Spring Boot Community
- Monaco Editor Team
- Font Awesome
- All open-source contributors

---

## 📞 Contact

For questions or support, please contact:
- Email: ayush.supath@example.com
- GitHub Issues: [Create an issue](https://github.com/yourusername/codejamm/issues)

---

<div align="center">

**Made with ❤️ for Java learners**

⭐ Star this repo if you find it helpful!

</div>
