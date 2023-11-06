# Distributed Systems

This document referenece is the book **Desigining Distributed Systems** By **Brendan Burns**.

## Single-node patterns

### Sidecar

### Ambassador

### Adaptor

## Distributed patterns

### Replicated 

One of the most simple replicated patterns is the situation that requests from all users are directed to all nodes. This variation can balance the load efficiently but it's not always the best idea.

**Session Tracked**: In session tracked cases, there is a need to redirect a user's request to a specific node. Becuase the destination nodes stores the information about that user in it's memory. 

For sesstion tracked load balancing, a hash between user's IP address and destination node IP address is needed. 

> A hash function with source and destination's IP addresses is practical in a same network namespace (namespace ???), For handling session's in External network **Coockies** are being used.

For performing session management in distributed systems that can scale up & down, a **consistent hash function** must be used. The benefit of this kind of hash functions can reduce the number of users that their destination server is changed.

> What are consistent hash functions ??

#### Twemproxy

**Twemproxy** is a proxy developed by twitter.

#### Varnish

Varnish is a cache http reverse proxy. I seets between user and application's containers.

When a user send's request to application two times, Only the first one goes to application containers. The response to user's first request is stored in Varnish and is being returned to user for the second request.

In result only user's first request goes to application containers.