# Architecture

Architecture is a concept that exists in different layers. 
* In the code itself.
* In a project's packages.
* Between services in a microservice environment.

One architecture is among a project's packages. 

Normally at the bottom of each application's architecture is repository and at top of it there is handlers (http, cmq ,etc.)

There different types of architectures that a project can have. 

[two pictures]

## Factors

Software architecture has some factors that need to be considered while designing a system. 

**Complexity** is one of those factors. Complexity is not a good thing but most of the times it should be applied to achieve other factors. Other factors like **Reliability** and **Availability**.

For applications with background processing nature, availability is not a critical factor. Hence, they can be even single-node because downtime (even 2 or 3 minutes per day) may not be destructive.

## Software architecture scattered problems 

* seperating business logics from technical logics 
* Using legacy services without changing them

## Programming paradigms

- Structured
- Functional
- Object Oriented

I heard two other names, I don't know whether they are programming pardigms or not:
- Data oriented
- Dynamic

- Seperating buiness logic from app technical logic