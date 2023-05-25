SELECT s.full_name, c.course_name ,g.grade  FROM students s 
JOIN grades g ON s.id = g.student_id
JOIN courses c ON g.course_id = c.id ;