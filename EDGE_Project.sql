11.
CREATE VIEW TopStudents AS
SELECT s.student_id, s.name, AVG(e.grade) AS average_grade
FROM Students s
JOIN Enrollments e ON s.student_id = e.student_id
GROUP BY s.student_id, s.name
HAVING AVG(e.grade) > 3.5;

12.
CREATE OR REPLACE PROCEDURE Increase_Grades_By_Course(p_course_id IN NUMBER) AS
BEGIN
    UPDATE Enrollments
    SET grade = CASE 
                  WHEN grade + 0.5 > 4.0 THEN 4.0 
                  ELSE grade + 0.5 
                END
    WHERE course_id = p_course_id;
    
    COMMIT;
END;
/

13.
SELECT s.student_id, s.name, e.course_id, e.grade
FROM Enrollments e
JOIN Students s ON e.student_id = s.student_id
WHERE e.grade = (
    SELECT MAX(e2.grade)
    FROM Enrollments e2
    WHERE e2.course_id = e.course_id
);


Part-B

SELECT d.department_name,
       COUNT(DISTINCT s.student_id) AS total_students,
       ROUND(AVG(e.grade), 2) AS average_grade,
       COUNT(DISTINCT c.course_id) AS number_of_courses
FROM Departments d
JOIN Students s ON d.department_id = s.department_id
JOIN Enrollments e ON s.student_id = e.student_id
JOIN Courses c ON d.department_id = c.department_id
GROUP BY d.department_name
HAVING COUNT(DISTINCT c.course_id) >= 2
ORDER BY average_grade DESC;

