# Domain

Domain is not less important that your technical knowledge. Employees in a tech company, from developer to director, should be dominant on system's domain.

In my mind, domain is the **design** of the system, but it's not that simple. It has many layers:

- **service to service**: By this title I mean service to service communication. When you are in a team, you should know that what is your place in the system (the company), what services you affect and what services affect you. If you provide a data, you should know exactly which teams are processing that data. 
    
    not only connections, but their type is important too (http, sdk, consuming, etc.)
    
    After understanding these, you should be able to know the **technical flow** very well. If you are not, perhaps you did something wrong. After technical flow, you should know the business logic very well too.
- **in a single service**: You should have this knowledge very accurate **just for** services in your team. This understanging consists of:
    - Project Deign. Including software architecture & Code patterns.
    - Stacks and their **configurations**: e.g. Redis, MaridaDB, Nats, Rabbit, etc.
    - Schema design in databases


## Managing level

Domain managing is one of the challenging part of software managing.

**Layer management**: Layers are main components of the system that you are managing, each step in main prodecedures in it. Domain managing is a big concept that I like to call **layer managing**. It's about three things: 
- making layers more **seperate**, and making their duties more **clear**. 
- Duties of two different layers should not **overlap**.
- And these layers should **look out for each other** and make their relations more beneficial. 

I think it contains the features and domains that each team owns. It can affect the way of developing that domain.

The higher your level goes in a company, the more general these layer get. When you are CTO of a company for example, layers are duties of different departments.

Remember the third rule in layer management, layers should look out for each other. This rule can lead to reducing the distance between product managers and engineers. In old Google's departments, product managers have a view of engineering and they are not like negotiating with engineers and they are moving along them. 

One of the problems in some of Iran's companies is the line that exists between product managers and developers. 