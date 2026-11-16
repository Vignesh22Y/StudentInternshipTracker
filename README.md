# Student Skill & Internship Tracker

A web-based project developed as part of my Advanced Java coursework.

## About the Project

Student Skill & Internship Tracker is designed to help students keep their profile and technical skills organised in one place. Students can create an account, manage their skills and explore available internship opportunities.

The project also includes a separate admin section to add and manage internship information.

## Features

### Student Section
- Student registration and login
- View student profile
- Add, view, edit and delete skills
- Explore available internships
- Session-based login management

### Admin Section
- Separate admin login
- Admin dashboard
- Add new internships
- View available internships
- Edit and delete internship records

### Additional Feature
- Multithreading demonstration using three Java threads for internship check, skill check and dashboard update.

## Technologies Used

- Java
- JSP (JavaServer Pages)
- Servlets
- JDBC
- MySQL
- HTML and CSS
- Apache Tomcat 10.1
- Apache NetBeans
- Maven

## Database

The project uses MySQL with the database name `student_tracker`.

Main tables:
- `student`
- `skills`
- `internship`
- `admin`

## How to Run the Project

1. Clone or download this repository.
2. Open Apache NetBeans.
3. Open the project as an existing Maven project.
4. Start MySQL using XAMPP.
5. Create the `student_tracker` database and its required tables.
6. Check the database settings in `DBConnection.java`.
7. Run the project using Apache Tomcat 10.1.
8. Open the application in your browser.

## Project Information

**Project:** Student Skill & Internship Tracker  
**Subject:** Advanced Java  
**Developed by:** Vignesh Yadav  
**Project Type:** Academic Project
