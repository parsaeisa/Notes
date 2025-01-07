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

## How to use? 

```bash
pip install ansible
```

Checking whether ansible is installed:

```bash
ansible --version
```

Create a file called inventory.ini:

```bash
[webservers]
192.168.1.100
192.168.1.101

[dbservers]
192.168.1.200
```

Create an ansible configuration file:

```bash
[defaults]
inventory = ./inventory.ini
remote_user = your_ssh_user
```

Ping all hosts:

```bash
ansible all -m ping
```

Run a command:
```bash
ansible all -m shell -a "uptime"
```

Then start to run playbooks.
```bash
ansible-playbook "path/to/yaml-file"
```

## Scenarios

Consider an ansible task wants to install a tool. What happens if that tool is already installed? For instance take this task overhere:
```
- name: Install Docker (if not already installed)
    apt:
        name: docker.io
        state: present
        update_cache: yes
```

There is a parameter called `state`. If it's value is `present`, it just makes sure whether docker is installed and if it was, it acts idempotent and doesn't do anything.

One other possible value for this parameter is `latest` which checks the version every time and installs it's last version.

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