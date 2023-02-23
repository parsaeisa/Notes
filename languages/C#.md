# C - sharp

Here you can see topics of advanced programming course which I am a member in the TA team. 

The stack that courses was based on was **dotnet** and **C#** .

## Creating a project 

The command for starting a new dotnet project is dotnet new <template> . The template used in this course is `console`.

```bash
dotnet new console
```

After making a project try the command to check every thing is ok or not ( in the project directory ) : 
```bash
dotnet build
```

To run the project: 
```bash
dotnet run
```

Then in the another directory :

```bash
dotnet new sln --name MySolution
```

> In a directory you should have just one solution file or project. solution file and projects are the files that need to be built.

Then for adding the project to the solution : 
``` bash
dotnet sln MySolution.sln add .
```
## strings 

## File IO

For working with files, you should use the package below : 
```C#
using System.IO ;
```

First interaction to files is to write a word in a file:
```C#
string stdid = Console.ReadLine();
File.WriteAllText("stdlist.txt", stdid + "\n");
```

To read content from a file:
```C#
string content = File.ReadAllText(filename);
System.Console.WriteLine(content);
```
> Write `cw` and then vscode will print the `System.Console.WriteLine()` 

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
