create function calculateGPA(@student_name varchar(255))
returns table
return 
(
    SELECT s.full_name, AVG(g.grade) as GPA FROM students s 
    JOIN grades g ON s.id = g.student_id
    WHERE s.full_name = @student_name
    GROUP BY s.full_name    
)

GO
SELECT * from calculateGPA('Billy')