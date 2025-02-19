CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    date_of_birth DATE,
    gender VARCHAR(50),
    major VARCHAR(100),
    enrollment_year INT 
    
);

CREATE TABLE  Courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    course_code INT (50),
    credits VARCHAR(100),
    department VARCHAR(50),
    FOREIGN KEY (InstructorID) REFERENCES Instructors(InstructorID)
    
);

CREATE TABLE Instructors (
    instructor_id INT PRIMARY KEY,
    first_name VARCHAR(100),
    last_name VARCHAR(100),
    email VARCHAR(100),
    department VARCHAR(50),
    hire_date DATE
);

CREATE TABLE Enrollments (
    enrollment_id INT PRIMARY KEY,
    student_id INT (50),
    course_id INT (50),
    grade INT (50),
     FOREIGN KEY (StudentID) REFERENCES Students(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Courses(CourseID)
   
);

CREATE TABLE Course Assignments (
    assignment_id INT PRIMARY KEY,
    assignment_id INT (50),
    course_id INT (50),
    semester INT (50),
   year Date (20)
);

INSERT INTO students(student_id, first_name,last_name , email,date_of_birth, gender,major,enrollment_year)  VALUES
(1, 'heba','firas', 'hebafiras@gmail.com' ,'2002-01-15' ,'Female','Computer Science', 2020) 
(2, 'hala','ali','halaali@gmail.com' , '2003-05-11' ,'Female','Mathematics', 2019), 
(3, 'hend','ammar','hendammar@gmail.com' , '2001-03-22' ,'Female','Male', 'Physics', 2018),
(4,'mona','ali','monaali@gmail.com' ,'2000-07-09' ,'Female','Biology', 2021),
(5, 'aya','ali','ayaali@gmail.com' , '2002-11-20','Female','Chemistry', 2020),
(6,'ali','altayeb','alialtayeb@gmail.com' , '2001-09-02' ,'Male', 'Economics', 2019),
(7,'hashem','mohammad','hashemmohammad@gmail.com' , '2001-06-05','Male', 'Psychology', 2020),
(8, 'firas' ,'abdallah','firasabdallah@gmail.com', '2003-02-27' ,'Male','Sociology', 2021),
(9, 'abdallah','momen','abdallahmomen@gmail.com' ,'2000-08-15' ,'Male','Engineering', 2018),
(10,'mohammad','flaah','mohammadflaah@gmail.com' , '2002-04-13' ,'Male','Literature', 2019);



INSERT INTO Instructors(instructor_id, first_name, last_name, email, department, hire_date) VALUES
(1, 'Ahmed', 'Ali', 'ahmed.ali@example.com', 'Computer Science', '2019-02-01'),
(2, 'Sara', 'Hassan', 'sara.hassan@example.com', 'Mathematics', '2020-05-15'),
(3, 'Omar', 'Yousef', 'omar.yousef@example.com', 'Physics', '2018-09-10'),
(4, 'Laila', 'Nasser', 'laila.nasser@example.com', 'Biology', '2021-01-20'),
(5, 'Khalid', 'Zayed', 'khalid.zayed@example.com', 'Chemistry', '2017-11-05');

INSERT INTO  Courses(course_id,course_name,course_code,credits,department,instructor_id) VALUES
(1, 'Introduction to Computer Science', 'CS101', 3, 'Computer Science', 1),
(2, 'Calculus I', 'MATH101', 4, 'Mathematics', 2),
(3, 'Physics I', 'PHYS101', 4, 'Physics', 3),
(4, 'Biology 101', 'BIOL101', 3, 'Biology', 4),
(5, 'General Chemistry', 'CHEM101', 3, 'Chemistry', 5);


INSERT INTO  Enrollments(enrollment_id,student_id,course_id,grade) VALUES
(1, 1, 1, 'A'),
(2, 1, 2, 'B+'),
(3, 2, 3, 'A-'),
(4, 2, 4, 'B'),
(5, 3, 5, 'A'),
(6, 3, 1, 'B+'),
(7, 4, 2, 'A-'),
(8, 4, 3, 'B'),
(9, 5, 4, 'A'),
(10, 5, 5, 'B+'),
(11, 6, 1, 'A-'),
(12, 6, 2, 'B'),
(13, 7, 3, 'A'),
(14, 7, 4, 'B+'),
(15, 8, 5, 'A-'),
(16, 8, 1, 'B'),
(17, 9, 2, 'A'),
(18, 9, 3, 'B+'),
(19, 10, 4, 'A-'),
(20, 10, 5, 'B');


SELECT * FROM Students;

SELECT COUNT(*) AS TotalCourses FROM Courses;

SELECT S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.CourseID = 1;

SELECT S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.CourseID = 2;

SELECT S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.CourseID = 3;

SELECT S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.CourseID = 4;

SELECT S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.CourseID = 5;


SELECT Email
FROM Instructors
WHERE Department = 'Computer Science';
SELECT Email
FROM Instructors
WHERE Department = 'Mathematics';
SELECT Email
FROM Instructors
WHERE Department = 'Physics';
SELECT Email
FROM Instructors
WHERE Department = 'Biology';
SELECT Email
FROM Instructors
WHERE Department = 'Chemistry';




SELECT C.CourseName, COUNT(E.StudentID) AS NumberOfStudents
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
GROUP BY C.CourseName;

SELECT S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.Grade = 'A';

SELECT C.CourseName, I.FirstName, I.LastName
FROM Courses C
JOIN Instructors I ON C.InstructorID = I.InstructorID
WHERE C.Semester = 'Fall 2023';


SELECT AVG(E.Grade) AS AverageGrade
FROM Enrollments E
WHERE E.CourseID = 1;


SELECT S.StudentID, S.FirstName, S.LastName
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
JOIN Courses C ON E.CourseID = C.CourseID
WHERE C.Semester = 'Spring 2025'
GROUP BY S.StudentID, S.FirstName, S.LastName
HAVING COUNT(E.CourseID) > 3;

SELECT S.StudentID, S.FirstName, S.LastName, E.CourseID, E.Grade
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
WHERE E.Grade IS NULL;

SELECT S.StudentID, S.FirstName, S.LastName, AVG(E.Grade) AS AverageGrade
FROM Students S
JOIN Enrollments E ON S.StudentID = E.StudentID
GROUP BY S.StudentID, S.FirstName, S.LastName
ORDER BY AverageGrade DESC
LIMIT 1;

SELECT C.Department, COUNT(C.CourseID) AS NumberOfCourses
FROM Courses C
WHERE YEAR(C.StartDate) = 2025
GROUP BY C.Department
ORDER BY NumberOfCourses DESC
LIMIT 1;

SELECT C.CourseID, C.CourseName
FROM Courses C
LEFT JOIN Enrollments E ON C.CourseID = E.CourseID
WHERE E.CourseID IS NULL;