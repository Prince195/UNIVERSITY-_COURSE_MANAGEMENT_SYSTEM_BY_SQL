CREATE DATABASE University_Course_Management_System_DC;
USE University_Course_Management_System_DC;

CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(30)
);

CREATE TABLE Students (
    StudentID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(40),
    BirthDate DATE,
    EnrollmentDate DATE
);

CREATE TABLE Courses (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(40),
    DepartmentID INT,
    Credits INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Instructors (
    InstructorID INT PRIMARY KEY,
    FirstName VARCHAR(20),
    LastName VARCHAR(20),
    Email VARCHAR(40),
    DepartmentID INT,
    Salary INT,
    FOREIGN KEY (DepartmentID) REFERENCES Departments(DepartmentID)
);

CREATE TABLE Enrollments (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    EnrollmentDate DATE,
    FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
);

INSERT INTO Departments VALUES
(1,'Data Science'),
(2,'Statistics'),
(3,'PBL'),
(4,'Mechanical'),
(5,'Civil Engineering');

INSERT INTO Students VALUES
(1,'Prince','Prajapati','prince1@gmail.com','2001-01-12','2022-08-01'),
(2,'Aarav','Shah','aarav@gmail.com','2000-02-15','2021-08-01'),
(3,'Riya','Patel','riya@gmail.com','2001-03-18','2023-01-10'),
(4,'Neel','Mehta','neel@gmail.com','1999-04-20','2020-08-01'),
(5,'Khushi','Joshi','khushi@gmail.com','2002-05-25','2023-08-01'),
(6,'Yash','Desai','yash@gmail.com','2001-06-10','2022-08-01'),
(7,'Nidhi','Sharma','nidhi@gmail.com','2000-07-05','2021-08-01'),
(8,'Harsh','Verma','harsh@gmail.com','2001-08-09','2023-08-01'),
(9,'Pooja','Rathod','pooja@gmail.com','1999-09-22','2020-08-01'),
(10,'Meet','Gandhi','meet@gmail.com','2002-10-30','2022-08-01');

INSERT INTO Courses VALUES
(101,'Introduction to SQL',1,3),
(102,'Python Programming',2,4),
(103,'Data Structures',1,3),
(104,'Linear Algebra',5,4),
(105,'Discrete Mathematics',3,3),
(106,'AI/ML',4,3),
(107,'DATA Analyst',1,4),
(108,'Data science',5,3),
(109,'Cyber Security',2,3),
(110,'LLM',4,4);

INSERT INTO Instructors VALUES
(1,'Ramesh','Iyer','ramesh@univ.com',1,75000),
(2,'Anita','Sharma','anita@univ.com',2,72000),
(3,'Suresh','Patel','suresh@univ.com',3,70000),
(4,'Vikas','Mehta','vikas@univ.com',4,68000),
(5,'Neha','Joshi','neha@univ.com',5,65000),
(6,'kalpesh','goswami','kalpeshh@univ.com',1,75000),
(7,'raju','Sharma','raju@univ.com',2,72000),
(8,'Ranjeet','Patel','Ranjeet@univ.com',3,70000),
(9,'shiv','Rathod','shiv@univ.com',4,68000),
(10,'Priyanshu','Lakhani','Priyanshu@univ.com',5,65000);

INSERT INTO Enrollments VALUES
(1,1,101,'2022-08-01'),
(2,2,102,'2021-08-01'),
(3,3,103,'2023-01-10'),
(4,4,104,'2020-08-01'),
(5,5,105,'2023-08-01'),
(6,6,106,'2022-08-01'),
(7,7,107,'2021-08-01'),
(8,8,108,'2023-08-01'),
(9,9,109,'2020-08-01'),
(10,10,110,'2022-08-01'),
(11,2,101,'2021-08-01'),
(12,3,101,'2022-08-01'),
(13,4,101,'2023-08-01'),
(14,5,101,'2020-08-01'),
(15,6,101,'2023-08-01'),
(16,7,101,'2024-08-01');


SELECT * FROM Students;

SELECT * FROM Courses;

SELECT * FROM Instructors;

SELECT * FROM Enrollments;

# 1. ----------CRUD----------

-- 1. CRUD ON Departments
-- CREATE
INSERT INTO Departments VALUES (6,'ARTS');

-- READ
SELECT * FROM Departments;

-- UPDATE
UPDATE Departments
SET DepartmentName='science'
WHERE DepartmentID=6;

-- DELETE
DELETE FROM Departments
WHERE DepartmentID=6;

-- 2.CRUD ON Students
-- CREATE
INSERT INTO Students VALUES
(11,'PRINCE','PRAJAPATI','PRINCE@gmail.com','2001-05-15','2024-02-10');

-- READ
SELECT * FROM Students;

-- UPDATE
UPDATE Students
SET FirstName='RAJ'
WHERE StudentID=11;

-- DELETE
DELETE FROM Students
WHERE StudentID=11;

-- 3. CRUD ON Courses
-- CREATE
INSERT INTO Courses VALUES (111,'Deep Learning',1,4);

-- READ
SELECT * FROM Courses;

-- UPDATE
UPDATE Courses
SET Credits=5
WHERE CourseID=111;

-- DELETE
DELETE FROM Courses
WHERE CourseID=111;

-- 4. CRUD ON Instructors
-- CREATE
INSERT INTO Instructors VALUES
(11,'GOPAL','MAKWANA','GOPAL@univ.com',1,70000);

-- READ
SELECT * FROM Instructors;

-- UPDATE
UPDATE Instructors
SET Salary=95000
WHERE InstructorID=11;

-- DELETE
DELETE FROM Instructors
WHERE InstructorID=11;

-- 5. CRUD ON Enrollments
-- CREATE
INSERT INTO Enrollments VALUES (11,1,101,'2024-03-01');

-- READ
SELECT * FROM Enrollments;

-- UPDATE
UPDATE Enrollments
SET CourseID=102
WHERE EnrollmentID=11;

-- DELETE
DELETE FROM Enrollments
WHERE EnrollmentID=11;

#  2. Retrieve students enrolled after 2022

SELECT * FROM Students
WHERE EnrollmentDate > '2022-12-31';

# 3. Retrieve courses offered by the Mathematics department with a limit of 5 courses.

SELECT * FROM Courses
WHERE DepartmentID=2
LIMIT 5;

# 4. Get the number of students enrolled in each course, filtering for courses with more than 5 students.

SELECT c.CourseId,c.CourseName, COUNT(e.StudentId) AS Total_Student
FROM Courses AS c
INNER JOIN Enrollments AS e
ON c.CourseId = e.CourseId
GROUP BY c.CourseId, c.CourseName
HAVING COUNT(e.StudentId) > 5;

#  5. Find students who are enrolled in both Introduction to SQL and Data Structures.

SELECT StudentId, FirstName, LastName
FROM Students
WHERE StudentId IN
(SELECT StudentId
    FROM Enrollments
    WHERE CourseId IN (101,102)
    GROUP BY StudentId
    HAVING COUNT(DISTINCT CourseId) = 2);
    
# 6. Find students who are either enrolled in Introduction to SQL or Data Structures.

SELECT DISTINCT s.StudentId, s.FirstName, s.LastName 
FROM Students AS s
JOIN Enrollments AS e
ON s.StudentId = e.StudentId
WHERE e.CourseId IN (101,102);

#  7. Calculate the average number of credits for all courses.

SELECT AVG(Credits) AS AverageCredits FROM Courses;

#  8. Find the maximum salary of instructors in the Computer Science department.

SELECT MAX(i.Salary) AS MAX_SALARY
FROM Instructors i
JOIN Departments d
ON i.DepartmentID = d.DepartmentID
WHERE d.DepartmentName = 'Data Science';

# 9. Count the number of students enrolled in each department.

SELECT d.DepartmentName, COUNT(DISTINCT e.StudentID) AS TotalStudents
FROM Departments d
JOIN Courses c ON d.DepartmentID = c.DepartmentID
JOIN Enrollments e ON c.CourseID = e.CourseID
GROUP BY d.DepartmentName;

# 10. INNER JOIN: Retrieve students and their corresponding courses.

SELECT s.StudentId,s.FirstName,s.LastName,c.CourseName
FROM Students s
INNER JOIN Enrollments e 
ON s.StudentId = e.StudentId
INNER JOIN Courses c
ON e.CourseId = c.CourseId;


# 11. LEFT JOIN: Retrieve all students and their corresponding courses, if any.

SELECT s.StudentId,s.FirstName,s.LastName,c.CourseName
FROM Students s
LEFT JOIN Enrollments e 
ON s.StudentId = e.StudentId
LEFT JOIN Courses c
ON e.CourseId = c.CourseId;


# 12. Subquery: Find students enrolled in courses that have more than 5 students

SELECT StudentID, FirstName, LastName
FROM Students
WHERE StudentID IN (
    SELECT e.StudentID
    FROM Enrollments e
    WHERE e.CourseID IN (
        SELECT CourseID
        FROM Enrollments
        GROUP BY CourseID
        HAVING COUNT(StudentID) > 5
        )
);
# 13. Extract the year from the EnrollmentDate of students.

SELECT StudentId,FirstName,LastName,
YEAR(EnrollmentDate) AS Enroll_year
FROM Students;

# 14. Concatenate the instructor's first and last name.

SELECT InstructorId, CONCAT(FirstName,' ',LastName) AS Fullname
FROM Instructors;

# 15. Calculate the running total of students enrolled in courses.

SELECT  EnrollmentID, CourseID, COUNT(StudentID) 
OVER (ORDER BY EnrollmentID) AS RunningTotalStudents
FROM Enrollments;

# 16. Label students as 'Senior' or 'Junior' based on their year of enrollment.

SELECT StudentID, FirstName, LastName, EnrollmentDate,
CASE
WHEN YEAR(EnrollmentDate) <= 2022 THEN 'Senior'
ELSE 'Junior'
END AS StudentLevel
FROM Students;

