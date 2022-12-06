# Security

There is two stages while security scannings : 
* SAST : Statict application security testing , which is just applied on base codes .  
* DAST : Dynamic application security testing which is applied on application after deployments . It needs a new server to deploy our application on . 

# Some tools

`kics` finds security vulnerabilities, compliance issues, and infrastructure misconfigurations .

`zap-cli` a docker images which is useful in  DAST .

`go-sec` 

`sem-grep`

`segfault` is an acronym for segmentation fault , and this happens when app crashes while its trying to read from or write to a not permitted memory . 

#### A program's segments
* text : for code and instructions 
* data : variables and arrays 
* stack : used for temporary variables , functions and subroutines . 
* heap : for variables which are defined during runtime . 


`trivy` is a tool that can perform scanning . 

this is the repo : https://github.com/aquasecurity/trivy

And this is the link where you can scan any image online : https://trivy.dev/

## Solutions 
This section is a toolbox of solutions to fix a security issue . 

Sometimes images ( docker images ) has vulnerabilities . images of golang , debian , alpine and etc . In this situaions , the solution is to change the image verision ( the latest version is not safe always . ) 

* alpine:3.16 has no vulnerabilities , but other version do . 

## To Search about

This is an error message from a container scanner script :

> zlib through 1.2.12 has a heap-based buffer over-read or buffer overflow in inflate in inflate.c via a large gzip header extra field. NOTE: only applications that call inflateGetHeader are affected. Some common applications bundle the affected zlib source code but may be unable to call inflateGetHeader (e.g., see the nodejs/node reference).

**Words that can be important** :
* heap-based buffer
* over-read buffer overflow
* inflate
* zlib
