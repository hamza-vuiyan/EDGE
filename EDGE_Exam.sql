1.
CREATE TABLE Students (
    student_id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    dob DATE,
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

2.
INSERT INTO Students (student_id, name, email, dob, department_id)
VALUES 
(101, 'John Doe', 'john@example.com', '2002-06-15', 2),
(102, 'Jane Smith', 'jane@example.com', '2001-10-30', 1);

3.
SELECT * 
FROM Students
WHERE dob > '2002-01-01'
ORDER BY name DESC;

4.
SELECT department_id, COUNT(*) AS total_students
FROM Students
GROUP BY department_id;

5.
DELETE FROM Students
WHERE dob < '2000-01-01';

6.
SELECT s.name, d.department_name
FROM Students s
JOIN Departments d ON s.department_id = d.department_id;

7.
SELECT c.course_name, AVG(e.grade) AS average_grade
FROM Enrollments e
JOIN Courses c ON e.course_id = c.course_id
GROUP BY c.course_name
HAVING AVG(e.grade) > 3.0;

8.
SELECT s.*
FROM Students s
LEFT JOIN Enrollments e ON s.student_id = e.student_id
WHERE e.enrollment_id IS NULL;

9.
SELECT c.course_name, COUNT(e.student_id) AS student_count
FROM Courses c
LEFT JOIN Enrollments e ON c.course_id = e.course_id
GROUP BY c.course_name
ORDER BY student_count DESC;

10.
SELECT s.student_id, s.name, e.course_id, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
WHERE e.grade > (
    SELECT AVG(e2.grade)
    FROM Enrollments e2
    WHERE e2.course_id = e.course_id
);

