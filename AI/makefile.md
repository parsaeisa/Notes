# Makefile

In makefile you can write some complicated bash commands and then add a \
name for it , then when you enter 'make command_name' in terminal , it will
easily execute those complicated commands . 

for example : 
```bash
vendor: set-goproxy
	go mod vendor -v
```

if you type 'make vendor' , the 'go mod vendor -v' will be executed . 

This is very useful when you want to write pipelines and number of lines of 
your pipeline will decrease .

