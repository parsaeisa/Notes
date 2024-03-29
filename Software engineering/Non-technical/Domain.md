# Domain

Domain is not less important that your technical knowledge. Employees in a tech company, from developer to director, should be dominant on system's domain.

In my mind, domain is the **design** of the system, but it's not that simple. It has many layers:

- **service to service**: By this title I mean service to service communication. When you are in a team, you should know that what is your place in the system (the company), what services you affect and what services affect you. If you provide a data, you should know exactly which teams are processing that data. 
    
    not only connections, but their type is important too (http, sdk, consuming, etc.)
    
    After understanding these, you should be able to know the **technical flow** very well. If you are not, perhaps you did something wrong. After technical flow, you should know the business logic very well too.
- **in a single service**: You should have this knowledge very accurate **just for** services in your team. This understanging consists of:
    - Project Deign. Including software architecture. Code patterns.
    - Stacks and their configurations: e.g. Redis, MaridaDB, Nats, Rabbit, etc.
    - Schema design in databases

One of the most important things in solution design sessions is internal events in the company. For example regulations set by each team. For example the DBA and the Cloud team may have some rules, they are your infrastucture so you should consider their rules.


## Managing level

Domain managing is one of the challenging part of software managing.

**Layer management**: Domain managing is a big concept that I like to call **layer managing**. It's about making layers more **seperate**, and making their duties more **clear**. Duties of two different layers should not **overlap**.

I think it contains the features and domains that each team owns. It can affect the way of developing that domain.