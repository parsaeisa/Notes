SELECT s.full_name, AVG(g.grade) AS GPA  FROM students s 
JOIN grades g ON s.id = g.student_id
GROUP BY s.full_name
HAVING g.grade <= 15 ;