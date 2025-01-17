# Work culture 

As a software engineer what should I think about?

As I thinked with my-self very earlier, All tasks are divided into two group:
- Creating new features
- Make old features sustainable

Making features sustainable can even be related to changing company cultures.

Give comments on product flows, think about them and try to find holes in it and make it better. 

## Coding

> Trying to write a protocol or a database or another famous tool can be thriving.

> Before the solution design session for a new feature try to find out how it should be implemented.

### Code reading 

A wise man one said that the ratio of code reading to code writing should be around 9 to 1.

You can get so much ideas from other projects. Most of the times, finding similar problems in projects is the **solution design** and **R&D**.

> Always start from project's interface and go deeper.

Reading the code of a new project is a skill that you should have. --> You should understand it's layers and go from top (the interface layer) to the bottom. There some sources that you can read:

- Read different projects in the firm. You can see their tricks & best practices. For finding different functionalities in code base, only remember the project's connection to outside world ( http handlers, cmq handler, etc.) and start traversing from there. 
- When you are working with a tool (like sqlx), read it's structure. For example in echo if you see `s.GET` in your code, start traversing from `GET` method by Command + Click and go deep. 
    - This can lead to finding good parameters and arguments and configurations while using an API.
- Other resource is github starred projects by your friends.

Company's projects queue (out of team): 
- Golchin (matching algorithms)
- OAuth
- Surge
- Morpheus
- Pushman ( as a project working with web-engage)
- Dehkhoda

> Very obvious but critical point: more than 95 percent of issues come from the code itself. Even the deployments. Before asking Ahmad check the code carefully. 

## Expectations 

### Junior level
A junior developer is expected to know where each functionality is placed in the project code base.

So, if a bug happens on a project, he/she should find it immediately and fix it.  A juior developer should be dominant on **Business logic**.

### Mid-level

These are duties that I see our mid-levels have:
- Design, generally thinking about what to do ??
- Starting new projects

### Leading level

I think in a leading level, the developer (?!) should checks the services' health **overally**. Think again about the division given in the first of this document. A leader in the first place should:
- **Creating new features:** Think how to plan implementing new features:
    - Divide tasks between team members carefully. You should adjust the granularity of tasks.
    - Each features that needs to be implemented has a priority and a manager should schedule their implementations carefully.
- **Making old features sustaible**: 
    - Monitor services, check their health
    - Think about improvements.
    - And think about the feasibility of those improvements based on the resources
        * resources are mainly time and team members. These two factors specify the priority

Then the leader must break the problem to smaller ones (it can be accomplished by a meeting with team members) and dispatch them between team members. He must see:
- Members unboardings
- Their recent tasks
- Their Desire

## Required

Against the mindset that nowadays media are providing, anything is not simple :))

There is no core mindset that if you reach it you would be a senior software engineer. You need to know many points in many context. I try to list those contexts here but of course they are not complete. 

Required skills:
- Understand the technical flow
- Learn new tools
- Be sharp
- Be productive
- Have good communication With others

### Be productive
- Prioritize your tasks. don't work on more than one task at a time. (You can lower the time interval of working on different tasks)

#### Doing multiple tasks at the same time

There is no way that you can go deep into two tasks at the same time, and as a engineer you should go deep (Going deep to a task is not a responsibility of a **manager**).

So act like a computer processing-unit and make your time slotted. For example two hours on task A and one hour on task B. Make you slots less granular two like 5 hours on task A and 2 hours on task B.

### Understand technical flow
* Refer to [Code reading](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/work%20culture.md#code-reading)
When you understand the technical flow you will find bugs immediately. Code reading is important but there is not a code block which has the logic always. Most of the times the logic is distributed over multiple servers and code bases.

When you know this fact, you can find race conditions and mutual exclusions which may affect the business logic. For knowing the technical flow you have to know different teams, their services, their roles and their logics. 

After understanding the technical flow, you can think about side effects more efficiently.

### Learn new tools
A junior should have **search and documents reading skills**.

A junior must be able to work with different tools (such as redis, rabbit, etc.) , to work with their dashboard or their cli or other things.

* As an example, sometimes there is a need to delete messages on a broker manually.

While **Searching**, when you open a link, read it completely or read it until you see that it's useless. then open new tabs and documents. **Don't open** too many tabs. 

> You always think about searching too late. Start it sooner.

### Be sharp

You do not have to always remember the business logic, but you should find it immediately in the code. 

One of the factors of being sharp, is being dominant on domain. Which is discussed [here](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/Non-technical/Domain.md).

- Try to give solutions all the time. (the solution can go beyond software engineering and go to other parts 
like QA, product, analyze, etc.)
    - You can also correct your manager, for example while breaking a task ( tasks' granularity)

You must always **consider team trends**. Try to follow, undertand & **remember** projects' **history**. Events like :
- starting a project
- Leaving a project undone
- projects' situations
- What is happening in the whole (technical and business logic) ? 
- A logic's improvements and problems

What to follow:
- People's situation (are they sad or not? are they performing good or not?)
- Who are consumers ? which teams are using our team's package ? Who is calling our endpoints?
- What was the side effects of each action ? (you can predict the future side effects)
- Trend problems and their solutions, problems normally are:
    - incidents
    - features
    - refactorings
- One of the most important things in solution design sessions is internal events in the company. For example regulations set by each team. For example the DBA and the Cloud team may have some rules, they are your infrastucture so you should consider their rules. DBA, cloud, or any team that you have dependency on. 

With keeping the tracks of projects, you can easily find **similar problems** while working on a solution.

> Always check your email and important group chats.

> Don't do anything in sessions. Just listen. Writing a document for sessions is helpful.

#### Where do tasks come from ? 

Based on my knowledge there are two sources of tasks:
- Business (product): When the business wants to increase the income so it tells product team to design new features.
- Technical bugs: When there is a logical bug on the production or when the load on a service increases and needs new actions to be scaled.

About the technical source, you should be engaged with a problem from the beginning, try to give ideas on it. Try to suggest tasks to undertake. 

Do not start reading about a task when it is assigned to you. Start sooner.


### Good communication

You going to have dependency to many people in a tech company. This dependency can be reviewing a merge request, thinking about a problem, develop an API, etc. The people who you are depending on may not do the task very soon, you have to follow up. 

First thing when someone doesn't do the job is offering a help. 

Always have friendly tone of voice and open body language.

## Mindset
### About yourself

Always attitude like you are **Badass** and **Cool**. Know that your time and your efforts are valuable. Never show yourself weak. 

If a bug is raised to your projects, say "I need time to work on this bug" and do not show yourself Natch.

Do your job like it's your **every day routine**. For a senior developer learning new things is also an every day routine. 

### Teamwork mindset

The atomicity in a software company is **team** not **person**. 

If you have a solution that you strongly think that is correct, it is not necessarily applied if other team members are not agree with it. (Even don't insist too much).

If a facinating task must be delivered in the team, your concern should be meeting the deadline of that task regardless to it's assigned developer. (Personnaly I always wanted to do facinating tasks myself, this concern is wrong)

Even If you have enough tasks and you do not have free time, feel free to reject a new task that arrives.
