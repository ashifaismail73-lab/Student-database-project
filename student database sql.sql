CREATE DATABASE Student_Database_Management;

USE Student_Database_Management;
CREATE TABLE Department (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    hod_name VARCHAR(100)
);
DESCRIBE Department;
CREATE TABLE Student (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    student_name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    gender VARCHAR(10),
    phone VARCHAR(15),
    email VARCHAR(100),
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
DESCRIBE Student;
CREATE TABLE Course (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) NOT NULL UNIQUE,
    credits INT NOT NULL,
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);
DESCRIBE Course;
CREATE TABLE Enrollment (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    semester INT,
    grade VARCHAR(5),
    FOREIGN KEY (student_id) REFERENCES Student(student_id),
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

DESCRIBE Enrollment;
CREATE TABLE Marks (
    mark_id INT PRIMARY KEY AUTO_INCREMENT,
    enrollment_id INT NOT NULL,
    internal_marks DECIMAL(5,2),
    external_marks DECIMAL(5,2),
    total_marks DECIMAL(5,2),
    FOREIGN KEY (enrollment_id) REFERENCES Enrollment(enrollment_id)
);

DESCRIBE Marks;
USE Student_Database_Management;

CREATE TABLE Faculty (
    faculty_id INT PRIMARY KEY AUTO_INCREMENT,
    faculty_name VARCHAR(100) NOT NULL,
    designation VARCHAR(50),
    phone VARCHAR(15),
    email VARCHAR(100),
    department_id INT NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Department(department_id)
);

DESCRIBE Faculty;
USE Student_Database_Management;

CREATE TABLE Examination (
    exam_id INT PRIMARY KEY AUTO_INCREMENT,
    exam_name VARCHAR(100) NOT NULL,
    exam_type VARCHAR(50),
    exam_date DATE,
    course_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES Course(course_id)
);

DESCRIBE Examination;
INSERT INTO Department (department_name, hod_name)
VALUES
('Computer Applications', 'Dr. Ramesh Kumar'),
('Computer Science', 'Dr. Priya Sharma'),
('Information Technology', 'Dr. Arun Kumar'),
('Commerce', 'Dr. Meena Devi'),
('Mathematics', 'Dr. Suresh Babu');
SELECT * FROM Department;
INSERT INTO Student
(student_name, date_of_birth, gender, phone, email, department_id)
VALUES
('Ananya Raj', '2004-05-12', 'Female', '9876543210', 'ananya@gmail.com', 1),
('Arjun Kumar', '2003-08-21', 'Male', '9876543211', 'arjun@gmail.com', 1),
('Meera Nair', '2004-01-15', 'Female', '9876543212', 'meera@gmail.com', 2),
('Rahul Das', '2003-11-30', 'Male', '9876543213', 'rahul@gmail.com', 2),
('Sneha Thomas', '2004-07-09', 'Female', '9876543214', 'sneha@gmail.com', 3),
('Vishnu Menon', '2003-03-18', 'Male', '9876543215', 'vishnu@gmail.com', 3),
('Keerthana S', '2004-09-25', 'Female', '9876543216', 'keerthana@gmail.com', 1),
('Adithya P', '2003-12-05', 'Male', '9876543217', 'adithya@gmail.com', 4),
('Fathima Ali', '2004-06-14', 'Female', '9876543218', 'fathima@gmail.com', 1),
('Naveen Kumar', '2003-10-11', 'Male', '9876543219', 'naveen@gmail.com', 5);
SELECT * FROM Student;
INSERT INTO Course
(course_name, course_code, credits, department_id)
VALUES
('Database Management Systems', 'BCA301', 4, 1),
('Web Technology', 'BCA302', 4, 1),
('Python Programming', 'BCA303', 4, 1),
('Computer Networks', 'BCA304', 3, 1),
('Operating Systems', 'BCA305', 4, 1),
('Data Structures', 'CSC301', 4, 2),
('Java Programming', 'CSC302', 4, 2),
('Information Security', 'IT301', 3, 3),
('Financial Accounting', 'COM301', 4, 4),
('Discrete Mathematics', 'MAT301', 4, 5);
SELECT * FROM Course;
INSERT INTO Enrollment
(student_id, course_id, enrollment_date, semester, grade)
VALUES
(1, 1, '2026-06-10', 5, 'A'),
(1, 2, '2026-06-10', 5, 'A'),
(1, 3, '2026-06-10', 5, 'B+'),
(2, 1, '2026-06-11', 5, 'B+'),
(2, 4, '2026-06-11', 5, 'A'),
(3, 6, '2026-06-12', 5, 'A'),
(3, 7, '2026-06-12', 5, 'A'),
(4, 6, '2026-06-12', 5, 'B'),
(4, 7, '2026-06-12', 5, 'B+'),
(5, 8, '2026-06-13', 5, 'A'),
(6, 8, '2026-06-13', 5, 'B+'),
(7, 1, '2026-06-14', 5, 'A'),
(7, 5, '2026-06-14', 5, 'A'),
(8, 9, '2026-06-15', 5, 'B+'),
(9, 1, '2026-06-15', 5, 'A+'),
(9, 3, '2026-06-15', 5, 'A'),
(10, 10, '2026-06-16', 5, 'A');
SELECT * FROM Enrollment;
INSERT INTO Marks
(enrollment_id, internal_marks, external_marks, total_marks)
VALUES
(1, 24, 68, 92),
(2, 22, 64, 86),
(3, 20, 61, 81),
(4, 21, 60, 81),
(5, 23, 67, 90),
(6, 25, 70, 95),
(7, 24, 66, 90),
(8, 19, 58, 77),
(9, 22, 63, 85),
(10, 25, 69, 94),
(11, 21, 62, 83),
(12, 24, 71, 95),
(13, 23, 68, 91),
(14, 20, 59, 79),
(15, 25, 73, 98),
(16, 23, 67, 90),
(17, 24, 70, 94);
SELECT * FROM Marks;
INSERT INTO Faculty
(faculty_name, designation, phone, email, department_id)
VALUES
('Dr. Ramesh Kumar', 'Professor', '9876500010', 'ramesh@college.com', 1),
('Dr. Priya Sharma', 'Associate Professor', '9876500011', 'priya@college.com', 2),
('Dr. Arun Kumar', 'Assistant Professor', '9876500012', 'arun@college.com', 3),
('Dr. Meena Devi', 'Professor', '9876500013', 'meena@college.com', 4),
('Dr. Suresh Babu', 'Associate Professor', '9876500014', 'suresh@college.com', 5),
('Prof. Kavitha Raj', 'Assistant Professor', '9876500015', 'kavitha@college.com', 1),
('Prof. Manoj Das', 'Assistant Professor', '9876500016', 'manoj@college.com', 2);
SELECT * FROM Faculty;
INSERT INTO Examination
(exam_name, exam_type, exam_date, course_id)
VALUES
('Database Management Systems Exam', 'End Semester', '2026-11-10', 1),
('Web Technology Exam', 'End Semester', '2026-11-12', 2),
('Python Programming Exam', 'End Semester', '2026-11-15', 3),
('Computer Networks Exam', 'End Semester', '2026-11-18', 4),
('Operating Systems Exam', 'End Semester', '2026-11-20', 5),
('Data Structures Exam', 'End Semester', '2026-11-22', 6),
('Java Programming Exam', 'End Semester', '2026-11-25', 7),
('Information Security Exam', 'End Semester', '2026-11-27', 8),
('Financial Accounting Exam', 'End Semester', '2026-11-29', 9),
('Discrete Mathematics Exam', 'End Semester', '2026-12-02', 10);
SELECT * FROM Examination;
UPDATE Student
SET phone = '9998887770'
WHERE student_id = 1;
SELECT * FROM Student
WHERE student_id = 1;
INSERT INTO Student
(student_name, date_of_birth, gender, phone, email, department_id)
VALUES
('Ayesha Rahman', '2004-02-20', 'Female', '9876543220', 'ayesha@gmail.com', 1);
DELETE FROM Student
WHERE student_id = 11;
SELECT * 
FROM Student
WHERE department_id = 1;
SELECT *
FROM Student
ORDER BY student_name DESC;
SELECT *
FROM Student
WHERE student_name LIKE 'A%';
SELECT *
FROM Student
WHERE date_of_birth BETWEEN '2004-01-01' AND '2004-12-31';
SELECT COUNT(*) AS total_records
FROM Marks;
SELECT SUM(total_marks) AS total_marks
FROM Marks;
SELECT AVG(total_marks) AS average_marks
FROM Marks;
SELECT MAX(total_marks) AS highest_marks
FROM Marks;
SELECT MIN(total_marks) AS lowest_marks
FROM Marks;
SELECT department_id, COUNT(*) AS total_students
FROM Student
GROUP BY department_id;
    SELECT * FROM Department;
    SELECT * FROM Student;
    SELECT * FROM Course;
    SELECT * FROM Enrollment;
    SELECT * FROM Marks;
    SELECT * FROM Faculty;
    SELECT * FROM Examination;
    INSERT INTO Student
(student_name, date_of_birth, gender, phone, email, department_id)
VALUES
('Rahul Menon', '2004-02-20', 'Male', '9876543220', 'rahul.menon@gmail.com', 1);
UPDATE Student
SET phone = '9998887770'
WHERE student_id = 1;
DELETE FROM Student
WHERE student_id = 11;
SELECT
    Student.student_name,
    Course.course_name,
    Enrollment.semester,
    Enrollment.grade
FROM Student
INNER JOIN Enrollment
    ON Student.student_id = Enrollment.student_id
INNER JOIN Course
    ON Enrollment.course_id = Course.course_id;
    SELECT 'Department' AS table_name, COUNT(*) AS total_records
FROM Department

UNION ALL

SELECT 'Student', COUNT(*)
FROM Student

UNION ALL

SELECT 'Course', COUNT(*)
FROM Course

UNION ALL

SELECT 'Enrollment', COUNT(*)
FROM Enrollment

UNION ALL

SELECT 'Marks', COUNT(*)
FROM Marks

UNION ALL

SELECT 'Faculty', COUNT(*)
FROM Faculty

UNION ALL

SELECT 'Examination', COUNT(*)
FROM Examination;