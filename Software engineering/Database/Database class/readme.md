# Database class

Here you can see my teaching roadmap for Fundamentals of Database Design course. I was teacher assistant in this course for 1 semester, I was responsible to teach students topics about Advanced SQL.

Topics: 
* Nested Query
* Trigger
* View
* Function
* Stored Procedure
* Schema (?)

## Teaching roadmap

Seeds are available in [seeds]().

[Showing students how to work with `mockaroo` ]

We want to create an application database. 

Design a database system for a university, Which contains 3 tables:
* Students : id, name, major
* Courses : id, course_name, credit_hours
* Grades : id, student_id, course_id, grade

## Nested query

topics: 
* Join 
* Qroup by 
* Aggregate function

Each query takes a table as input and returns **another table** in return.

In nested query, we write a query the output of a former query.

We connect these two tables with the world `IN`.

### Common templates for nested query
```
[First query] 
WHERE [a tuple or a column name] IN [Second query]
```
We can use **math operators**.

```
[First query] 
WHERE [a column] [operator] ALL [Second query]
```

When **existance** is a factor:
```
[First query] 
WHERE EXISTS [Second query]
```

### Naming columns 

We can change the names of columns and tables for easier use. 

For naming a column or a table we use the word `AS`.

```SQL
SELECT E.Lname AS Employee_name, S.Lname AS Supervisor_name
FROM EMPLOYEES  AS E, EMPLOYEES AS S
WHERE E.Super_ssn=S.snn;
```

### Problem
In our scenario, we can write a Nested query for retrieving the name of students that have failed in a course.

``` SQL

```

## Join
The output of a `join` command is a bigger table that has records of more than 1 table.

Here is a division on Join command in sql: 
* Inner
* Outer
    * Left
    * Right

### Problem
Write a query that shows students grades associated with their course.
```SQL
SELECT * FROM students s
JOIN grades g on s.id = g.student_id 
JOIN courses c on g.course_id = c.id
```

## Aggregate functions

Aggregate : form or group into a class or cluster. (v) - from google translate

An aggregate function, takes a table as input and returns a table with less then or equal count of rows.

There are some Aggregate functions in sql (subset of functions that we'll learn about).

The pattern of using aggregate functions:
```
SELECT [columns or functions - seperated by comma] FROM [table_name]
[other queries]
GROUP BY [column name];
```

### Usefull aggregate functions
* COUNT
* SUM
* MAX
* MIN
* AVG

Like functions in all programming languages, these functions are followed by paranthesis `()` which has the inputs. 

These inputs are column names.

An example:
```SQL

```

### Having
`HAVING` is oftenly used for filtering some founded records.

### Problem

## Summary 
```
SELECT <attribute and function list>
FROM <table list>
[WHERE <conditions>]
[GROUPBY <grouping attribute>]
[HAVING <group condition>]
[ORDER BY <attribute list>]
```

## Syntax

In this syntax instead of `{}` we put `BEGIN` & `END`.


### If
```
IF ([condition])
BEGIN
    [commands] [followed by ";"]
END
ELSE
BEGIN
    [commands] [followed by ";"]
END
```

### Creating a variable:
```
DECLARE @[variable name] [type];
```

We give value to these variables by `SELECT` command.

### While 

```SQL
WHILE [condition]
BEGIN
    [operations]
END
```

## Assertion
Defining template:
```
CREATE ASSERTION [assertion name]
CHECK ([checking commands] ([queries]))
```

But in **MSSQL** we don't have any `ASSERTION`.

In MSSQL, we can add constraints by `ALTER` command.

In our scenario, we can create an assertion that ensures no grade goes above 20.
```SQL
alter table Grades
ADD CONSTRAINT grade_check CHECK (grade <= 20)
```

Now, if we add a grade higher than 20 to our database, the DBMS will terminate that request. In this case the DBMS returned this error : 
> The INSERT statement conflicted with the CHECK constraint "grade_check". The conflict occurred in database "master", table "dbo.Grades", column 'grade'.
The statement has been terminated.

## Triggers

```
CREATE TRIGGER [name]
ON [table name]
AFTER [commands - like update, insert]
AS
BEGIN
    [variables]
    [query]
END
```

Example: 

In our scenario, we can create a trigger called `UpdateGPA` that fires whenever a new grade is inserted into the `Grades` table. This trigger automatically updates the student's GPA by calling the `CalculateGPA` function.

```SQL

```

## Function
Similar to other commands, Functions have queries in themeselves and are used in queries.

They are used like other functions like `COUNT`, `SUM`, etc.

Defining a function: 
``` 
create function [name]([arguments])
return [output type]
return
(

)
```

Example:

In our scenrio, we can write a function called `CalculateGPA` that takes a student ID as a parameter and calculates the student's Grade Point Average (GPA) based on the grades they have received.
```SQL

```

## Stored procedure
Creating command template : 
```
CREATE PROCEDURE [name]
    [arguments]
AS
BEGIN
    [query]
END
```
 
Using: 

Example:

For out scenario, we can write a procedure called `GetTopStudentsInCourse` that takes a course name as a parameter and returns the top three students with the highest grades in that course.
```SQL

```

## View
It is a saved query that can be treated like a table.
View is an abstraction layer that can be used to control access. It can encapsulate complicated join logics in itself.
Defining template :
```
CREATE VIEW [view name] AS [Queries]
```
<!-- ## Other commands 
### ALTER

### DROP -->