# Design patterns

we have three types of design patterns : 

* Creational 
* Structural
* Behavrioral

## Behavioral
**Strategy pattern**  for exmaple in a jungle you have a class animal , and some classes named 
bird , lion and fish . 

The animal must have an abstract method move , and this move method
is implemented differently in each class . 

**State pattern** in this design practice , the class has 
some methods which return an object from that class . 

so after calling each method , the whole object goes into a 
new state . 

this design pattern is usefull when you write an usecase 
with long scenario . 
in this case you put each step into a method and change state init . 
then when you are executing the whole scenario it will be like this : 

```go
Agent.
	Step1().
	Step2().
	Step3()
```
* state and strategy pattern are so much alike and they have a little 
difference . ( that is definitely true , if this point is not obvious from your definition of 
strategy pattern , the correct your definition there .)

in state pattern , the state changes continuously , but in strategy pattern we don't
have any state changes . 
## Structural
one example is **singleton pattern** . in singleton pattern 
the constructor is private and cannot be called any time . 

consider we have a class with an attribute which cannot have 
more than one instance from .

so just one method is capable of instantiating that attribute 
and that method is written like this :
```java
public class Main {
  database DB ; 
  static void query() {
    if DB == null {
        DB = newDataBase();
    }
    // in other circumstances it should not be instantiated . 
  }
}
```

## Refrences 

https://refactoring.guru/design-patterns/catalog

