# Master election 

A component that selects the master between multiple nodes is somehow the most important part of designing a distributed system. 

## Tools & Algorithms

There are some Algorithms like **Paxos** and **RAFT** for master election. But these algorithms are attractive for a undergraduate computer science course and may not be applicable in a high scale production environment. 

Some tools such as **etcd**, **ZooKeeper** and **consul** have been developed. These tools are key-value stores that perform a **compare-and-swap** operation. In these key-value stores you can put a time-to-live (TTL) for data.