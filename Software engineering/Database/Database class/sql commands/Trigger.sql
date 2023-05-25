create or ALTER TRIGGER AnnounceGradeAdd 
ON Grades
AFTER INSERT 
AS
BEGIN 
    SELECT "New grade has been added."
END

insert into Grades (id, student_id, course_id, grade) values (8, 3, 10, 20);
