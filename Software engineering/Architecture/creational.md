# Creational

## Patterns' relations

## Topics
- [Builder]()

## Builder 

The biggest challenge that builder pattern solves is a constructor with many arguments ( e.g. 10 arguments).

Some of them can be nill and it makes the client's code very ugly. 

So for each argument we can define a new method :

```go
type IBuilder interface {
    setWindowType()
    setDoorType()
    setNumFloor()
    getHouse() House
}
```

> Use the Builder pattern when you want your code to be able to create different representations of some product (for example, stone and wooden houses).

You have a series of actions for creating an object, Each object can choose some or all of them.

As an instance for making a house that has several properties, calling multiple methods can also be ugly. 

So we define a class called `director`, that calls desired methods in just one method.

```go
type Director struct {
    builder IBuilder
}

func newDirector(b IBuilder) *Director {
    return &Director{
        builder: b,
    }
}

func (d *Director) setBuilder(b IBuilder) {
    d.builder = b
}

func (d *Director) buildHouse() House {
    d.builder.setDoorType()
    d.builder.setWindowType()
    d.builder.setNumFloor()
    return d.builder.getHouse()
}
```

As you can see, the director object is assigned to each representation of a product. It takes a builder then makes the desired resault. 


At last the client only calls that one method from director class (`buildHouse`). 