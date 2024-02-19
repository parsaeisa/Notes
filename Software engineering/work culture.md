# Work culture 

As a software engineer what should I think about ? 

Give comments on product flows, think about them and try to find holes in it and make it better. 

## Domain 

Domain is not less important that your technical knowledge. Domain usually consists of: 

- Your team's projects' connections to world. Their kind (http, sdk, consuming, etc.) and their destination (other services)
- Project Deign. Including software architecture and schema design.
- Stacks and their configurations: e.g. Redis, MaridaDB, Nats, Rabbit, etc.
- Business & technical logic

One of the most important things in solution design sessions is internal events in the company. For example regulations set by each team. For example the DBA and the Cloud team may have some rules, they are your infrastucture so you should consider their rules.

### Where do tasks come from ? 

Based on my knowledge there are two sources of tasks:
- Business (product): When the business wants to increase the income so it tells product team to design new features.
- Technical bugs: When there is a logical bug on the production or when the load on a service increases and needs new actions to be scaled.

About the technical source, you should be engaged with a problem from the beginning, try to give ideas on it. Try to suggest tasks to undertake. 

Do not start reading about a task when it is assigned to you. Start sooner.


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
- Other resource is github starred projects by your friends.

Company's projects queue (out of team): 
- Golchin (matching algorithms)
- OAuth
- Hulk (using S3)
- Surge
- Morpheus

> Very obvious but critical point: more than 95 percent of issues come from the code itself. Even the deployments. Before asking Ahmad check the code carefully. 

## Expectations 

### Junior level
A junior developer is expected to know where each functionality is placed in the project code base.

So, if a bug happens on a project, he/she should find it immediately and fix it.  A juior developer should be dominant on **Business logic**.

### Mid-level

These are duties that I see our mid-levels have:
- Design, generally thinking about what to do ??
- Starting new projects

## Required

Required skills:
- Findinsg bugs immediately
- Learn new tools
- Be sharp
- Be productive

### Be productive
- Prioritize your tasks. don't work on more than one task at a time. (You can lower the time interval of working on different tasks to ** **)

#### Doing multiple tasks at the same time

There is no way that you can go deep into two tasks at the same time, and as a engineer you should go deep (Going deep to a task is not a responsibility of a **manager**).

So act like a computer processing-unit and make your time slotted. For example two hours on task A and one hour on task B. Make you slots less granular two like 5 hours on task A and 2 hours on task B.

### Finding bugds
* Refer to [Code reading](https://github.com/parsaeisa/Notes/blob/main/Software%20engineering/work%20culture.md#code-reading)

### Learn new tools
A junior should have **search and documents reading skills**.

A junior must be able to work with different tools (such as redis, rabbit, etc.) , to work with their dashboard or their cli or other things.

* As an example, sometimes there is a need to delete messages on a broker manually.

While **Searching**, when you open a link, read it completely or read it until you see that it's useless. then open new tabs and documents. **Don't open** too many tabs. 

> You always think about searching too late. Start it sooner.

### Be sharp

You do not have to always remember the business logic, but you should find it immediately in the code. 

- Try to give solutions all the time. (the solution can go beyond software engineering and go to other parts 
like QA, product, analyze, etc.)
    - You can also correct your manager, for example while breaking a task ( tasks' granularity)

A junior developer must always **consider team trends**. Try to follow, undertand & **remember** projects' **history**. Events like :
    - starting a project
    - Leaving a project undone
    - projects' situations
    - What is happening in the whole (technical and business logic) ? 
    - A logic's improvements and problems

What to follow:
- People's situation (are they sad or not? are they performing good or not?)
- Who are consumers ? which teams are using our team's package ? Who is calling our endpoints?
- What was the side effects of each action ? (you can predict the future side effects)
- Trend problems and their solutions

With keeping the tracks of projects, you can easily find **similar problems** while working on a solution.

> Always check your email and important group chats.

> Don't do anything in sessions. Just listen. Writing a document for sessions is helpful.

You should know the side-effects and consequences of any action. You can start from knowing side-effects of your own actions.

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
