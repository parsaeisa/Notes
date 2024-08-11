# Load balancing

In this document we are going to talk about one of the main components of software engineering, load-balancers.

Load-balancers are sometime the main solution for high-availability for finding most suitable node ( e.g. database instance)

## Switching solution

Consider there is a broker in your microservice. More than one microservice is relying on this broker and one of them has higher priority (in busniess logic) than your services (call this service B). 

When that broker (call it X) faces a high request load, more than it's tolerance, it goes down and the B service goes down too.

In this situation you should have a **quick switch solution**. You need to move your microservice to another server with lower load.

### Abstraction layer

A solution, in very abstracion way to say is something that I like to call **Abstraction layer**.

Consider the mentioned example, we use the client of X broker so many places in our code. For publishing, subscribing etc. While we are switching that broker, we need to change it all over our code and is not possible to do it in just one hour.

So we can put an abstraction layer of brokers. A simple client for all brokers (nats-streaming, kafka, rabbit, etc ), is used in our code, all over the place. 

While switching we can just change it's creating in app's startup.

Once it's connected to Rabbit, once to Kafka, etc.

This abstraction can be wrote with interface. We put useful methods (like publish & subscribe) in that interface, then for each broker, the implementation of that interface differs.

> don't forget to update config for switching. When we have 2 options for a certain scenario we should have full configurations for those 2 options in our confi file.

## Simple algorithms 
A very beautiful link on this topic (with animation) : https://samwho.dev/load-balancing/

I think the main challenge in loadbalancing is this point : 

**Servers cannot accept a new request while they are processing another request(s).**

With adding buffer (task queue) we can tackle this issue a little but I think the mindset of the **busy server** is why we adopt different load-balancing algorithms. 

#### Aging
As you remember we had a priority queue in OS course in university. In that strategy a task with lower priority could wait a long time. 

In this case the task is aged and it's priority goes higher.

### Round robin 
With round robin algorithm, the load-balancer distributes the request equally among servers, it is a very simple algorithm but it has a little problem.
 
It doesn't care about the : **Variance** 

There are 2 facts : 
- Servers are not always equally **powerfull**
- Requests that are distributing between servers are not equally **Expensive**



### Weighed round robin 

### Least connection