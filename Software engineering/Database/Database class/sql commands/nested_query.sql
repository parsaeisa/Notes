SELECT * FROM Grades;

SELECT * FROM students s1
WHERE s1.full_name IN (
    SELECT s2.full_name FROM students s2 
    JOIN grades g ON s2.id = g.student_id
    JOIN courses c ON g.course_id = c.id
    WHERE g.grade < 10
)