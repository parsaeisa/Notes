# Locking

This document talks about different locking mechanisms. 

## Famous problems

Consider an e-commerse application. What to do to not sell a property to two user ?

The first solution that comes to mind is that put a row-level lock on that item (consider in items table we has a column named **sole**). But in a great e-commerse application there are multiple database servers which all of them should be informed that a row is locked. 

Here a centralized lock manager should be used to sit in the middle of all cluster and lock all of them. **Redis-lock** is a thing that is being used here.

### Releasing a lock, an important problem

In a distributed system a node (which hold the lock) may malfunction for many reasons and in result it is not able to release the lock. 

For such situations, each lock needs a deadline for being hold. 

## Master election 

Master election is related to lock mechanisms but in a distributed system. 

A component that selects the master between multiple nodes is somehow the most important part of designing a distributed system. 

### Tools & Algorithms

There are some Algorithms like **Paxos** and **RAFT** for master election. But these algorithms are attractive for a undergraduate computer science course and may not be applicable in a high scale production environment. 

Some tools such as **etcd**, **ZooKeeper** and **consul** have been developed. These tools are key-value stores that perform a **compare-and-swap** operation. In these key-value stores you can put a time-to-live (TTL) for data.