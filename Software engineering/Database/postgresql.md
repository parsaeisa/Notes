# Posgtres

Postgre sql has a MVCC architecture . 

It has something called **Materallized view** and it has operator in k8s I guess and it's more preferable than MySql.

## Commands 

`TRUNCATE` Empties one or set of tables .

It acts llike `DELETE` but it has some advantages : 
* It is faster because it doesn;t scan the table . 
* It reclaims the disk space immediately instead of requiring a subsequent `VACUUM` operation . 

This is usefull when removing large tables . 

It has some parameters , some notes and is not compatible with all versions of postgresql . 

It obtains `ACCESS EXCLUSIVE` to force the tables removal . 

## Locks
Posgtre has LOCKs in many layers :
* Table 
* Row
* Page

Each lock has conflicts with some of other locks . 
You can see the full table of conflicts in the [link](https://www.postgresql.org/docs/current/explicit-locking.html) .

### DeadLocks 
Postge handles deadlocks itself by aborting one of the transactions that has a lock on some resource . 


## Downsides

### Index managing

While replicating data, the posgres has a downside on managing indexes. 

When the replication process copies rows in bulk, the DBMS also updates indexes for one row at a time. By it is managable by **removing indexes at destination database** and **rebuilding** them when the copying is complete. 

> When replicating, watch out indexes. They can take too much time. 

### Vacuum issue

Vacuuming is an essential background process in Postgres that reclaims storage occupied by deleted or obsolete rows.

Without regular vacuuming, the database would eventually run out of transaction IDs and grind to a halt. However, vacuuming large tables can be resource-intensive and cause performance issues and downtime.

> DBMS keeps track of all its transactions. 