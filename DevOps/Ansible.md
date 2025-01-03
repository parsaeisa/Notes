# Ansible

Ansible is only installed on single machine and it makes changes on different machines.

Ansible is not required to be installed on all target servers.

Ansible is somehow a superset of docker. Docker creates the required environment on a docker container, but ansible does it on vagrant container, cloud instance and bare metal.

**Module:** Are small units of tasks. Each module executes an specific task. There is pre-written modules for many kinds of tasks.AWS, google cloud, docker, databases, etc.

Most of the times we need sequences of different commands such as installing and configurings.

**tasks**: It has a sequence of modules ( with order ). It has group of tasks like this:
```bash
tasks:
    - name: task1
      module_name:
        arg1:
        arg2:
    - name: task2
      module_name:
        arg1:
        arg2:
    - ...
```

We get connected to the database with parameters `hosts` and `remote_user`.

You can define variables too. like this:
```bash
vars:
    tablename: "foo"

tasks:
    - name: task1
      postgres_table:
        table: {{ tablename }}
        rename: bar
```

All these together is called a **play** which is like this:
```bash
- hosts: 
  remote_user:
  var:
    var1:

  tasks: 
    - name:
      module_name:
        arg1:
    - ...
```

An array of such object is called **playbook**.

Now, where we configure to execute some commands on **multiple** machines? We do it in a hostsfile like this:
```
[databases]
10.24.0.7
10.24.0.8
```
the term databases appears on hosts in playbook.

## Some modules
Here you see a list of all modules you see or a link to them: 

- `file`: Creates a directory.

Creating:
```bash
path: path/to/new/dir
state: directory
```

- `postgres_table`: related to postgres tables.

Renaming a table:
```bash
table: foo
rename: bar
```
Giving ownership to a user:
```bash
name: foo
owner: someuser
```
Truncating a table:
```bash
name: foo
truncate: bar
``` 

- `yum`: Installs differnt things.

Installing nginx:
```bash
name: nginx
state: latest
```

- `service`: Starts a new service. like running nginx.