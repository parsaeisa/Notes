# Monitoring

Monitoring involves continuously observing the state and behavior of a software system or application in real-time. It typically involves collecting and analyzing various metrics, such as CPU usage, memory utilization, network traffic, response times, and error rates. Monitoring helps ensure that the system is functioning correctly and provides insights into its performance, stability, and availability. It often involves setting up alerts or notifications to detect anomalies or critical conditions.

In an AI model , we pass the constructor a print method which gaves us the logging that we want .

In a Backend project , for example in go we define a logger for our app .

<br />

**Logger is one of the main components of system design**

<br />

notes for grafana is in [grafana notes](https://github.com/parsaeisa/cassandra_try)

to learn :
* logstash
* elastic

## What to monitor

* Latency (general, per method, handler, instance, etc, external service call, publish)
* Memory (in heap, stack, etc)
* Errors (4xx or 5xx)
* Success and fail cases 
* HTTP/traffic (req/s)
* Goroutines

There are some things that are being monitored but you don't know what are them: 
* Live objects
* Objects allocated, space allocated : there is also a need for monitoring in-used objects and in-use space, some parts of objects and space may not be in use.
* GC duration

#### Loggers for golang :
* zap
