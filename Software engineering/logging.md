# Logging

Logging is one of the main components of software engineering . It should contain critical information about an event .

There are some best-practices about logging . 

## Best practices

What to log always ? 
* Latency
* Time
* Appropriate message

> Always wrap errors . 

## Some loggers for golang 

### zap.logger
https://github.com/uber-go/zap


Zap is known for :
* it's speed
* and it's memory foot print and 

Zap has two kinds of logging : 
* Structured 
* Unstructured ( Called sugar ) 

### logrus

github.com/sirupsen/logrus