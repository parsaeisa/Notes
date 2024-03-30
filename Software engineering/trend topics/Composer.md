# Composer

This document is about composer, the solution to one of our biggest problems. 

## How to create such idea ? 

- When your service has multiple scenarios, try to find patterns between them. The pattern should cover new scenarios that product team will provide. This pattern should be very basic and fundamental. Consider the gole of those scenarios. 
- Making the logic more in a step-by-step manner, makes it more reliable. 
- Sacrifice. For example, when **availability** is not a concern for your design, it is ok to make expensive external service call even in the case that they are not so mandatory. 