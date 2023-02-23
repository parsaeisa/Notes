# C - sharp

Here you can see topics of advanced programming course which I am a member in the TA team. 

The stack that courses was based on was **dotnet** and **C#** .

## Creating a project 

```bash
dotnet new console
```

Then in the project directory :

```bash
dotnet new sln --name MySolution
```

Then for adding the project to the solution : 
``` bash
dotnet sln MySolution.sln add .
```
## strings 

## File IO

## exception handling

Errors happen all the time, an error can be a fatal error and cause suspension in our app which is not good. 

There is other things that we can do with errors, we can raise an exception for them and then handle them. 

### Keywords
* raise
* try
* except
* exception

### Exception
C# is an object oriented language, like java. Almost every entity you see is a class, And so the Exception. 

Exception has some behaviors that we can override them using inheritence . 

We can define our custom exception . 

### Raise
What do we do with exceptions ? we raise them and catch them in another place in the code. 

When an error is happening or an unwanted cyclomathic path has been taken, instead of halting the application we raise an exception.

### Try, except
Consider you called a method, which an exception was raised in because the behaviour that we didn't want to happen , happened.

Now we have an exception and we must catch it. We do it using try, except :
```C#
try:
    method()
except:

finally:

```

## enumeration
