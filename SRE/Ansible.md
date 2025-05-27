# Ansible

[Documentation](https://docs.ansible.com/)

Ansible is only installed on single machine and it makes changes on different machines.

Ansible is not required to be installed on all target servers.

Ansible is somehow a superset of docker. Docker creates the required environment on a docker container, but ansible does it on vagrant container, cloud instance and bare metal.

**Module:** Are small units of tasks. Each module executes an specific task. There is pre-written modules for many kinds of tasks.AWS, google cloud, docker, databases, etc.

Most of the times we need sequences of different commands such as installing and configurings.

**tasks**: It has a sequence of modules ( with order ). It has group of tasks like this:
```yml
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
```yml
vars:
    tablename: "foo"

tasks:
    - name: task1
      postgres_table:
        table: {{ tablename }}
        rename: bar
```

All these together is called a **play** which is like this:
```yml
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

Checking whether ansible is installed:

```yml
ansible --version
```

```yml
pip install ansible
```

** Don't bother yourself installing ansible. Use a python virtual environment**:
```bash
# Creating
python3 -m venv your_env_name # It creates directory with you environments name

# Activating
source your_env_name/bin/activate
```

Then you are redirected to a virtual environemnt, install ansible there.

For coming out:
```bash
deactivate
```

Create a file called inventory.ini:

```yml
[webservers]
192.168.1.100
192.168.1.101

[dbservers]
192.168.1.200
```

If for a certain server you need username, add it using this:
```yml
[all]
<ip address> ansible_user=your_username  # ← Add here
```

Create an ansible configuration file:

```yml
[defaults]
inventory = ./inventory.ini
remote_user = your_ssh_user
```

Ping all hosts:

```bash
ansible all -m ping
```

For trying with username:
```bash
ansible all -m ping -u <username>
```

Run a command:
```yml
ansible all -m shell -a "uptime"
```

Then start to run playbooks.
```yml
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

How does ansible finds out about a tool's state ( To check it is installed or not )? It asks the package manager used by os. it can be apt, yum or anything else.

One type of scenarios which worth to watch out is idempotency. Consider a docker container is already running. What should happen if you run playbook one more time? Should it replace the new container with the old one? Or it should be idempotent and do nothing? 

### Installing docker

While installing docker using ansible, no error is shown but when you try `docker --version` it says command not found.

Docker and docker-compose should be installed from a repository which must be stabled.

So one of the possible reason for happening this issue is that connection wasn't established to the repositry, ansible couldn't find anything and then it thought there was no problem. 

So think about reconfiguring the repository.

## Some modules
Here you see a list of all modules you see or a link to them: 

- `file`: Creates files and directories.

Creating:
```yml
file:
    path: path/to/new/dir
    state: directory
    mode: '0775'
```

I don't know whether that `mode: '0775'` is necessary or not.

It can create multiple layered directories. I mean in `dir1/dir2/dir3` it creates all three directories.

For creating empty files:
```yml
- name: Create empty files
  file:
    path: path/to/file
    state: touch
```

- copy: Creating files on external server

```yml
- name: Add config files for google play
    copy:
      dest: /path/to/file
      content: |
        LINE 1
        LINE 2
        LINE 3
```
- `postgres_table`: related to postgres tables.

Renaming a table:
```yml
table: foo
rename: bar
```
Giving ownership to a user:
```yml
name: foo
owner: someuser
```
Truncating a table:
```yml
name: foo
truncate: bar
``` 

- `yum`: Installs differnt things.

Installing nginx:
```yml
name: nginx
state: latest
```

- `service`: Starts a new service. like running nginx.

Installing git:
```yml
- name: Install Git
      apt:
        name: git
        state: present
```

## Best pracitces

https://docs.ansible.com/ansible/2.8/user_guide/playbooks_best_practices.html

There is a good ansible playbook in this link:
https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_v2_module.html

### Duplicated tasks

For putting duplicated tasks in a single place, put your tasks in a single file, like this in a new file:
```yml
- name: Add Docker GPG apt Key
  apt_key:
    url: https://download.docker.com/linux/ubuntu/gpg
    state: present

- name: Add Docker Repository
  apt_repository:
    repo: deb https://download.docker.com/linux/ubuntu focal stable
    state: present

- name: Update apt and install docker-ce
  apt:
    name: docker-ce
    state: latest
    update_cache: true
```

Put this file in a directory called "roles" ( I think it's the convention ) then import it to your playbook with these:
```yml
- include_tasks: roles/install-docker.yml
```

In the same level with your tasks

## Ansible vault

The first time I surveyed ansible vault was for transfering a private file to the external ubuntu instance. I think it encrypts files and we can put the encryption of files on version control with whole trust.

For using it:
```bash
ansible-vault create <file_name>
```
It redirects you to an editor which you can put the content of the file you want to be encrypted.

For enctypting an exisiting file:
```bash
ansible-vault encrypt <file_name>
```

```bash
ansible-vault decrypt <file_name>
```

And for editing the file:
```bash
ansible-vault edit <file_name>
```

Using them in playbooks:
```bash
ansible-playbook <playbook.yml> --ask-vault-pass
```
```bash
ansible-playbook <playbook.yml> --vault-password-file <password_file>
```
And for changing the password:
```bash
ansible-vault rekey <file_name>
```

### Installation

It's not directly installed by for example `pip install ansible-vault`. It is a part of ansible itself so if ansible is installed it should be installed too.
