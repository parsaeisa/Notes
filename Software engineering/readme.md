# Software engineering

## Introduction

The nature of a task (a big task like two factor authentication) defines the nature of a service.

One of the main factors of a task is **time restriction**. 

By now, I think that software engineering consists of 3 main topics in computer science:

* Database
* Operating System
* Prgoramming patterns and paradigms

## New-words 

* Dynamic config


## System Design 

System design is designing set of distributed systems which make up 
a Backend Software .

components : 
* logger
* key/value store
* database
* CDN
* Load balancers
* brokers
* Testing strategies
* monitoring
* deployment managing tool
* [To be completed]


### CAP Theorem

In the CAP theorem we have:
- **C** as consistency. This factor guarantees that all nodes in a system are seing same data at a same time.
- **A** as Availability. This factor says that any request to a system at any time should have a response. The response can be inaccurate.
- **P** as partition tolerant. When the connection between nodes are interrupted (Network partitions), the system's functionality should not break. 

The CAP theorem says that we can have at most two out of these three items. 

The P ( partition tolerant) is being handled oftenly and the main trade-of is between consistency and availability.

In financial applications the **C** is often more important than **A**.

There are three patterns for consistencty:
- Weak consistency
- Eventual consistency
- Strong consistency

### Solution design 

One of the main mindsets that is helpful is in removing redundants. 

For example : 

Consider there are 5 services that subscribe on a topic in a broker, and all of them store incoming events. This is redundant because subscribing and storing is repeated five times. 

This put a high workload on broker that makes it unreliable. 

## Incidents 

What to check when we face an incident ?? 
* See other services and technologies (like databases and brokers) that your service are connected to. 
* See logs (in the pods or in Kibana )