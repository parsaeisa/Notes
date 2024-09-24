# Javascript

Good documents for Javascriot:
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide
- https://javascript.info/

The main feature of javascript is it's **event-driven** and **non-blocking I/O model**. 
Particularly it has:
- callbacks
- promises
- async/await.

**Hoisting:** Hoisting is a mechanism in Javascript which moves the variable declarations at the top of a block while compiling it. This means you can reference functions and variables **before** declaring them.

The difference between `==` and `===` : 
```javascript
let isEqual = (5 == '5'); // true
let isStrictEqual = (5 === '5'); // false
```

## To learn:

What are decorators ?


## Datatypes

Javascript has **Number** and **BigInt**. So it doesn't have int, int8, float, etc.

**Undefined** is a variable which has been initiated but doesn't have a value. So it is not equal to **Null**.

## Functions

In the case of functions we have two things:
- Declaration
- Expression

Declaration: 
```javascript
function myFunction() {
    // code
}
```
Expression
```javascript
const myFunction = function() {
    // code
}
```

The declaration is **hoisted**. 

### Arrow functions

More concise way to write a function and cleaner choice for one-liner functions: 
```javascript
const add = (a, b) => a + b;
```

This line creates a function called `add` which adds two number. 

- They have different approach to `this`.
- Cannot be used as constructors
- Don't have access to arguments (what are arguments).

## Array

- `array.push(element)`: adds to the end.
- `array.unshift(element)`: adds to the beginning.
- `array.pop()`: Removes from the end.
- `array.shift()`: Removes from the beginning.
- `array.splice(index, count)`: Removes elements at a specific index.

## Difference between var and let

`var` is hoisted but `let` is not.
`var` is global but `let` is block scoped.

## Closure

Closure is a function which is defined in another function and then is returned by that function.

```javascript
function multiplyBy(multiplier) {
    return function(number) {
        return number * multiplier;
    };
}
```
The inner function is closure and it can **remember** variables which were defined in it's outer function (`multiplier`). It is used like this: 

```javascript
const multiplyByTwo = multiplyBy(2);
console.log(multiplyByTwo(5)); // Output: 10
```

A point of view is that a function can act as a class with one property and that one property can be accessed through the closure. Look at this example:
```javascript
function counter() {
    let count = 0; // Private variable

    return function() {
        count++;
        console.log(count);
    };
}

const increment = counter();
increment(); // Output: 1
increment(); // Output: 2

const anotherCounter = counter();
anotherCounter(); // Output: 1
```



## To learn:

What are decorators ?