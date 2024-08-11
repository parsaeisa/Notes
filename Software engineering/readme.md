# Software engineering

## Topics

* [Api-paradigm](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Api%20paradigms/readme.md)
* [Architecture](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Architecture/readme.md)
* [Brokers](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Brokers/readme.md)
* [Database](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Database/readme.md)
* [Non-technical](https://github.com/parsaeisa/Notes/tree/main/Software%20engineering/Non-technical)
* [Observability](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/observability/readme.md)
* [Trend topics](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/trend%20topics/readme.md)

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

https://learningdaily.dev/im-new-to-system-design-where-do-i-start-35180232f53

https://www.educative.io/blog/distributed-system-design-patterns#what?eid=5082902844932096

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

### Common system design problems

**Read-heavy** system: Use caching to make systems faster

**Heavy-write** system: A system with heavy traffic of writes. In such problems there are two things that we need:
- A worker for processing each read request. 
- A LSM-tree database. 

**Highly avaiable** systems: Using load-balancer
**High latency**: Use CDN to reduce the latency. 
**Handling large files**: Block storages and object storages. 

## Incidents 

What to check when we face an incident ?? 
* See other services and technologies (like databases and brokers) that your service are connected to. 
* See logs (in the pods or in Kibana )

## 40 Engineering blogs

Engineering at Meta - https://lnkd.in/e8tiSkEv

Google Research - https://ai.googleblog.com/

Google Cloud Blog - https://lnkd.in/enNviCF8


AWS Architecture Blog - https://lnkd.in/eEchKJif

All Things Distributed - https://lnkd.in/emXaQDaS

The Nextflix Tech Blog - https://lnkd.in/efPuR39b

LinkedIn Engineering Blog - https://lnkd.in/ehaePQth

Uber Engineering Blog - https://eng.uber.com/

Engineering at Quora - https://lnkd.in/em-WkhJd

Pinterest Engineering - https://lnkd.in/esBTntjq

Lyft Engineering Blog - https://eng.lyft.com/

Twitter Engineering Blog - https://lnkd.in/evMFNhEs

Dropbox Engineering Blog - https://dropbox.tech/

Spotify Engineering - https://lnkd.in/eJerVRQM

Github Engineering - https://lnkd.in/eCADWt8x

Instagram Engineering - https://lnkd.in/e7Gag8m5

Databricks - https://lnkd.in/eXcBj37a

Canva Engineering Blog - https://canvatechblog.com/

Etsy Engineering - https://lnkd.in/eddzzKRt


Booking.com Tech Blog - https://blog.booking.com/

Expedia Technology - https://lnkd.in/ehjuBE5J

The Airbnb Tech Blog - https://lnkd.in/emGrJbGM

Stripe Engineering Blog - https://lnkd.in/em6Svgyx

Ebay Tech Blog - https://tech.ebayinc.com/

Flickr's Tech Blog - https://code.flickr.net/

Hubspot Product and Engineering Blog - https://lnkd.in/eRGZkBd4

Zynga Engineering - https://lnkd.in/eex5Ddry

Yelp Engineering Blog - https://lnkd.in/epgBW_4J

Heroku Engineering Blog - https://lnkd.in/evgctQjh

Discord Engineering and Design - https://lnkd.in/evY4gpUA

Zomato - https://lnkd.in/e9gf3APD

Hotstar - https://blog.hotstar.com/

Swiggy - https://bytes.swiggy.com/

Acast Tech - https://lnkd.in/esuCEYZb

ASOS Tech Blog - https://lnkd.in/esXfdv3G

Shopify Engineering - https://lnkd.in/evvnqQTj

Microsoft Tech Blogs - https://lnkd.in/etw_7_bN

Engineering at Microsoft - https://lnkd.in/eEKz4ECi

MongoDB Engineering Blog - https://lnkd.in/e9iaqcmZ

Slack Engineering - https://slack.engineering/

Engineering at Depop - https://lnkd.in/eGjRYcFd

SourceDiving (Cookpad's Engineering Blog - https://sourcediving.com/

Auto Trader Engineering Blog - https://lnkd.in/eGDKA_g3

Indeed Engineering Blog - https://lnkd.in/ecFS87Dt

Gusto Engineering Blog - https://lnkd.in/e7yVxDKs

Engineering at Birdie - https://lnkd.in/eUqJTpje

Forethough Engineering - https://lnkd.in/esCKvedJ

Capital One - https://lnkd.in/ezsKUf_H

Disney Streaming - https://lnkd.in/e4nmMdWd
