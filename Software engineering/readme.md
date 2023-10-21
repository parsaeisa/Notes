# Software engineering

By now, I think that software engineering consists of 3 main things:

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

### Solution design 

One of the main mindsets that is helpful is in removing redundants. 

For example : 

Consider there are 5 services that subscribe on a topic in a broker, and all of them store incoming events. This is redundant because subscribing and storing is repeated five times. 

This put a high workload on broker that makes it unreliable. 

## Incidents 

What to check when we face an incident ?? 
* See other services and technologies (like databases and brokers) that your service are connected to. 
* See logs (in the pods or in Kibana )