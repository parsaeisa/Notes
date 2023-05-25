drop table if exists dbo.Students ;
CREATE table Students (
	id int primary key,
	full_name varchar(255) not null,
	major varchar(255) not null,
);
drop table if exists dbo.Courses ;
create table Courses (
	id int primary key,	
	course_name VARCHAR(255) not NULL,
);
drop table if exists dbo.Grades ;
create table Grades (
	id int primary key,
	student_id int,
	foreign key (student_id) references Students(id) on delete cascade on update cascade,
	course_id int, 
	foreign key (course_id) references Courses(id) on delete cascade on update cascade,
	grade float
);