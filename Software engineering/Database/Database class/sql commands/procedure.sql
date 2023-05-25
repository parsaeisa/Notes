CREATE OR ALTER PROCEDURE GetTopStudentsInCourse
    @course_name VARCHAR(255)
AS
BEGIN
    SELECT TOP 3 s.full_name, c.course_name ,g.grade  FROM students s 
    JOIN grades g ON s.id = g.student_id
    JOIN courses c ON g.course_id = c.id
    WHERE c.course_name = @course_name
    ORDER BY g.grade DESC
END

-- Manual execution
GO
EXEC GetTopStudentsInCourse @course_name = 'Support'