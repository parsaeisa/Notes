# MxNet

Here I wanted to right `step`s to write a dqn .This document has two sections : 
* [What we need ](https://github.com/parsaeisa/Notes/blob/main/AI/Deep%20Learning/mxnet.md#what-we-need)
* [Procedure](https://github.com/parsaeisa/Notes/blob/main/AI/Deep%20Learning/mxnet.md#procedure)

## What we need 

The Classes we need to define : 
* Environment
* Replay buffer

### Define classes

#### Environment

Has two main methods : 
* get_init_state
* step
* all local

The `step` method returns next_state, reward and done .

#### Replay buffer

Replay buffer is used to store an element which contains : 
* state
* next state
* action 
* reward
* done ( idk what it is )

It inherits `object` .

The data structure which is used is `Deque` in python . 

[A text about python deque](https://github.com/parsaeisa/Notes/blob/main/python.md#deque)

This class has two methods : 
* push
* sample 

The push obviously pushes the mentioned element to the buffer . In push method `np.expand_dims` is used for state and next state but I don't know why . 

* learn it later . 

The sample method gets a batch size as an agrument and randomly chooses elements in the count of batch size from buffer and returns them . 

usefull methods in `sample` method : random.sample , zip

### Use classes 

`nn` is in package mxnet.gluon .

We need : `nn.Sequential` then add layers to it using `nn.add` . 

layers : `nn.Dense` 

And we need `nn.initialize` to initialize the weights in the network . 

The trainer ( I think it is the agent ) :
```python
trainer = gluon.Trainer(net.collect_params(), 'sgd', {'learning_rate': 0.01})
```

Loss function : `loss.L2Loss()` , this loss has a backward method that should be called in the right moment . 

## Procedure 

In my first reinforcement learning practice [in this link](https://github.com/parsaeisa/Reinforcemnet_learning_first_prac) We get an initial state and then try all of actions to get to the next state . 

Then we obtain the best action by the value of the state that the action leads the agent to . 

Some procedures 

When the replay buffer is fulled , we call our loss function's backward prop and take an step with our trainer . 

I think the `trainer` is already defined in mxnet library and we don't need to write it from scratch . 

Some procedures 