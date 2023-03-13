# Managing

When you take a technology in an enterprise app, you should cusotmise that thechnology .

For example wrap echo framework in another framework that behaves like your company wants . 

Do not assign a service to just one person . Every member in team should contribute on every service that is owned by our team .


## Domain 
Domain managing is one of the challenging part of software managing.

I think it contains the features and domains that each team owns. It can affect the way of developing that domain.

## Dismantling 

When you want to dismantle a logic from monolith here are steps : 
- At first look at the dependencies that the logic has ( consider the monolith as a black-box )
- Call to the corresponding team and ask them to provide that dependencies
- Show them to product managers (I think this is in order to not touch the domain )
- Show them to QA and and developers 
- start developing the new service

Don't improve the logic while you are dismantling it. 

After that your team owned the logic the start to making it better.