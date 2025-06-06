# Posgtres

Postgre sql has a MVCC architecture . 

It has something called **Materallized view** and it has operator in k8s I guess and it's more preferable than MySql.

## Queries

Seeing all tables:
```SQL
SELECT table_name FROM information_schema.tables;
```

## Commands 

For connecting to psql you should first run:
```bash
psql -U postgres
```

I guess postgres is the default username. 

- `\q`: Exit SQL session
- `\l`: List databases
- `\c database_name`: Like `use database_name` in mysql.
- `\dt`: See all tables


`TRUNCATE` Empties one or set of tables .

It acts llike `DELETE` but it has some advantages : 
* It is faster because it doesn;t scan the table . 
* It reclaims the disk space immediately instead of requiring a subsequent `VACUUM` operation . 

This is usefull when removing large tables . 

It has some parameters , some notes and is not compatible with all versions of postgresql . 

It obtains `ACCESS EXCLUSIVE` to force the tables removal . 

### Connecting to an external database
```bash
psql -h <host address> -p <port> -U <user name> -d <database name>
```

### Getting dump from an external database
This command creates a dump file from an external database and stores it in the underlying machine. 
```bash
pg_dump  -h <host address> -p <port> -U <username> -F c -b -v -f output_file.dump <database name>
```
**Parameters:**
- `-F`: Specifies the format of the output file.
    - `c`: .dump
    - `t`: .tar
- `-b`: Includes large objects in the dump.
- `-v`: Enables verbose mode to display progress.
- `-W`: Prompts for the password of the user.

We can give password to it like this:
```bash
PGPASSWORD=$ENV_POSTGRES_PASSWORD pg_dump <arguments>
```

### Restore a database from a dumpfile
```bash
pg_restore -U <username> -d <database name> -v output_file.dump
```
Same parameters with pg_dump exist here ( except `-F` argument)

Also we gave password to it like `pg_dump` command.

### Creating DB
```bash
createdb -U <username> <database name>
```

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
