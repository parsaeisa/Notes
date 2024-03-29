# Managing

In one word, a manager is expected to **achieve some big objectives** using the **resources** that he or she has. 

Resources are:
- People
- Time
- Authorities (e.g. accesses)

A manager's concerns : 
* Team non-financial resources (technical level, energy & time)
* Testing services
* Request loads

## Supply-Demand balance

I only know the title :) 

I will fill this section.

I only know that this is a very high level management term.

## Non-financial resources

Developer's time and energy are the most valuable items in a team. So we should save them.

## Objectives

While picking items for next quarter in the GAP, there are some objectives that can be considered to achieve:
- Stability
- Radical testing efficiency and better testing
- Onboarding, HR and documentation improvements
- Database optimization
- Reduce resource consumption
- Better observability
- Managing layers (this concept is investigated in domain section in this document)

### Automation

Automating process can save time. It requires a little amount of development cost but it's just one time.

Tools for automating : 
* gitlab pipelines
* Generating codes (for example repositories that have no point in their writing )
* Test automation 

#### Test automation

The whole idea is to write another application that tests all possible scenarios on the target application.

In the pipelines before deploying all those scenarios are being tested. After the testing is completed, all the allocated resources for testing the application should be deallocated gracefully. 

The QA layer of a firm should not be totally seperated from developer layer. Some developers think that they only develop the code and the QA must test all scenarios. But QA has a resource (for example time) for itself and it's better to empty that resource for them. 

Hence, it's better to test scenarios in an automated manner as much as possible. 

## A project's stacks 

For example for adding a redis to a project, there should be enough reasons, if redis hashset is usefull in just one handler, it's maintenance and concerns should not be added to the project. 

## People management

People management requires **soft skill** the most. 

An company's load shouldn't be on **just one person**, because in the case of leaving that one person, responsibilities are not taken by anyone. 

Due to this fact, do not assign a service to just one person . Every member in team should contribute on every service that is owned by our team .

## Scattered points

* When you take a technology in an enterprise app, you should cusotmise that thechnology .

For example wrap echo framework in another framework that behaves like your company wants . 

* Divide tasks between team members carefully. You should adjust the granularity of tasks.

* Each features that needs to be implemented has a priority and a manager should schedule their implementations carefully.

Sometimes we don't know whether a policy or action is good or not. Sometimes we can stop thinking & investigating and test it for a while. For example in the case of features, we roll it out in buckets. These two are related.

* Layers in a company are not seperated from each other. Each layer should consider other layers resources (hard & soft resources). You can see an example of cooperating between devlopers & QA layer in the **test automation** section of this document.

* Sometimes, when a features is rolled out, it may have lower requests and load rather than other features. Product team can test their new features, their income and impact through this new rolled out feature. 

* Sometimes, a project, can be very busy by its heavy features. This can make it hard for that service to be improved So I think the management team (including engineering managers, directors) go to the way of handovering its features to other and even new services. 

## Domain 

Domain managing is one of the challenging part of software managing.

Concepts introduced in this section are useful in so many levels, from development level to director level:

**Connections**: When you are in a team, you should know that what is your place in the system (the company), what services you affect and what services affect you. If you provide a data, you should know exactly which teams are processing that data. 

**Layer management**: Domain managing is a big concept that I like to call **layer managing**. It's about making layers more **seperate**, and making their duties more **clear**. Duties of two different layers should not **overlap**.

I think it contains the features and domains that each team owns. It can affect the way of developing that domain.