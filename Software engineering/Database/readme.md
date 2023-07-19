# Database

Topics :
- [Database design](https://github.com/parsaeisa/Notes/tree/main/Software%20engineering/Database#database-design)
- [Highly availability](https://github.com/parsaeisa/Notes/tree/main/Software%20engineering/Database#highly-availability)
- [Sharding](https://github.com/parsaeisa/Notes/tree/main/Software%20engineering/Database#sharding)
- [Data structures](https://github.com/parsaeisa/Notes/tree/main/Software%20engineering/Database#data-structures)
- [Row-oriented and Column-oriented](https://github.com/parsaeisa/Notes/tree/main/Software%20engineering/Database#row-oriented-and-column-oriented)
- [Transaction](https://github.com/parsaeisa/Notes/tree/main/Software%20engineering/Database#transaction)

To Learn :
- cassandra
- mongo
- postgre sql
- influxdb
- elastic search
- Clickhouse
- Snowflake
- database design principles
- Big database design and query
- traffic and data migration
- What's happening in database ? 
- What is bulk insert 

## Database design

Don't store a single value in more than one place ( multiple records or tables ) in database --> it denies **redundancy** .

### Query design 
Group by and aggregate functions can be so heavy for database.

But sometimes we need these actions in our query. So there must be a way to simulate this actions .

- Chunkenized -> as aggregation function
- Local map -> as group by
- select for update -> as database lock

We use **Bulk** term when we want to insert or read high count of records to or from a database.

#### Chunkenized
I think this is using `limit` and `offset` in query.

#### Select for update

Consider in a table that contains shoppings we want to count the  you want to count It locks a record 

#### Select query to a big table

Sometimes you have an enormous table with tons of records. A simple select query to this table is not possible and may cause the database to crash. 

I think **Limit Offset** is a way to tackle this issue.

### A Trick
consider you have a table which has the records of ali's each objects count , a table like this :

| char  | object_1_counts | object_2_counts | object_3_counts |
|-------|-----------------|-----------------|-----------------|
|  ali  |     45          |     4500        |     450         |

If a new object is added , you need a new migration and your database would be crushed .
Thus you need to change the structure of your tables , you can convert it to the structure below :

| char  |      object       | count   |
|-------|-------------------|---------|
|  ali  |     object_1      |  4500   |
|  ali  |     object_2      |  4500   |
|  ali  |     object_3      |  4500   |

Now a new object and its count would be a new record in your database .

## Highly availability
* redis sentinel
* sharding in MySQL or mariadb

Consider in k8s you deployed 3 replicas of a database:
* Each replica differs from others.
* They should have same order while creating and tearing down
* they should constantly communicate with each other to be synchronized. 
* We should be able to backup their data.

These operations are performed differntly in MySQL, PostgreSQL & elasticsearch for example. 

There is no solution for doing this and we cannot automate in kubernetes. 

## Sharding
I think sharding is an operation on Datas . Some criterion is used to partition the data among the different set of slave/master databases . 

## Data structures 
Databases need to store large amount of data on disk and retrieve data from them very fast. That's why they use
specific and new data structures. 

https://www.youtube.com/watch?v=W_v05d_2RTo

> I think most of these databases turn an array to a tree.

### Skiplist
It kinda uses the idea of binary search. 

It sorts the array and by finding the pivot of array it finds the desirable element. 

![Skiplist](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Database/images/skiplist.png)

## Row-oriented and Column-oriented

The Column-oriented DBMS, stores the values in a certain column together. For example disk 1 for id column's values, disk 2 for name column and etc.

Common column-based databases : 
- Redshift
- BigQuery
- Snowflake

## Transaction

Transaction is a series of actions that should be done together . All of them should be performed or none of them. 

For example, if it has two operations called "operation A" and "operation B" :
- if A is performed so should B . 
- if B is not performed , A should be rolled back.

### Transaction in go

In golang we use `sqlx` package to interact with database. 

You can create a transaction using : 
```go
tx, err := d.db.BeginTxx(ctx, nil)
```

Then you can send queries using this `tx`.

There are some other methods that I think should always be called when defining a transaction. 
`tx.Rollback()` and `tx.Commit()` .
