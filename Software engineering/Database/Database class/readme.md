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

We want to create an application database. 

## Nested query

topics: 
* Join 
* Qroup by 
* Aggregate function

Each query takes a table as input and returns **another table** in return.

In nested query, we write a query the output of a former query.

We connect these two tables with the world `IN`.

## Common templates for nested query
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