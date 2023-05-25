alter table Grades
ADD CONSTRAINT grade_check CHECK (grade <= 20)

insert into Grades (id, student_id, course_id, grade) values (10, 6, 2, 26);
-- This action will be terminated by the DBMS