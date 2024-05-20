# Estimation

A software engineer must be able to etimate the resource needed for a backend service.

Of course the resources are:
- Ram
- Hard disk

At first try to find factors, then go to precise numbers.

Important factors:
- Number of users
- Number of active users
- Peak times
- Number of requests
- Number of data records
- Number of threads in a concurrent program
- etc ...

Apparently, this estimation doesn't have a defined rule and it is more experimental. 

- IO boundity
- CPU boundity
- Throttling

## A mapping betwen RPS and resource

Create this in any company that you are. It differs from a company to another. 

## Throttling

CPU has a sharing system for running distributing its resources for processing different threads. When a process asks for a resource which is beyond its limit, throtling occurs. 

There is a relation between the number of threads and throttling occrurance. If the count of your processes goes up, the throttling change increases.
