# Database class

Here you can see my teaching roadmap for Fundamentals of Database Design course. I was teacher assistant in this course for 1 semester, I was responsible to teach students topics about Advanced SQL.

Topics: 
* Nested Query
* Trigger
* Constraint
* View
* Function
* Stored Procedure
* Schema (?)

# Teaching roadmap

Seeds are available in [seeds]().

[Showing students how to work with `mockaroo` ]

We want to create an application database. 

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

## Join
The output of a `join` command is a bigger table that has records of more than 1 table.

Here is a division on Join command in sql: 
* Inner
* Outer
    * Left
    * Right

### Problem

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

## Assertion

## Triggers

## Function

## Stored procedure

## View

## Other commands 
### ALTER

### DROP