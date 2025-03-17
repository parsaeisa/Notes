# Javascript

Good documents for Javascriot:
- https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide
- https://javascript.info/

**You can see the document about type script in bottom of this document. **

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

### Enum

We have `const enum`s. Which can't be set a the type of a database entity column. 

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

## Datastructures
### Array

- `array.push(element)`: adds to the end.
- `array.unshift(element)`: adds to the beginning.
- `array.pop()`: Removes from the end.
- `array.shift()`: Removes from the beginning.
- `array.splice(index, count)`: Removes elements at a specific index.
- `array.filter()`: Filters elements of an array with a condition ( decides whether an element remain or not). 
- `array.map()`: It applies a function to all elements in an array.
- `array.indexOf()`: It can find the index of an element or even of a substring.
- `array.lastIndexOf()`: It can find the last occurrance of an element or even of a substring.
- `names.join(', ')`: concatenates all elements of an array with the seperator ', '

#### Inline for loops for arrays

Javascript has a feature which can make for loops into one line:
```javascript
return Array.from({length: n}, (_, i) => "This is the element " + i)
```
I think the `Array.from` creates an array and gets a function as input to fill each element.  

Another example for creating 2d array:
```javascript
return Array.from({length: n}, (_, i) => Array.from({length: m}, (_, j) => i + j))
```

#### An example of .filter
For example this line counts the '1' characters in a binary string. 
```javascript
const countOnes = binary => [...binary].filter(bit => bit === '1').length;
```
#### An example of .map

Putting ')' for every character which more than one count, and putting '(' for the others.

```javascript
const encoded = [...word].map(c => {
    if(charCount[c] > 1){
      return ')';
    } else {
      return '(';
    }
  });
```

#### Map Reduce
You know about the map reduce mindset. It can be applied on arrays, threads and in an upper layer on multiple services in an event-driven architecture. 

Here's just a simple example of extracting the sum of squares of elements of an array:
```javascript
const numbers = [1, 2, 3, 4]
const sumOfSquares = numbers.map(num => num * num).reduce((a, b) => a+b, 0)
```

The statement `.reduce((a, b) => a+b, 0)` is common for summing elements in an array. 

### Object literal

Object literal serves the same purpose as **maps** in golang.

It allow you to store key-value pairs. 
```javascript
const kvPair = {
    0: 'element 0',
    1: 'element 1',
    2: 'element 2',
    3: 'element 3',
    4: 'element 4',
}

const person = {
    "firstName": "John",
    "lastName": "Doe",
    "age": 30,
    "job": "Software Engineer"
};
```

* Object literals can sometimes act as switch-case statements. Where the **case** can come in the place of **keys**.

Adding key-value to objects when the key doesn't exist:
```javascript
person["new-key"] = "new-value"
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

### Spread operator

Spread operator is `...` that you see everywhere. 

For strings, when it comes before the string, it converts the string into an array.
```javascript
arr = [...stringVar]
```

### For loop

For iterating on a string:
```javascript
for (let char of str) {}
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

Whenever the return type of a method is `Promise< any type(s)>`, I think the method should have `async` at first of it when you want to get those types (in `Promise`) you should probably forgot to put `await` at the beginning of calling this method.

## Where not to use async

A place where I always see that programmers put `async` is requesting to a third party service such as database, broker, external service, etc.

But most of other places I think is wrong to use.

The point is that any `async` needs an `await` and `await` stops the thread of current code block and it is not wanted. 

[ Read the rest from chat gpt ]

## Third party tools

### faker
This is used for creating fake objects. Creating fake objects is usefull while writing unit and integration tests. 
```javascript
import { faker } from "@faker-js/faker";

const user = User.withNamedParameters({
    email: faker.internet.email(),
    name: faker.name.firstName(),
    phoneNumber: faker.phone.number("+49 91 ### ## ##"),
});
```

### SwaggerAutogen

For creating swagger for your project you use `swaggerAutogen` like this:
```javascript
const swaggerAutogen = require("swagger-autogen")({ openapi: "3.0.0" });
```

## Writing tests

### Mocking

Methods to learn:
- `jest.restoreAllMocks()`
- `jest.clearAllMocks()`

I think for putting expectations and mocking a method we can simply use `jest.fn()`. For example:
```javascript
AppDataSource: {
    getRepository: jest.fn(),
}
```

We can mock a **whole file** ( or class in a file ) using `jest.mock` with the code below:
```javascript
jest.mock('path to file', () => (/* mocked behavour */));
```

And a complete example of mocking a class:
```javascript
class MockEmailVerification {
	code: string;
	user: User;

	constructor(user: User) {
		this.code = "123456";
		this.user = user;
	}
}

// Mock the entire EmailVerification class
jest.mock("path/to/file", () => {
	return jest.fn().mockImplementation(/* This should be similar to constructor */(user) => {
		return new MockEmailVerification(user);
	});
});
```
After these lines, if you instantiate the `EmailVerificationClass` in normal way (`const email = new EmailVerification()`), You will get the mocked one. 

The first thing that comes to mind when mocking a method is the code below:
```javascript
const mock = jest.spyOn(<Your class>.prototype as any, "<Your method name>");
			mock.mockResolvedValueOnce(() => Promise.resolve());

// Here you can put your expectations on mock ( Created top of the code )
// For example:
expect(sendEmailMock).toHaveBeenCalled();
```


### Tricks
 
To see how many times a method was called:
```javascript
expect(yourMethodMock.mock.calls.length).toBe(0);
```

## Built-in methods

### Interval

Intervals are functions that are executed periodically. They start with `setInterval(()=>{})` and they are deleted by `clearInterval`.
```javascript
const intervalId = setInterval(() => {
    console.log("This runs every 5 seconds");
}, 5000);

clearInterval(intervalId);
```

# Typescript

I don't know complete differences between javascript and typescript, I just write here things which I'm sure only exist in Typescript.

That's correct! In JavaScript, you can't explicitly define types for variables, which means type safety and type checks are not enforced. This can lead to runtime errors if you use variables in unexpected ways.

We can define types for variables like this:
```javascript
const var_name: <vartype> = <value>;
```

## Third party tools

### ts-node

It is a Node.js tool that allows you to directly run TypeScript 
files without needing to compile them to JavaScript first. It acts as both a runtime and a **REPL (Read-Eval-Print Loop)** for TypeScript.