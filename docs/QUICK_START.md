# CodeJamm - Quick Start Guide

This guide will help you get CodeJamm running on your local machine in under 10 minutes.

## 🎯 Prerequisites Checklist

- [ ] JDK 17+ installed
- [ ] Maven 3.6+ installed
- [ ] MySQL 8.0+ installed and running
- [ ] Git installed

---

## 🚀 Step-by-Step Setup

### Step 1: Clone and Navigate

```bash
git clone https://github.com/yourusername/codejamm.git
cd codejamm
```

### Step 2: Setup Database (2 minutes)

```bash
# Login to MySQL
mysql -u root -p

# Run these commands in MySQL:
CREATE DATABASE codejamm_db;
EXIT;

# Import the schema
mysql -u root -p codejamm_db < database/schema.sql
```

### Step 3: Configure Database Connection (1 minute)

Edit `backend/src/main/resources/application.properties`:

```properties
# Update these lines with your MySQL credentials:
spring.datasource.username=root
spring.datasource.password=your_mysql_password
```

### Step 4: Start the Backend (3 minutes)

```bash
cd backend
mvn clean install
mvn spring-boot:run
```

Wait for the message:
```
╔═══════════════════════════════════════════════════════╗
║              CodeJamm Backend Started                 ║
║      API running on: http://localhost:8080            ║
╚═══════════════════════════════════════════════════════╝
```

### Step 5: Open the Frontend (1 minute)

**Option A: Direct File Access**
Simply open `frontend/index.html` in your browser

**Option B: Local Server (Recommended)**
```bash
cd frontend
python -m http.server 8000
```
Then open `http://localhost:8000`

---

## ✅ Verify Everything Works

1. **Check Backend**: Visit `http://localhost:8080/api/categories`
   - You should see JSON data with categories

2. **Check Frontend**: Open `http://localhost:8000` (or the HTML file)
   - You should see the CodeJamm homepage

3. **Test the Compiler**: 
   - Click "Live Compiler" 
   - Click "Run Code"
   - You should see "Hello, World!" in the output

---

## 🎉 You're All Set!

CodeJamm is now running on your machine! Here's what you can do:

- **Browse Programs**: Click on any category on the homepage
- **Try the Compiler**: Write and run Java code in the live compiler
- **Load Samples**: Click sample program buttons to see examples
- **Search**: Use the search feature to find specific programs

---

## 🐛 Troubleshooting

### Backend won't start?
- Check if MySQL is running: `mysql -u root -p`
- Verify Java version: `java -version` (should be 17+)
- Check port 8080 is not in use

### Frontend not loading categories?
- Make sure backend is running on port 8080
- Check browser console for errors (F12)
- Verify API URL in `frontend/js/config.js`

### Compiler not working?
- Ensure JDK (not just JRE) is installed
- Check backend logs for compilation errors
- Verify `tools.jar` is accessible

---

## 📚 Next Steps

- Read the full [README.md](../README.md) for detailed documentation
- Explore the [API Documentation](../README.md#api-documentation)
- Check out the [Deployment Guide](DEPLOYMENT.md) for production setup

---

## 💡 Tips

- Use Ctrl/Cmd + Enter in the compiler to run code quickly
- Backend automatically restarts when you make code changes (Spring DevTools)
- Check backend logs if API calls fail

---

Need help? Check the [FAQ](FAQ.md) or create an issue on GitHub!
