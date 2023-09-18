# Some loggers for golang 

[Other loggers for golang](https://blog.logrocket.com/5-structured-logging-packages-for-go/)

## zap.logger
https://github.com/uber-go/zap


Zap is known for :
* it's speed
* and it's memory foot print and 

Zap has two kinds of logging : 
* Structured 
* Unstructured ( Called sugar ) 

We have different levels of logging : 
* Warning 
* Info
* Errors

And for each level we have a method in zap : 
* Info
* Error
* Fatal

There is a difference between Error and Fatal .

## logrus

github.com/sirupsen/logrus

Despite of Zap, Logrus supports syslog.