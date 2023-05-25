SELECT c.course_name, COUNT(*)  FROM students s 
JOIN grades g ON s.id = g.student_id
JOIN courses c ON g.course_id = c.id
GROUP BY c.course_name ;