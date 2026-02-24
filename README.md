# 🎓 University Course Management System (SQL Project)

## 📌 Project Overview

The **University Course Management System** is a relational database project designed to manage and organize data related to a university’s academic environment. This system helps in storing and retrieving information about **departments, students, instructors, courses, and enrollments**.

The main objective of this project is to demonstrate the practical implementation of **SQL concepts**, **relational database design**, and **CRUD operations (Create, Read, Update, Delete)** in a real-world academic use case.

---

## 🎯 Objectives of the Project

* To design a structured **relational database schema** for a university system
* To understand and apply **primary keys and foreign keys**
* To perform **CRUD operations** on different entities
* To implement **relationships between tables**
* To practice **SQL queries** for data retrieval and updates
* To learn how a real database system manages academic data

---

## 🧱 Database Structure (Schema Design)

The database consists of the following tables:

### 1️⃣ Departments Table

Stores information about university departments.

**Fields:**

* `DepartmentID` (Primary Key)
* `DepartmentName`

**Purpose:**
Represents different departments like Computer Science, Mechanical, Electrical, etc.

---

### 2️⃣ Students Table

Stores information about students.

**Fields:**

* `StudentID` (Primary Key)
* `FirstName`
* `LastName`
* `Email`
* `BirthDate`
* `EnrollmentDate`

**Purpose:**
Keeps personal and academic enrollment details of students.

---

### 3️⃣ Instructors Table

Stores information about instructors/teachers.

**Fields:**

* `InstructorID` (Primary Key)
* `FirstName`
* `LastName`
* `Email`
* `DepartmentID` (Foreign Key)
* `Salary`

**Purpose:**
Maintains faculty details and links instructors to departments.

---

### 4️⃣ Courses Table

Stores information about courses.

**Fields:**

* `CourseID` (Primary Key)
* `CourseName`
* `DepartmentID` (Foreign Key)
* `Credits`

**Purpose:**
Defines the courses offered by each department.

---

### 5️⃣ Enrollments Table

Stores student-course relationship.

**Fields:**

* `EnrollmentID` (Primary Key)
* `StudentID` (Foreign Key)
* `CourseID` (Foreign Key)
* `EnrollmentDate`

**Purpose:**
Manages which student is enrolled in which course.
This table represents a **many-to-many relationship** between Students and Courses.

---

## 🔗 Relationships Between Tables

* **One Department → Many Courses**
* **One Department → Many Instructors**
* **One Student → Many Enrollments**
* **One Course → Many Enrollments**

This project follows **Relational Database Design principles** and maintains **data integrity** using foreign keys.

---

## 🔄 CRUD Operations (Core Concept)

This project supports full CRUD functionality:

### ✅ Create

Insert new records into:

* Students
* Courses
* Departments
* Instructors
* Enrollments

### 📖 Read

Retrieve data using `SELECT` queries such as:

* View all students
* View courses by department
* View enrolled students in a course

### ✏️ Update

Modify existing records like:

* Update student email
* Update course credits
* Update instructor salary

### ❌ Delete

Remove records such as:

* Delete a student
* Remove a course
* Cancel enrollment

These operations simulate real university management tasks.

---

## 🧠 SQL Concepts Used

* `CREATE DATABASE`
* `CREATE TABLE`
* `PRIMARY KEY`
* `FOREIGN KEY`
* `INSERT`
* `SELECT`
* `UPDATE`
* `DELETE`
* `JOIN` (to combine data from multiple tables)
* Data types: `INT`, `VARCHAR`, `DATE`, `DECIMAL`

---

## 🧪 Sample Use Cases

* Find all students enrolled in a specific course
* List all courses offered by a department
* View instructor details with department name
* Count number of students in each course
* Update student details when profile changes

---

## 🧩 Normalization

The database follows **normalization rules**:

* Data is divided into separate tables
* Redundancy is minimized
* Relationships are handled using foreign keys
* Each table represents one entity

This improves:

* Data consistency
* Data integrity
* Performance
* Scalability

---

## 🛠 Tools & Technologies

* **Database:** MySQL / SQL Server
* **Language:** SQL
* **IDE:** MySQL Workbench / VS Code / SSMS

---

## 📂 How to Run the Project

1. Create the database using:

   ```sql
   CREATE DATABASE University_Cource_Management_System_DC;
   USE University_Cource_Management_System_DC;
   ```

2. Create tables (Departments, Students, Courses, Instructors, Enrollments)

3. Insert sample data

4. Run SELECT queries to view data

5. Perform CRUD operations



---

