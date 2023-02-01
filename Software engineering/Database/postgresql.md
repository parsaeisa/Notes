# Posgtre

Postgre sql has a MVCC architecture . 

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
