# Linux

There are different distribution of linux that you should know such as **Fedora** and **Debian**.

A list of operating systems: CentOS, CoreOS, Debian, Red hat, Ubuntu, Windows etc

## Cgroups

Linux has a mechanism of **dividing the resources** it has between it's **processes**. This feature is being used on many great open source projects such as Kubernetes. Cgroups are being used for this purpose. 

Cgroup is a container for a set of related properties that **control** how the kernel **runs a process**.

It is hierarchical. Each cgroup has a parent and eventually they are ended to **Root cgroup**. 

We can easily inspect cgroups with seing files in `/proc` and `/sys` directory.

```bash
sudo cat /proc/<pid\>/cgroup
```

When a host comes under the memory pressure, it **elects** some processes to kill. So, it doesn't kill a process immediately. 

## OOMkiller

By now, I know that there are two oom-killers:
- Global
- Cgroup

When a process is out of memory cgroup are being handled by global oom-killer. 

If a process was killed by the cgroup oom-killer, you may see this log: 
```
Memory cgroup out of memory: Kill process ...
```

## Directory structure

`usr`:

- `/usr/bin`: Binaries installed by Package-manager and OS-provider. For example `docker` is in this directory after installation.
- `/usr/local/bin`: Binaries installed manually by user or custom binaries. For example `docker-compose` is in this directory.

## Cronjob

For accessing the cron file:
```bash
crontab -e
```

As you know it is like:
```bash
* * * * * /path/to/command
```
But each start from left to right is:
- Minute (0-59)
- Hour (0-23)
- Day of the month (1-31)
- Month (1-12)
- Day of the week (0-6, where 0 is Sunday)

You can get sure from your timing using this link: https://crontab.guru/

Seeing logs for cronjobs:
```bash
grep CRON /var/log/syslog
```

As you can see they are moved to **syslog**.

## Versions

### Ubuntu and Debian

Ubuntu is based on Debian.

Debian focuses on **stability** which means:
- It is good for servers 
- It has a long unpredictable release cycle.
- It uses older and well-tested tools.

but Ubuntu focuses on **ease of use** and has more features which makes it suitable for desktop. 
- It has a default desktop environment (GNOME)
- It has a better community

In so many thing Ubunto is the opposite of Debian:
- It has a regular release cycle
- It uses newer tools

## User access

Sometimes, you may see a command which cannot find a file which it needs. That's maybe due to command is executed by a user and files have been created by other user. 

For checking which user created a certain file use:
```bash
sudo ls -l path/to/file
```

### File permission representation

Apparently we have 3 permission sets:
- owner
- group 
- others

File permission representation is normally a 4 digit number:
- If the first one is zero, it means all digits are octall ( search about it later )

Other 3 digits from left to right, show the permission level of owner, group, others.

About numbers themselves, We have three kind of permissions: 
- Read: 4
- Write: 2
- Execute: 1

Each digit can be a sum of a subset of these 3. For example 5 is 4+1 which means permission to read and execute (rx) and 7 (Full access) is 4+2+1 which is the permission for reading, writing and exectuing.

Changing the ownership of a directory:
```bash
sudo chown -R $USER:$USER /path/to/cloned/directory
```

# Bash commands 

This is a link which has a good diagrams on most usefull linux command : https://xmind.app/m/WwtB/

You can write a *.sh file which consists of bash commands and then 
execute all of them by running that file . 

in bash we have **for** , **if** and **switch case** .

In the case that they are needed search for them , just know that they exist . 


`|` is the seperator for commads. You can put multiple commands in a row seperated using this character. 

With using this character, the output of previous command is the input of currnet command.  

```bash
command 1 | command 2 | command 3
```

For checking where a software is installed:
```bash
which docker
```

Here the output of command 1 goes to command 2 and the output of command 2 goes to command 3. 

I think command2 act command1's outputs as a file. For example the `awk` command takes a file as input but using `|` we do not need to pass file path to it. 

## declare 
allows you to update attributes applied to variables . 
parameters : 
* -A : defines associative array ( associative array is like dictionaries in python )
* -a : defines indexed array
* -r : defines readonly variables .

* A script is a piece of code that executes only one time . It can be in any language .

parameters : 
* complete it ...

## Hashing

Sometimes you need to hash some string to create mock data when you are testing a feature in a database. There are different hashing algorithms and find the command compatible to that algorithm. 

One of those commands are:

```bash
htpasswd -bnBC 10 "" "your_password" | tr -d ':\n'
```

The other one is hashing wiht Argon algorithm ( used for passwords in directus databsae ):

```bash
echo -n 'yourpassword' | argon2 your_salt -id -t 3 -m 16 -p 4
```
## netplan 

I used it for setting new DNS servers. 

* What is DNS servers ? 

You enter this in the command line :
```bash
sudo vim /etc/netplan/00-installer-config.yaml
```

In that directory is only one yaml file that may have different name. That's ok.

You see a file like below: 
```
network:
  ethernets:
    ens33:
      dhcp4: true
  version: 2
```

For adding new dns servers change the file to this form:
```
network:
  ethernets:
    ens33:
      dhcp4: true
      nameservers:
        addresses: [185.51.200.2,178.22.122.100]
  version: 2
```

Then run :
```bash
sudo netplan apply
```


## find
is a built-in function which finds a file or directory . 
parameters : 
* -name : with this you specify the file or directory name .
* -type : if its d , you are searching for a directory .

## echo

consider you have a parameter called len , if you execute "echo len" ,
you will get the "len" . 

To act len like its a variable and to get its value , you should type "echo ${len}"

An example : 
```bash
declare -a names
names=(
  'name1'
  'name2'
  'name3'
)

len=${#names[@]}

for name in "${!names[@]}"; do
    echo ${names[$name]}
    if [ ${names[$name]} == 'name2' ]; then
        echo 'found'
    fi
done
```

We can also define methods with bash . for example : 

{bring an example}

and call it like this : 
```bash
    deploy_project $project
```

## Normal operations 

Restart : 
```bash
sudo reboot
```

## usermod 

You can use this to give access to users. 

For example by default while using docker you need to add `sudo` but with the command below: 

```bash
sudo usermod -aG docker [user]
```

You can remove the need for sudo.

become root user:
```bash
sudo su
```

I think these commands are used to give permissions to executable files. 

The files that are used for installing a tool. 

## Service



## alias

example : 
```bash
alias swagger='docker run --rm -it  --user $(id -u):$(id -g) -e GOPATH=$(go env GOPATH):/go -v $HOME:$HOME -w $(pwd) quay.io/goswagger/swagger'
```

Before the above command, if you type swagger in terminal you will get nothing.
But after you entered this command, swagger acts like a new command in your terminal.

## apk

In a pipeline when the underlying machine doesn't have needed tools, `apk` is used to install necessary tools.

Example:
```bash
apk add curl jq coreutils
```

With this command, curl, jg and coreutils is installed to the machine. 

* Sometimes the `make` command (the command that executes commands in a makefile) is not available. In this situation use `apk add make`.

## awk

awk includes a pattern and a command. 
```bash
awk 'pattern { action }' input-file
```

Search for a word in a file : 
```bash
awk '/pattern/ {print}' file.txt
```

Getting the lines of a file:
```bash
awk 'END {print NR}' file.txt
```

We can put multiple commands in a single awk : 
```bash
awk '{sum += $1} END {print "Total:", sum}' numbers.txt
```

here we have a sum, then a pattern, at last another command.

## sed

The first time that I used sed, I wanted to extracts "id" tags in a json with multiple objects.

I did it in this way: 
```bash
IDS=$(echo "$JSON_DATA" | sed -n 's/.*"id":\s*\([0-9]*\).*/\1/p')
```

commands:
- `s/`: This is the sed command to substitute or replace text.
- `/p`: This instructs sed to print the lines that match the pattern.


### Relation to awk
`sed` and `awk` are both powerfool **text processing tools**.

sed stand's for **S**tream **Ed**itor, sed iterates through a text in a **line-by-line** manner, instead, awk iterates **row-by-row**, means that it splits each line to bunch of fields and processes word-by-word. 

awk has more advanced and flexible scripting language compared to sed. So, awk is used for wider range of tasks.

## xargs

`xargs` applies a command to all elements of it's previous. It's always comes after pipe (`|` character) because it wants to be applied of a command's output.

deleting pods of an application using regex : 
```bash
kubectl get pods -n default --no-headers=true | awk '/web-app/{print $1}'| xargs  kubectl delete -n default pod
```

## curl
curl is used to make a http request . 

A curl script can be generated by Postman . 
 
### Flags
`-X`

`Get` 

`-vvv` extremely verbose (also print internal state transitions)

## ufw

I think it manages ports. 

```bash
ufw enable
```


```bash
ufw allow [port number]
```

* What does this allow means ? 

The command below checks that a port is available or not.

```bash
telnet [address] [port number]
```

## ssh

For establishing a ssh connection to an external server the first obvious command is:
```bash
ssh <username>@<ip address>
```

For establishing this connection, the external server must have your public key.
Your keys ( both public and private) exist in `.ssh` directory. 

If you want to use a new one we can create one by `ssh-keygen` command.

But everytime (per each restart) we need pass our **private key** with ssh-add:
```bash
ssh-add /path/to/private key
```

Or:
```bash
ssh -i <address to the corresponding private key to the added public key to the server> <username>@<ip address>
```

## tmux

If you have a ssh connection with a VM and your process is being terminated whenever you close the terminal, use `tmux`.

You use tmux in this way: 
```
tmux new -s mysession
```

Then you will be redirected to a command line. Start your process there, then for exiting press **ctrl-b** then **d**.

Whenever you want to reconnect to the tmux session and check the script's progress, you can SSH back into the machine and attach to the existing tmux session:
```
ssh username@remote_server_ip
tmux attach -t mysession
```

## Transferring file 

To transfer a file from your machine to a server You have these tools: 
- sftp
- rsync
- scp

Using sftp was **not succesful**, but scp was ok. I didn't try rsync. 

### scp

Whole command for transfering a file:
```bash
scp <source> <dest>
```

If source or dest is on the server it should have this pattern:
<id>@<host>:<path in remote system>

For transferring a directory use this:
```bash
scp -r <srouce> <dest>
```

### sftp

`sftp` is used to transfer file from your machine to a server. 

**Before you begin** open a tmux session and do it there. 

initial command:
```bash
sftp remote_username@server_ip_or_hostname
```

Then you must see something like this:
```bash
Connected to remote_username@server_ip_or_hostname.
sftp>
```

## systemctl

You can see whether a program is running or not:
```bash
sudo systemctl status postgresql
```

Or we can run programgs:
```bash
sudo systemctl start postgresql
```

I don't know what is it exactly, once I used it to **restart docker**.

## grep

With `grep` you can find patterns in a file. 
```bash
grep -i 'hello world' menu.h
```

## flake8

`flake8` is a command-line utility for enforcing style consistency across Python projects.

* I think this command is being used only for python projects but I'm not sure. 

arguments:
- exclude
- extend-exclude
- max-line-length

You can see an example here:
```bash
flake8 --exclude='__init__.py','venv/' --extend-exclude='*_pb2*.py' --max-line-length=121  ./..
```

## dpkg

dpkg is a low-level package manager on Debians. It manages .deb packages. It works with local .deb files.

On the other hand, apt is a high-level package manager which manages dependencies and repositories.

I used it one time and that was because apt wasn't showing me anything helpful.

Installing:
```bash
sudo dpkg -i package_name.deb
```

Removing:
```bash
sudo dpkg -r package_name
```
s
Listing installed packages:
```bash
dpkg -l
```

Checking if a package is installed or not:
```bash
dpkg -l | grep package_name
```

Extracting package contents:
```bash
dpkg -x package_name.deb /path/to/destination
```

Reconfiguring:
```bash
sudo dpkg-reconfigure package_name
```

## Combined commands

There are some commands which are a combination of other simple commands. 

Count of files in a directory:
```bash
find /path/to/directory -type f | wc -l
```
- `-type f`: Filters directories to only count files.
- `wc -l`: Counts the number of files in output.
