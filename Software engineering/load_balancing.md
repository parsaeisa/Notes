# Load balancing

## Simple algorithms 
A very beautiful link on this topic (with animation) : https://samwho.dev/load-balancing/

I think the main challenge in loadbalancing is this point : 

**Servers cannot accept a new request while they are processing another request(s).**

With adding buffer (task queue) we can tackle this issue a little but I think the mindset of the **busy server** is why we adopt different load-balancing algorithms. 

#### Aging
As you remember we had a priority queue in OS course in university. In that strategy a task with lower priority could wait a long time. 

In this case the task is aged and it's priority goes higher.

### Round robin 
With round robin algorithm, the load-balancer distributes the request equally among servers, it is a very simple algorithm but it has a little problem.
 
It doesn't care about the : **Variance** 

There are 2 facts : 
- Servers are not always equally **powerfull**
- Requests that are distributing between servers are not equally **Expensive**



### Weighed round robin 

### Least connection