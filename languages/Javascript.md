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
- `array.filter()`: Filters elements of an array with a condition. 
- `names.join(', ')`: concatenates all elements of an array with the seperator ', '

### Inline for loops for arrays

Javascript has a feature which can make for loops into one line:
```javascript
return Array.from({length: n}, (_, i) => "This is the element " + i)
```
I think the `Array.from` creates an array and gets a function as input to fill each element.  

Another example for creating 2d array:
```javascript
return Array.from({length: n}, (_, i) => Array.from({length: m}, (_, j) => i + j))
```

### An example of filter
For example this line counts the '1' characters in a binary string. 
```javascript
const countOnes = binary => [...binary].filter(bit => bit === '1').length;
```

## Difference between var and let

`var` is hoisted but `let` is not.
`var` is global but `let` is block scoped.

## Decorators

Decorators are a special types of syntax which modifies the behaviour of a method or a class. 

> Decorators are **not** natively supported in JavaScript without a transpiler like Babel or using TypeScript.

Install Babel with:
```bash
npm install --save-dev typescript
```
It has more steps, search for it later. 

Decorators can be a method:
```javascript
function a(){
    // behaviour
}

@a
// Other things
```

## Callbacks
Callbacks are functions that are passed to other functions and are the actions that should be performed at end of execution of thread. 

Example:
```javascript
function fetchData(callback) {
    setTimeout(() => {
        callback(null, "Data fetched");
    }, 1000);
}

fetchData((error, result) => {
    if (error) {
        console.log("Error occurred");
    } else {
        console.log(result);  // "Data fetched"
    }
});
```

They can be passed to a wide variaty of asynchronous operations like File I/O, network I/O, API I/O, etc. Example for event handling:
```javascript
document.getElementById("myButton").addEventListener("click", function() {
    console.log("Button was clicked!");
});
```

* Callbacks can be nested and lead to **callback hell** and that's why using promises makes the code more cleaner and managable. 

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

## Cool syntax

### typeof

You can get the type of a variable with `typeof` clause:
```javascript
if(typeof a == "string"){
    // operation
}
```

## Spread operator

Spread operator is `...` that you see everywhere. 

For strings, when it comes before the string, it converts the string into an array.
```javascript
arr = [...stringVar]
```

## Promises

Promis is an object which it's constructor takes a function as input. 

When calling the created object, we have three methods to handle the possible results of that function execution:
- `then`
- `catch`
- `finally`

```javascript
let myPromise = new Promise((/* arguments */) => { 
    // Method behaviour
});

myPromise
    .then(
        // function if the result was ok. 
    )
    .catch(
        // function if the result was an error. 
    )
```

## Where not to use async

A place where I always see that programmers put `async` is requesting to a third party service such as database, broker, external service, etc.

But most of other places I think is wrong to use.

The point is that any `async` needs an `await` and `await` stops the thread of current code block and it is not wanted. 

[ Read the rest from chat gpt ]