# Makefile

In makefile you can write some complicated bash commands and then add a \
name for it , then when you enter 'make command_name' in terminal , it will
easily execute those complicated commands . 

for example : 
```bash
vendor: set-goproxy
	go mod vendor -v
```

if you type 'make vendor' , the 'go mod vendor -v' will be executed . This is so 
handy when you are using pipelines , for example you can add 'make lint' as
part of a script , then It will execute all of lint command in you make file . 

This is very useful when you want to write pipelines and number of lines of 
your pipeline will decrease .

### Variables
You can add variables which you are gonna need . Define these variables
like bash variables . 

* for example define BUILT_DATE and compute it 'date' bash command and this
  BUILT_DATE in loggings when you build the project .

### Dependencies 

Sometimes a command calls for another command to be finished , for example consider 
commandA needs commandB to be completed in order to start executing ; In
this case we will use below line : 
```bash 
vendor:
	go mod vendor -v

coverage: vendor
	gotestsum -- -gcflags 'all=-N -l' -mod vendor -v -coverprofile=.testCoverage.txt ./...
	GOFLAGS=-mod=vendor go tool cover -func=.testCoverage.txt
```
