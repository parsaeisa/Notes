SELECT s.full_name, AVG(g.grade)  FROM students s 
JOIN grades g ON s.id = g.student_id
JOIN courses c ON g.course_id = c.id
GROUP BY s.full_name
ORDER BY  s.full_name;