# 🚀 CodeJamm — Java Learning Platform

![Java](https://img.shields.io/badge/Java-17-orange?logo=java&logoColor=white)
![Spring Boot](https://img.shields.io/badge/Spring%20Boot-3.2.0-brightgreen?logo=springboot&logoColor=white)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue?logo=mysql&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-Enabled-blue?logo=docker&logoColor=white)
![HTML5](https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white)
![CSS3](https://img.shields.io/badge/CSS3-1572B6?logo=css3&logoColor=white)
![JavaScript ES6](https://img.shields.io/badge/JavaScript%20ES6-F7DF1E?logo=javascript&logoColor=black)
![Maven](https://img.shields.io/badge/Maven-Build%20Tool-C71A36?logo=apachemaven&logoColor=white)


**CodeJamm** is a full-stack Java learning platform built for MCA students at SGSITS Indore. It provides 100+ categorized Java programs along with a built-in, live, in-browser Java compiler, giving students everything they need to practice and master Java programming in one place.

## 🔗 Live Demo
- **Frontend Live URL: https://codejamm.netlify.app/
- **Backend API:** [https://codejamm-backend.onrender.com](https://codejamm-backend.onrender.com)

## 🛠️ Tech Stack
- **Backend:** Java 17, Spring Boot 3.2.0, Maven
- **Database:** MySQL 8.0 (Hosted on Railway)
- **Frontend:** HTML5, CSS3, JavaScript ES6, Monaco Editor
- **Deployment:** 
  - **Backend:** Render
  - **Frontend:** Netlify
  - **Database:** Railway
  - **Containerization:** Docker

## ✨ Key Features
- 📚 **Extensive Problem Library:** 118+ Java programs spread across 10 structured categories.
- 💻 **In-Browser IDE:** Integrated Monaco Editor provides a VS Code-like coding and execution experience without leaving the browser.
- ⚡ **RESTful API:** Robust backend powered by 20+ endpoints.
- 📱 **Fully Responsive:** Beautiful design that works flawlessly on mobile, tablet, and desktop.
- 🛡️ **Safe Code Execution:** Live code execution environment with timeout protection to prevent infinite loops.

## 📂 Program Categories
The programs are organized logically to guide learners from basics to advanced concepts:
- **Easy**, **Moderate**, **Advanced**
- **Data Structures**, **OOPs Concepts**
- **Pattern Printing**, **Matrix Problems**, **String Operations**
- **Collections Framework**, **JDBC**

## 🔌 API Endpoints
A glimpse of our primary REST API endpoints:
- `GET /api/categories`
- `GET /api/programs/topic/{topicId}`
- `GET /api/programs/difficulty/{level}`
- `GET /api/programs/search?keyword=`
- `POST /api/compiler/execute`

## 🚀 How to Run Locally

Follow these steps to set up the project on your local machine:

1. **Clone the repository:**
   ```bash
   git clone <your-repository-url>
   cd codejamm
   ```

2. **Setup MySQL database:**
   Ensure MySQL is installed and running locally, or use a remote DB. Create a database for the project and import the initial schema/data if applicable.

3. **Update Database Credentials:**
   Edit `backend/src/main/resources/application.properties` and add your database URL, username, and password.

4. **Run the Backend (Spring Boot):**
   ```bash
   cd backend
   mvn spring-boot:run
   ```

5. **Run the Frontend:**
   Just open the `frontend/index.html` file in your preferred web browser, or use a local development server like Python's HTTP Server:
   ```bash
   cd frontend
   python -m http.server 8000
   ```
   Then navigate to `http://localhost:8000` in your browser.

## 👥 Project Team
Crafted with ❤️ by:
- **Ayush Supath**
- **Deerendra Mishra**
- **Adarsh Tivedi**

### 🎓 Institution Details
- **Institution:** Shri Govindram Seksaria Institute of Technology and Science (SGSITS), Indore
- **Program:** MCA I Year, Semester II, 2026
- **Mentor:** Ms. Sonika Soni
