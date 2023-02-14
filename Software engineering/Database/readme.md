# Database

To Learn :
- cassandra
- mongo
- postgre sql
- influxdb

## Database design

Don't store a single value in more than one place ( multiple records or tables ) in database --> it denies **redundancy** .

#### A Trick
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

## Sharding
I think sharding is an operation on Datas . Some criterion is used to partition the data among the different set of slave/master databases . 

### Indexing in mariadb 
https://www.techonthenet.com/mariadb/indexes.php

## Marida db vs postgresql 
Movie this section to a new .md file . 

https://mariadb.com/kb/en/lock-tables/

https://mariadb.com/kb/en/how-to-lock-a-specific-row-for-write-or-read-purpose/

https://mariadb.com/kb/en/select/#lock-in-share-mode-and-for-update-clauses

https://mariadb.com/kb/en/for-update/

https://www.postgresql.org/docs/current/explicit-locking.html#LOCKING-ROWS

https://www.postgresql.org/docs/current/explicit-locking.html

## Data structures 
Databases need to store large amount of data on disk and retrieve data from them very fast. That's why they use
specific and new data structures. 

https://www.youtube.com/watch?v=W_v05d_2RTo

> I think most of these databases turn an array to a tree.

### Skiplist
It kinda uses the idea of binary search. 

It sorts the array and by finding the pivot of array it finds the desirable element. 

![Skiplist](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Database/images/skiplist.png)
