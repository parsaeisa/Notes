# Database

To Learn :
- cassandra
- mongo
- postgre sql

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

### Indexing in mariadb 
https://www.techonthenet.com/mariadb/indexes.php
