# SQL

## Analyzing queries

The `explain` command (before a query) is a tool which shows information about a query. Its usage is like this:
```
explain [query]
```

## Advanced queries

There are some advanced queries which I don't know where the fuck should they be used. 
- `PIVOT` & `UNPIVOT`: This command rotates columns to rows. 
- Recursive
- CTE
- Window function
- Dynamic queries

## Optimizations and best practicing 


I think points in optimization and best practices are the same and they just differ in timing. Optimizations are performed after an insident but best practices are always applied. 

### Join

Joins are more recommended than subqueries. 

In join queries, tables should be ordered in size. Always start with smallest table like this:
```
SELECT *
FROM Table1 -- smallest table
JOIN Table2 ON Table1.ID = Table2.ID -- larger table
JOIN Table3 ON Table1.ID = Table3.ID -- largest table
```

### Selective projection 

Select columns explecitely, avoid using `*` all the time. 


## Transaction

Transaction is a series of actions that should be done together . All of them should be performed or none of them. 

For example, if it has two operations called "operation A" and "operation B" :
- if A is performed so should B . 
- if B is not performed , A should be rolled back.

* Apparently putting multiple inserts in `BEGIN` and `END` to make them as transacitons can speed up queries.

### Transaction isolation level

There are 4 isolation levels for transaction. Each of them differ in the trading off between performance and consistency. 

One of the parts of this trade-off is controlling the read request on rows while a transaction is being committed ( the value of a row can differ in the beginnging and end of a trasnaction commit).

Those 4 levels are:
- Read uncommitted
- Read committed
- Repeatable read
- Serializable

### Transaction in go

In golang we use `sqlx` package to interact with database. 

You can create a transaction using : 
```go
tx, err := d.db.BeginTxx(ctx, nil)
```

Then you can send queries using this `tx`.

There are some other methods that I think should always be called when defining a transaction. 
`tx.Rollback()` and `tx.Commit()` .